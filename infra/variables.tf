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

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
  default     = "e2-medium"
}

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
