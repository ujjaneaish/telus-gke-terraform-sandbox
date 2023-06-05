#https://cloud.google.com/kubernetes-engine/docs/how-to/multi-cluster-services
#Enables the MCS, fleet (hub), Resource Manager, Traffic Director, and Cloud DNS APIs:
resource "google_project_service" "multiclusterservicediscovery" {
  project = "pd-sandbox-project-388413"
  service = "multiclusterservicediscovery.googleapis.com"
}

resource "google_project_service" "gkehub" {
  project = "pd-sandbox-project-388413"
  service = "gkehub.googleapis.com"
}

resource "google_project_service" "trafficdirector" {
  project = "pd-sandbox-project-388413"
  service = "trafficdirector.googleapis.com"
}

resource "google_project_service" "dns" {
  project = "pd-sandbox-project-388413"
  service = "dns.googleapis.com"
}

