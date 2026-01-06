terraform {
  backend "gcs" {
    bucket = "kv-devops-k8s-tfstate"
    prefix = "terraform/gke"
  }
}

module "gke_cluster" {
  source = "github.com/kvasianovych/tf-google-gke-cluster"

  GOOGLE_REGION    = var.GOOGLE_REGION
  GOOGLE_PROJECT   = var.GOOGLE_PROJECT
  GKE_NUM_NODES    = 2
  GKE_CLUSTER_NAME = "flux"
  GKE_POOL_NAME    = "flux"
}
