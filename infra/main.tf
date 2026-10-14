# Network module - VPC with web, app, and database subnets
module "network" {
  source = "./modules/network"

  network_name     = "cloudnotes-${var.environment}"
  region           = var.region
  project          = var.project
  web_subnet_cidr  = var.web_subnet_cidr
  app_subnet_cidr  = var.app_subnet_cidr
  db_subnet_cidr   = var.db_subnet_cidr
  firewall_rules   = var.firewall_rules
}

# IAM module - Service account and role bindings
module "iam" {
  source = "./modules/iam"

  project     = var.project
  app_sa_name = var.app_sa_name
  roles       = var.iam_roles
}

# Compute module - Application instance placed in app subnet
module "compute" {
  source = "./modules/compute"

  instance_name       = "cloudnotes-${var.environment}-app"
  subnet_name         = module.network.app_subnet_name
  machine_type        = var.machine_type
  region              = var.region
  zone                = var.zone
  project             = var.project
  service_account_email = module.iam.service_account_email
}

# Database module - Managed database in private subnet
module "database" {
  source = "./modules/database"

  db_name         = "cloudnotes-${var.environment}-db"
  db_subnet_name  = module.network.db_subnet_name
  db_engine       = var.db_engine
  db_version      = var.db_version
  db_tier         = var.db_tier
  region          = var.region
  project         = var.project
}

# Storage module - Cloud Storage bucket for assets
module "storage" {
  source = "./modules/storage"

  bucket_name    = var.bucket_name
  region         = var.region
  project        = var.project
  storage_class  = var.storage_class
  force_destroy  = false
}
