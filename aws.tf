terraform {
  backend "s3" {
    bucket         = "aeternity-terraform-states"
    key            = "ae-devnet.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  version = "1.55"
  region  = "eu-west-2"
  alias   = "eu-west-2"
}
