variable "bucket_name" {
  description = "Name of the storage bucket"
  type        = string
}

variable "region" {
  description = "Cloud region where the bucket will be created"
  type        = string
}

variable "project" {
  description = "Project identifier"
  type        = string
  default     = "cloudnotes"
}

variable "storage_class" {
  description = "Storage class for the bucket (STANDARD, NEARLINE, etc.)"
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "When deleting the bucket, delete all contained objects"
  type        = bool
  default     = false
}
