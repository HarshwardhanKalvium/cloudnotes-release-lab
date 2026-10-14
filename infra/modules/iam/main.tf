terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Service account resource
resource "local_file" "service_account" {
  filename = "${path.module}/../../.generated/${var.app_sa_name}.json"
  content = jsonencode({
    name        = var.app_sa_name
    project     = var.project
    email       = "${var.app_sa_name}@${var.project}.iam.gserviceaccount.com"
    description = "Service account for CloudNotes application"
  })
}

# Role bindings resource
resource "local_file" "role_bindings" {
  filename = "${path.module}/../../.generated/${var.app_sa_name}-bindings.json"
  content = jsonencode({
    service_account = "${var.app_sa_name}@${var.project}.iam.gserviceaccount.com"
    project         = var.project
    roles           = var.roles
    description     = "Role bindings for CloudNotes service account"
  })
}
