output "instance_name" {
  description = "Name of the compute instance"
  value       = var.instance_name
}

output "instance_machine_type" {
  description = "Machine type of the compute instance"
  value       = var.machine_type
}

output "instance_zone" {
  description = "Zone where the instance is deployed"
  value       = var.zone
}

output "instance_ip" {
  description = "IP address of the instance (simulated)"
  value       = "10.0.1.10"
}
