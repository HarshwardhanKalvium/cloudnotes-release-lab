variable "db_name" {
  description = "Name of the database instance"
  type        = string
}

variable "db_subnet_name" {
  description = "Name of the subnet where the database will be placed"
  type        = string
}

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

variable "region" {
  description = "Cloud region where the database will be deployed"
  type        = string
}

variable "project" {
  description = "Project identifier"
  type        = string
  default     = "cloudnotes"
}
