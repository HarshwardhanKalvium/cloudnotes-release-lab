variable "network_name" {
  description = "Name prefix for the network resources"
  type        = string
}

variable "cidr" {
  description = "CIDR block for the subnet"
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
