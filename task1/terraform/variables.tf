# Defines all input variables for infrastructure configuration

variable "surname" {
  default = "penina"
}

variable "region" {
  default = "fra1"
}

variable "droplet_size" {
  default = "s-4vcpu-8gb"
}

variable "do_token" {}
variable "spaces_access_key" {}
variable "spaces_secret_key" {}