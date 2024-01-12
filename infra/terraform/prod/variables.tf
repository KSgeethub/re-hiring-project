variable "gcp_credentials_file" {
  description = "The GCP credentials file"
  type        = string
}

variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
}

variable "image_tag" {
  description = "The Docker image tag to deploy"
  type        = string
}
