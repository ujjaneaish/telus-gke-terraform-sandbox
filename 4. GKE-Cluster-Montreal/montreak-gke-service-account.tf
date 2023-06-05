resource "google_service_account" "montreal_gke_sa" {
  account_id   = "montreal-gke-sa"
  display_name = "montreal GKE Service Account"
}

resource "google_project_iam_binding" "bind_montreal_gke_sa_to_artifact_registry" {
  project = var.gcp-project-id
  role    = "roles/artifactregistry.writer"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding" {
  project = var.gcp-project-id
  role    = "roles/compute.viewer"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_securityAdmin" {
  project = var.gcp-project-id
  role    = "roles/compute.securityAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_clusterAdmin" {
  project = var.gcp-project-id
  role    = "roles/container.clusterAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_developer" {
  project = var.gcp-project-id
  role    = "roles/container.developer"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_saAdmin" {
  project = var.gcp-project-id
  role    = "roles/iam.serviceAccountAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_saUser" {
  project = var.gcp-project-id
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}

resource "google_project_iam_binding" "montreal_gke_sa_binding_projectIamAdmin" {
  project = var.gcp-project-id
  role    = "roles/resourcemanager.projectIamAdmin"
  members = ["serviceAccount:${google_service_account.montreal_gke_sa.email}"]
}



