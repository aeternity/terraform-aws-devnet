# module "aws_deploy-dev1-eu-west-2" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v2.3.1"
#   env               = "dev1"
#   bootstrap_version = var.bootstrap_version
#   vault_role        = "ae-node"
#   vault_addr        = var.vault_addr

#   spot_nodes_min = 3
#   spot_nodes_max = 3

#   spot_price    = "0.07"
#   instance_type = "m4.large"
#   ami_name      = "aeternity-ubuntu-16.04-v1549009934"

#   aeternity = {
#     package = var.package
#   }

#   providers = {
#     aws = "aws.eu-west-2"
#   }
# }

# module "aws_deploy-dev2-eu-west-2" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v2.3.1"
#   env               = "dev2"
#   bootstrap_version = var.bootstrap_version
#   vault_role        = "ae-node"
#   vault_addr        = var.vault_addr

#   spot_nodes_min = 2
#   spot_nodes_max = 2

#   spot_price    = "0.07"
#   instance_type = "m4.large"
#   ami_name      = "aeternity-ubuntu-16.04-v1549009934"

#   aeternity = {
#     package = var.package
#   }

#   providers = {
#     aws = "aws.eu-west-2"
#   }
# }

module "aws_deploy-integration-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v2.3.1"
  env               = "integration"
  bootstrap_version = var.bootstrap_version
  vault_role        = "ae-node"
  vault_addr        = var.vault_addr

  static_nodes   = 1
  spot_nodes_min = 2
  spot_nodes_max = 2

  spot_price    = "0.07"
  instance_type = "m4.large"
  ami_name      = "aeternity-ubuntu-16.04-v1549009934"

  additional_storage      = true
  additional_storage_size = 30

  snapshot_filename = "mnesia_uat_v-1_latest.tgz"

  aeternity = {
    package = "${var.package}"
  }

  providers = {
    aws = "aws.eu-west-2"
  }
}

module "aws_deploy-next-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v2.3.1"
  env               = "next"
  bootstrap_version = var.bootstrap_version
  vault_role        = "ae-node"
  vault_addr        = var.vault_addr

  static_nodes   = 1
  spot_nodes_min = 2
  spot_nodes_max = 2

  enable_internal_api = true

  spot_price    = "0.07"
  instance_type = "m4.large"
  ami_name      = "aeternity-ubuntu-16.04-v1549009934"

  aeternity = {
    package = var.package
  }

  providers = {
    aws = "aws.eu-west-2"
  }
}

resource "aws_route53_record" "next" {
  zone_id = "${var.dns_zone}"
  name    = "${var.next_domain}"
  type    = "A"
  records = "${module.aws_deploy-next-eu-west-2.static_node_ips}"
  ttl     = 300
}
