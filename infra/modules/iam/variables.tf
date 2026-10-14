variable "project" {
  description = "Project identifier"
  type        = string
  default     = "cloudnotes"
}

variable "app_sa_name" {
  description = "Name of the application service account"
  type        = string
}

variable "roles" {
  description = "List of roles to grant to the service account"
  type = list(object({
    role        = string
    resource    = string
  }))
  default = []
}
