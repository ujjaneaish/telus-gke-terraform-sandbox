
resource "google_compute_network_peering" "peering1" {
  name         = "toronto-to-montreal-peering-1"
  network      = google_compute_network.toronto-vpc.self_link
  peer_network = google_compute_network.montreal-vpc.self_link
}

resource "google_compute_network_peering" "peering2" {
  name         = "montreal-to-toronto-peering-2"
  network      = google_compute_network.montreal-vpc.self_link
  peer_network = google_compute_network.toronto-vpc.self_link

}
