resource "google_service_account" "toronto_gke_sa" {
  account_id   = "toronto-gke-sa"
  display_name = "Toronto GKE Service Account"
}


resource "google_project_iam_binding" "bind_toronto_gke_sa_to_artifact_registry" {
  project = "pd-sandbox-project-388413"
  role    = "roles/artifactregistry.writer"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding" {
  project = "pd-sandbox-project-388413"
  role    = "roles/compute.viewer"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_securityAdmin" {
  project = "pd-sandbox-project-388413"
  role    = "roles/compute.securityAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_clusterAdmin" {
  project = "pd-sandbox-project-388413"
  role    = "roles/container.clusterAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_developer" {
  project = "pd-sandbox-project-388413"
  role    = "roles/container.developer"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_saAdmin" {
  project = "pd-sandbox-project-388413"
  role    = "roles/iam.serviceAccountAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_saUser" {
  project = "pd-sandbox-project-388413"
  role    = "roles/iam.serviceAccountUser"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}

resource "google_project_iam_binding" "toronto_gke_sa_binding_projectIamAdmin" {
  project = "pd-sandbox-project-388413"
  role    = "roles/resourcemanager.projectIamAdmin"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}


resource "google_project_iam_binding" "secrets_manager_access" {
  role    = "roles/secretmanager.secretAccessor"
  project = "pd-sandbox-project-388413"
  members = ["serviceAccount:${google_service_account.toronto_gke_sa.email}"]
}
