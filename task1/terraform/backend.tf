# Configures remote backend to store Terraform state in DigitalOcean Spaces

terraform {
  backend "s3" {
    endpoint = "https://fra1.digitaloceanspaces.com"
    region   = "us-east-1"
    bucket   = "penina-tfstate"
    key      = "task1/terraform.tfstate"

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
  }
}