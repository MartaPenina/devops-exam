# Outputs displayed after successful Terraform apply

output "droplet_ip" {
  description = "Public IP address of the droplet"
  value       = digitalocean_droplet.main.ipv4_address
}

output "bucket_name" {
  description = "Name of the created object storage bucket"
  value       = digitalocean_spaces_bucket.main.name
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = digitalocean_vpc.main.id
}