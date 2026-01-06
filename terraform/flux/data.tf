data "terraform_remote_state" "auth" {
  backend = "gcs"
  config = {
    bucket = "kv-devops-k8s-tfstate"
    prefix = "terraform/gke"
  }
}
