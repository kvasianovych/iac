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
  default     = ""
}

variable "k8s_cluster_name" {
  type        = string
  description = "Kubernetes cluster type"

  validation {
    condition     = contains(["kind", "gke", "flux"], var.k8s_cluster_name)
    error_message = "The k8s_cluster value must be either 'kind' or 'gke'."
  }
}

variable "cluster_endpoint" {
  type        = string
  description = "K8S cluster endpoint."
  default     = ""
}

variable "cluster_ca" {
  type        = string
  description = "K8S cluster CA."
  default     = ""
}

variable "cluster_client_key" {
  type        = string
  description = "K8S cluster client key."
  default     = ""
}

variable "cluster_crt" {
  type        = string
  description = "K8S cluster certificate."
  default     = ""
}
