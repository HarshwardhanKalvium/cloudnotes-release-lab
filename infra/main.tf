terraform {
  required_version = ">= 1.5.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Local provider for zero-cost validation - no cloud credentials required
provider "local" {}

# Consume the network module for web tier
module "web_network" {
  source = "./modules/network"

  network_name = "cloudnotes-web"
  cidr         = var.web_cidr
  region       = var.region
  project      = var.project
  firewall_rules = var.firewall_rules
}

# Consume the network module for app tier (demonstrating reuse)
module "app_network" {
  source = "./modules/network"

  network_name = "cloudnotes-app"
  cidr         = var.app_cidr
  region       = var.region
  project      = var.project
  firewall_rules = [
    {
      protocol = "tcp"
      ports    = ["8080"]
    }
  ]
}

# Compute resource (modeled with local_file for zero-cost validation)
resource "local_file" "compute_instance" {
  filename = "${path.module}/.generated/${var.environment}-instance.json"
  content = jsonencode({
    name         = "${var.project}-instance"
    subnet       = module.web_network.subnet_name
    machine_type = var.machine_type
    region       = var.region
    zone         = var.zone
    description  = "CloudNotes application instance for ${var.environment}"
  })
}

# Storage resource (modeled with local_file for zero-cost validation)
resource "local_file" "storage_bucket" {
  filename = "${path.module}/.generated/${var.environment}-bucket.json"
  content = jsonencode({
    name        = var.bucket_name
    project     = var.project
    region      = var.region
    storage_class = var.storage_class
    description = "CloudNotes storage bucket for ${var.environment}"
  })
}
