variable "network_name" {
  description = "Name prefix for the network resources"
  type        = string
}

variable "region" {
  description = "Cloud region where network resources will be deployed"
  type        = string
}

variable "project" {
  description = "Project identifier"
  type        = string
  default     = "cloudnotes"
}

variable "web_subnet_cidr" {
  description = "CIDR block for the web subnet (public-facing)"
  type        = string
}

variable "app_subnet_cidr" {
  description = "CIDR block for the app subnet (application tier)"
  type        = string
}

variable "db_subnet_cidr" {
  description = "CIDR block for the database subnet (private database tier)"
  type        = string
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
