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

# Network resources (modeled with local_file for zero-cost validation)
resource "local_file" "vpc" {
  filename = "${path.module}/.generated/${var.environment}-vpc.json"
  content = jsonencode({
    name        = "${var.project}-vpc"
    project     = var.project
    region      = var.region
    description = "VPC network for CloudNotes ${var.environment} environment"
  })
}

resource "local_file" "subnet" {
  filename = "${path.module}/.generated/${var.environment}-subnet.json"
  content = jsonencode({
    name        = "${var.project}-subnet"
    vpc_name    = "${var.project}-vpc"
    cidr        = var.subnet_cidr
    region      = var.region
    description = "Subnet for CloudNotes ${var.environment} environment"
  })
}

resource "local_file" "firewall" {
  filename = "${path.module}/.generated/${var.environment}-firewall.json"
  content = jsonencode({
    name        = "${var.project}-firewall"
    vpc_name    = "${var.project}-vpc"
    allow_rules = var.firewall_rules
    description = "Firewall rules for CloudNotes ${var.environment} environment"
  })
}

# Compute resource (modeled with local_file for zero-cost validation)
resource "local_file" "compute_instance" {
  filename = "${path.module}/.generated/${var.environment}-instance.json"
  content = jsonencode({
    name         = "${var.project}-instance"
    subnet       = "${var.project}-subnet"
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
