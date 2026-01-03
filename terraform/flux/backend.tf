terraform {
  backend "gcs" {
    bucket = "kv-devops-k8s-tfstate"
    prefix = "flux"
  }
}
