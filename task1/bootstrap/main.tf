# Creates a private S3-compatible bucket in DigitalOcean Spaces to store Terraform state remotely.

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

variable "do_token" {}
variable "spaces_access_key" {}
variable "spaces_secret_key" {}

# Private bucket penina-tfstate in Frankfurt region for storing tfstate file
resource "digitalocean_spaces_bucket" "tfstate" {
  name   = "penina-tfstate"
  region = "fra1"
  acl    = "private"
}