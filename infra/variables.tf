variable "project" {
  description = "Project identifier for CloudNotes infrastructure"
  type        = string
  default     = "cloudnotes"
}

variable "environment" {
  description = "Deployment environment name (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "region" {
  description = "Cloud region where resources will be deployed"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "Cloud zone for compute instance"
  type        = string
  default     = "us-central1-a"
}

# Network variables
variable "web_subnet_cidr" {
  description = "CIDR block for the web subnet (public-facing)"
  type        = string
  default     = "10.0.0.0/24"
}

variable "app_subnet_cidr" {
  description = "CIDR block for the app subnet (application tier)"
  type        = string
  default     = "10.0.1.0/24"
}

variable "db_subnet_cidr" {
  description = "CIDR block for the database subnet (private tier)"
  type        = string
  default     = "10.0.2.0/24"
}

# Compute variables
variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "e2-medium"
}

# Database variables
variable "db_engine" {
  description = "Database engine (e.g., postgres, mysql)"
  type        = string
  default     = "postgres"
}

variable "db_version" {
  description = "Database engine version"
  type        = string
  default     = "14"
}

variable "db_tier" {
  description = "Database instance tier"
  type        = string
  default     = "db-f1-micro"
}

# Storage variables
variable "bucket_name" {
  description = "Name for the Cloud Storage bucket"
  type        = string
  default     = "cloudnotes-artifacts"
}

variable "storage_class" {
  description = "Storage class for the bucket (STANDARD, NEARLINE, etc.)"
  type        = string
  default     = "STANDARD"
}

# IAM variables
variable "app_sa_name" {
  description = "Name of the application service account"
  type        = string
  default     = "cloudnotes-app-sa"
}

variable "iam_roles" {
  description = "List of IAM roles to grant to the service account"
  type = list(object({
    role     = string
    resource = string
  }))
  default = [
    {
      role     = "roles/storage.objectAdmin"
      resource = "cloudnotes-artifacts"
    },
    {
      role     = "roles/cloudsql.client"
      resource = "cloudnotes-db"
    }
  ]
}

# Firewall rules
variable "firewall_rules" {
  description = "List of firewall rules to allow"
  type = list(object({
    protocol = string
    ports    = list(string)
  }))
  default = [
    {
      protocol = "tcp"
      ports    = ["22", "80", "443"]
    }
  ]
}
