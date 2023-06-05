# google_client_config and kubernetes provider must be explicitly specified like the following.
data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = "pd-sandbox-project-388413"
  name                       = "toronto-gke-cluster"
  region                     = "northamerica-northeast2"
  zones                      = ["northamerica-northeast2-a"]
  network                    = "toronto-prod-vpc-network"
  subnetwork                 = "toronto-prod-subnetwork"
  ip_range_pods              = "toronto-prod-pod-ip-range-1"
  ip_range_services          = "toronto-prod-service-ip-range-2"
  http_load_balancing        = true
  network_policy             = true
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  grant_registry_access      = true   #enable access to GCP container registries in the project. Creates SA
  registry_project_ids       = ["pd-sandbox-project-388413"] #specify project
  enable_shielded_nodes      = true
  gke_backup_agent_config	   = true
  release_channel            = "STABLE"

  node_pools = [
    {
      name                      = "ping-stack-node-pool"
      machine_type              = "e2-standard-2"
      node_locations            = "northamerica-northeast2-a"
      min_count                 = 1
      max_count                 = 3
      local_ssd_count           = 0
      spot                      = true #needs to be changed in a prod-environment
      disk_size_gb              = 25
      disk_type                 = "pd-ssd"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      enable_gvnic              = false
      auto_repair               = true
      auto_upgrade              = true #changed to false
      version                   = "1.24.11-gke.1000"
      service_account           = "toronto-gke-sa@pingdirectory-358917.iam.gserviceaccount.com"
      preemptible               = false
      initial_node_count        = 1
      autoscaling               = true
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "ping-production-nodepool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "ping-production-nodepool",
    ]
  }
}
