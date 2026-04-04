# Defines all infrastructure resources: provider, VPC, Firewall, Droplet, Bucket

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token             = var.do_token
  spaces_access_id  = var.spaces_access_key
  spaces_secret_key = var.spaces_secret_key
}

# VPC - isolated private network in Frankfurt region
resource "digitalocean_vpc" "main" {
  name     = "${var.surname}-vpc"
  region   = var.region
  ip_range = "10.10.10.0/24"
}

# Firewall - inbound ports 22,80,443,8000-8003 / outbound all
resource "digitalocean_firewall" "main" {
  name        = "${var.surname}-firewall"
  droplet_ids = [digitalocean_droplet.main.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8000"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8001"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8002"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  inbound_rule {
    protocol         = "tcp"
    port_range       = "8003"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

# Droplet (VM) - Ubuntu 24.04, 4vCPU/8GB RAM for Minikube/Kubernetes
data "digitalocean_image" "ubuntu" {
  slug = "ubuntu-24-04-x64"
}

resource "digitalocean_droplet" "main" {
  name     = "${var.surname}-node"
  region   = var.region
  size     = var.droplet_size
  image    = data.digitalocean_image.ubuntu.slug
  vpc_uuid = digitalocean_vpc.main.id
}

# Bucket for object storage in the same region as VPC
resource "digitalocean_spaces_bucket" "main" {
  name   = "${var.surname}-bucket"
  region = var.region
}