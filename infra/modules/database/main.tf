terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Database instance resource
resource "local_file" "database_instance" {
  filename = "${path.module}/../../.generated/${var.db_name}.json"
  content = jsonencode({
    name        = var.db_name
    subnet      = var.db_subnet_name
    engine      = var.db_engine
    version     = var.db_version
    tier        = var.db_tier
    region      = var.region
    project     = var.project
    description = "CloudNotes managed database instance"
  })
}
