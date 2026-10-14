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

# Web subnet (public-facing)
resource "local_file" "web_subnet" {
  filename = "${path.module}/../../.generated/${var.network_name}-web-subnet.json"
  content = jsonencode({
    name        = "${var.network_name}-web-subnet"
    vpc_name    = "${var.network_name}-vpc"
    cidr        = var.web_subnet_cidr
    region      = var.region
    description = "Web subnet for ${var.network_name} (public-facing)"
  })
}

# App subnet (application tier)
resource "local_file" "app_subnet" {
  filename = "${path.module}/../../.generated/${var.network_name}-app-subnet.json"
  content = jsonencode({
    name        = "${var.network_name}-app-subnet"
    vpc_name    = "${var.network_name}-vpc"
    cidr        = var.app_subnet_cidr
    region      = var.region
    description = "App subnet for ${var.network_name} (application tier)"
  })
}

# Database subnet (private tier)
resource "local_file" "db_subnet" {
  filename = "${path.module}/../../.generated/${var.network_name}-db-subnet.json"
  content = jsonencode({
    name        = "${var.network_name}-db-subnet"
    vpc_name    = "${var.network_name}-vpc"
    cidr        = var.db_subnet_cidr
    region      = var.region
    description = "Database subnet for ${var.network_name} (private tier)"
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
