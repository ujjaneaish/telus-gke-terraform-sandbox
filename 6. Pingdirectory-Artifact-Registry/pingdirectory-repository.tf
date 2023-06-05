resource "google_artifact_registry_repository" "telus-docker-repo" {
  location = "northamerica-northeast1"
  repository_id = "telus-pingdirectory-docker-images"
  description = "to host custom docker images created by google cloud build to be used by ping pods on GKE"
  format = "DOCKER"
  project = var.gcp-project-id

}

variable "gcp-project-id" {
  description = "The GCP Project where the resources will be deployed"
  type        = string
  default     = "likeminds-internal-sandbox"
}
