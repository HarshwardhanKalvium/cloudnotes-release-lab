terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Compute instance resource
resource "local_file" "compute_instance" {
  filename = "${path.module}/../../.generated/${var.instance_name}.json"
  content = jsonencode({
    name                = var.instance_name
    subnet              = var.subnet_name
    machine_type        = var.machine_type
    region              = var.region
    zone                = var.zone
    project             = var.project
    service_account     = var.service_account_email
    description         = "CloudNotes application instance"
  })
}
