provider "aws" {
}

terraform {
  backend "remote" {
    hostname = "107.106.30.36"
    organization = "coe-tlz"

    workspaces {
      name = "tlz-app-ccc-cccd1airaccgenericocp001-dev-resources"
    }
  }
}