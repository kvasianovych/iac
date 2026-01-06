locals {
  cluster_endpoint = var.cluster_endpoint
  cluster_ca       = data.terraform_remote_state.auth.outputs.cluster_ca
  cluster_token    = data.terraform_remote_state.auth.outputs.cluster_token
}

module "tls_private_key" {
  source = "github.com/kvasianovych/tf-hashicorp-tls-keys"
}

module "github_repository" {
  source = "github.com/kvasianovych/tf-github-repository"

  github_owner             = var.github_owner
  github_token             = var.github_token
  repository_name          = var.flux_github_repo
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = var.public_key_openssh_title
}

# module "kind_cluster" {
#   source = "github.com/kvasianovych/tf-kind-cluster"
# 
#   cluster_name = var.kind_cluster_name
# }

module "flux_bootstrap" {
  source = "github.com/kvasianovych/tf-fluxcd-flux-bootstrap"

  github_token      = var.github_token
  github_repository = "${var.github_owner}/${var.flux_github_repo}"
  private_key       = module.tls_private_key.private_key_pem
  config_host       = local.cluster_endpoint
  config_ca         = local.cluster_ca
  config_token      = local.cluster_token
}

# module "gke_workload_identity" {
#   source  = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
#   version = "43.0.0"
# 
#   cluster_name        = var.k8s_cluster
#   name                = "kustomize-controller"
#   namespace           = var.flux_github_repo
#   project_id          = var.google_project
#   use_existing_k8s_sa = true
# }
