#########################TORONTO VPC AND SUBNET###################################

resource "google_compute_subnetwork" "toronto_sub_net" {
  name          = "toronto-prod-subnetwork"
  ip_cidr_range = "10.1.0.0/16"
  region        = "northamerica-northeast2" #Toronto, Ontario, North America
  network       = google_compute_network.toronto-vpc.id

  secondary_ip_range {
    range_name = "toronto-prod-pod-ip-range-1"
    ip_cidr_range = "10.2.0.0/17"
  }

  secondary_ip_range {
    range_name = "toronto-prod-service-ip-range-2"
    ip_cidr_range = "10.2.128.0/17"
  }
}

resource "google_compute_network" "toronto-vpc" {
  name                    = "toronto-prod-vpc-network"
  auto_create_subnetworks = false
}
#########################MONTREAL VPC AND SUBNET###################################

resource "google_compute_subnetwork" "montreal_sub_net" {
  name          = "montreal-prod-subnetwork"
  ip_cidr_range = "172.16.0.0/16"
  region        = "northamerica-northeast1" #Montréal, Québec, North America
  network       = google_compute_network.montreal-vpc.id

  secondary_ip_range {
    range_name = "montreal-prod-pod-ip-range-1"
    ip_cidr_range = "192.168.64.0/18"
  }

  secondary_ip_range {
    range_name = "montreal-prod-service-ip-range-2"
    ip_cidr_range = "192.168.128.0/17"
  }
}

resource "google_compute_network" "montreal-vpc" {
  name                    = "montreal-prod-vpc-network"
  auto_create_subnetworks = false
}