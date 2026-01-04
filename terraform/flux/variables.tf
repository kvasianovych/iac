variable "google_project" {
  type        = string
  description = "Google project ID."
}

variable "google_region" {
  type        = string
  description = "Googre region we operate in."
}

variable "github_owner" {
  type        = string
  description = "GitHub username."
}

variable "github_token" {
  type        = string
  description = "A GitHub personal access token with the repo scope."
}

variable "flux_github_repo" {
  type        = string
  description = "Name of the repo to create for Flux CD."
}

variable "public_key_openssh_title" {
  type        = string
  description = "Name of the SSH key to create for deploys."
}

variable "fluxcd_target_path" {
  type        = string
  description = "Flux manifests subdirectory."
}

variable "kind_cluster_name" {
  type        = string
  description = "Kind cluster name."
}
