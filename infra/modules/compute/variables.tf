variable "instance_name" {
  description = "Name of the compute instance"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet where the instance will be placed"
  type        = string
}

variable "machine_type" {
  description = "Machine type for the compute instance"
  type        = string
}

variable "region" {
  description = "Cloud region where the instance will be deployed"
  type        = string
}

variable "zone" {
  description = "Cloud zone for the compute instance"
  type        = string
}

variable "project" {
  description = "Project identifier"
  type        = string
  default     = "cloudnotes"
}

variable "service_account_email" {
  description = "Service account email to attach to the instance"
  type        = string
}
