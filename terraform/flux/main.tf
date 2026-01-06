locals {
  cluster_endpoint = ""
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

module "kind_cluster" {
  source = "github.com/kvasianovych/tf-kind-cluster"

  cluster_name = var.kind_cluster_name
}

module "flux_bootstrap" {
  source = "github.com/kvasianovych/tf-fluxcd-flux-bootstrap"

  github_token      = var.github_token
  github_repository = "${var.github_owner}/${var.flux_github_repo}"
  private_key       = module.tls_private_key.private_key_pem
  config_host       = module.kind_cluster.endpoint
  config_ca         = module.kind_cluster.ca
  config_client_key = module.kind_cluster.client_key
  config_crt        = module.kind_cluster.crt
}
