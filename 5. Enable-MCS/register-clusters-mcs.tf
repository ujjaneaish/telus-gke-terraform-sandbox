
#TORONTO GKE CLUSTER MEMBERSHIP
resource "google_gke_hub_membership" "toronto_cluster_membership" {
  provider = google-beta
  project = var.gcp-project-id
  membership_id = "toronto-gke-cluster-mcs-membership"
  endpoint {
    gke_cluster {
     resource_link = "//container.googleapis.com/projects/pingdirectory-358917/locations/northamerica-northeast2/clusters/toronto-gke-cluster"
    }
  }
}

#MONTREAL GKE CLUSTER MEMBERSHIP

resource "google_gke_hub_membership" "montreal_cluster_membership" {
  provider = google-beta
  project = var.gcp-project-id
  membership_id = "montreal-gke-cluster-mcs-membership"
  endpoint {
    gke_cluster {
     resource_link = "//container.googleapis.com/projects/pingdirectory-358917/locations/northamerica-northeast1/clusters/gke-montreal-cluster"
    }
  }
}
