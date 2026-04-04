# Configures remote backend to store Terraform state in DigitalOcean Spaces

terraform {
  backend "s3" {
    endpoints = {
      s3 = "https://fra1.digitaloceanspaces.com"
    }
    region = "us-east-1"
    bucket = "penina-tfstate"
    key    = "task1/terraform.tfstate"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    force_path_style            = true
  }
}