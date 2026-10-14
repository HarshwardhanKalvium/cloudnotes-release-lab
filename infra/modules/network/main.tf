terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# VPC network resource
resource "local_file" "vpc" {
  filename = "${path.module}/../../.generated/${var.network_name}-vpc.json"
  content = jsonencode({
    name        = "${var.network_name}-vpc"
    project     = var.project
    region      = var.region
    description = "VPC network for ${var.network_name}"
  })
}

# Subnet resource
resource "local_file" "subnet" {
  filename = "${path.module}/../../.generated/${var.network_name}-subnet.json"
  content = jsonencode({
    name        = "${var.network_name}-subnet"
    vpc_name    = "${var.network_name}-vpc"
    cidr        = var.cidr
    region      = var.region
    description = "Subnet for ${var.network_name}"
  })
}

# Firewall resource
resource "local_file" "firewall" {
  filename = "${path.module}/../../.generated/${var.network_name}-firewall.json"
  content = jsonencode({
    name        = "${var.network_name}-firewall"
    vpc_name    = "${var.network_name}-vpc"
    allow_rules = var.firewall_rules
    description = "Firewall rules for ${var.network_name}"
  })
}
