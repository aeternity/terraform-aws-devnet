module "aws_deploy-dev1-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v1.0.0"
  env               = "dev1"
  bootstrap_version = "${var.bootstrap_version}"
  vault_role        = "ae-node"
  vault_addr        = "${var.vault_addr}"

  spot_nodes       = 3
  spot_price       = "0.125"
  instance_type    = "m4.large"
  ami_name         = "aeternity-ubuntu-16.04-v1549009934"
  root_volume_size = 20

  aeternity = {
    package = "${var.package}"
  }

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "aws_deploy-dev2-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v1.0.0"
  env               = "dev2"
  bootstrap_version = "${var.bootstrap_version}"
  vault_role        = "ae-node"
  vault_addr        = "${var.vault_addr}"

  spot_nodes    = 2
  spot_price    = "0.125"
  instance_type = "m4.large"
  ami_name      = "aeternity-ubuntu-16.04-v1549009934"

  aeternity = {
    package = "${var.package}"
  }

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "aws_deploy-integration-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v1.0.0"
  env               = "integration"
  bootstrap_version = "${var.bootstrap_version}"
  vault_role        = "ae-node"
  vault_addr        = "${var.vault_addr}"

  static_nodes  = 1
  spot_nodes    = 2
  spot_price    = "0.125"
  instance_type = "m4.large"
  ami_name      = "aeternity-ubuntu-16.04-v1549009934"

  aeternity = {
    package = "${var.package}"
  }

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "aws_deploy-next-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v1.0.0"
  env               = "next"
  bootstrap_version = "${var.bootstrap_version}"
  vault_role        = "ae-node"
  vault_addr        = "${var.vault_addr}"

  static_nodes  = 1
  spot_nodes    = 2
  spot_price    = "0.125"
  instance_type = "m4.large"
  ami_name      = "aeternity-ubuntu-16.04-v1549009934"

  aeternity = {
    package = "${var.package}"
  }

  providers = {
    aws = "aws.eu-west-2"
  }
}
