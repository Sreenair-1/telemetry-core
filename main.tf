
terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "local" {}

resource "local_file" "fleet_config" {
  filename = "${path.module}/fleet.env"
  content  = "BROKER=localhost:30095\n"
}
