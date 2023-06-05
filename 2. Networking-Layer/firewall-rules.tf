######################### INGRESS ###################################
resource "google_compute_firewall" "montreal-to-toronto-ingress" {
  name    = "montreal-to-toronto-ingress"
  network = google_compute_network.toronto-vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  source_ranges = [
    "172.16.0.0/16",
    "192.168.64.0/18",
    "192.168.128.0/17",
  ]

  direction = "INGRESS"
}

resource "google_compute_firewall" "toronto-to-montreal-ingress" {
  name    = "toronto-to-montreal-ingress"
  network = google_compute_network.montreal-vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  source_ranges = [
    "10.1.0.0/16",
    "10.2.0.0/17",
    "10.2.128.0/17",
  ]

  direction = "INGRESS"
}



######################### EGRESS ###################################

resource "google_compute_firewall" "montreal-to-toronto-egress" {
  name    = "montreal-to-toronto-egress"
  network = google_compute_network.montreal-vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  source_ranges = ["172.16.0.0/16", "192.168.64.0/18", "192.168.128.0/17",  ]

  destination_ranges = ["10.1.0.0/16", "10.2.0.0/17", "10.2.128.0/17",  ]

  direction = "EGRESS"
}

resource "google_compute_firewall" "toronto-to-montreal-egress" {
  name    = "toronto-to-montreal-egress"
  network = google_compute_network.toronto-vpc.self_link

  allow {
    protocol = "tcp"
    ports    = ["1-65535"]
  }

  source_ranges = [    "10.1.0.0/16",    "10.2.0.0/17",    "10.2.128.0/17",  ]

  destination_ranges = [    "172.16.0.0/16",    "192.168.64.0/18",    "192.168.128.0/17",  ]

  direction = "EGRESS"
}
