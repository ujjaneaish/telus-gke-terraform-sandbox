#resource "google_project_iam_binding" "pingdirectory_network_viewer" {
#  project = var.gcp-project-id
#  role    = "roles/compute.networkViewer"
#  members = [
#    "serviceAccount:pingdirectory-358917.svc.id.goog[gke-mcs/gke-mcs-importer]"
#  ]
#}

resource "google_project_iam_member" "pingdirectory_network_viewer" {
  project = var.gcp-project-id
  role    = "roles/compute.networkViewer"
  member  = "serviceAccount:${google_service_account.pingdirectory_service_account.email}"
}

resource "google_service_account" "pingdirectory_service_account" {
  account_id   = "gke-mcs-importer"
  display_name = "GKE MCS Importer"
  project      = var.gcp-project-id
}


resource "google_project_iam_binding" "pingdirectory_network_viewer" {
  project = var.gcp-project-id
  role    = "roles/compute.networkViewer"
  members = [
    "serviceAccount:${google_service_account.pingdirectory_service_account.email}"
  ]
}
