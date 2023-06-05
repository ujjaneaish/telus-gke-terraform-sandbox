
#https://cloud.google.com/kubernetes-engine/docs/how-to/multi-cluster-services
#Enables the MCS, fleet (hub), Resource Manager, Traffic Director, and Cloud DNS APIs:
resource "google_project_service" "multiclusterservicediscovery" {
  project = "pingdirectory-358917"
  service = "multiclusterservicediscovery.googleapis.com"
}

resource "google_project_service" "gkehub" {
  project = "pingdirectory-358917"
  service = "gkehub.googleapis.com"
}

resource "google_project_service" "trafficdirector" {
  project = "pingdirectory-358917"
  service = "trafficdirector.googleapis.com"
}

resource "google_project_service" "dns" {
  project = "pingdirectory-358917"
  service = "dns.googleapis.com"
}

