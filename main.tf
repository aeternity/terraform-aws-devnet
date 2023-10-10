# module "aws_deploy-dev1-eu-west-2" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v2.6.0"
#   env               = "dev1"
#   bootstrap_version = var.bootstrap_version
#   vault_role        = "ae-node"
#   vault_addr        = var.vault_addr

#   spot_nodes_min = 3
#   spot_nodes_max = 3

#   spot_price    = "0.08"
#   instance_type = "m4.large"
#   ami_name      = "aeternity-ubuntu-18.04-v1653564902"

#   providers = {
#     aws = aws.eu-west-2
#   }
# }

# module "aws_deploy-dev2-eu-west-2" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v2.6.0"
#   env               = "dev2"
#   bootstrap_version = var.bootstrap_version
#   vault_role        = "ae-node"
#   vault_addr        = var.vault_addr

#   spot_nodes_min = 2
#   spot_nodes_max = 2

#   spot_price    = "0.08"
#   instance_type = "m4.large"
#   ami_name      = "aeternity-ubuntu-18.04-v1653564902"

#   providers = {
#     aws = aws.eu-west-2
#   }
# }

module "aws_deploy-integration-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v3.0.0"
  env               = "integration"

  static_nodes   = 1
  spot_nodes_min = 2
  spot_nodes_max = 2

  instance_type  = "m5.large"
  instance_types = ["m6i.large", "m5d.large", "m5.large"]
  ami_name       = "aeternity-ubuntu-18.04-v1653564902"

  root_volume_size        = 24
  additional_storage      = true
  additional_storage_size = 240

  tags = {
    role  = "aenode"
    env   = "integration"
  }

  config_tags = {
    bootstrap_version = var.bootstrap_version
    vault_role        = "ae-node"
    vault_addr        = var.vault_addr
    node_config       = "secret/aenode/config/integration"
  }

  providers = {
    aws = aws.eu-west-2
  }
}

module "aws_deploy-integration_sync-eu-west-2" {
  source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v3.0.0"
  env               = "integration_sync"

  static_nodes   = 3
  spot_nodes_min = 0
  spot_nodes_max = 0

  instance_type  = "c5.xlarge"
  instance_types = ["c6i.xlarge", "c5d.xlarge", "c6in.xlarge", "c5.xlarge"]
  ami_name       = "aeternity-ubuntu-18.04-v1653564902"

  root_volume_size        = 24
  additional_storage      = true
  additional_storage_size = 240

  tags = {
    role  = "aenode"
    env   = "integration_sync"
  }

  config_tags = {
    bootstrap_version = var.bootstrap_version
    vault_role        = "ae-node"
    vault_addr        = var.vault_addr
    node_config       = "secret/aenode/config/integration_sync"
  }

  providers = {
    aws = aws.eu-west-2
  }
}

# module "aws_deploy-next-eu-west-2" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v3.0.0"
#   env               = "next"

#   instance_type  = "m5.large"
#   instance_types = ["m6i.large", "m5d.large", "m5.large"]
#   ami_name       = "aeternity-ubuntu-18.04-v1653564902"

#   static_nodes   = 1
#   spot_nodes_min = 2
#   spot_nodes_max = 2

#   root_volume_size        = 24
#   additional_storage      = true
#   additional_storage_size = 120

#   enable_internal_api = true

#   tags = {
#     role  = "aenode"
#     env   = "next"
#   }

#   config_tags = {
#     bootstrap_version = var.bootstrap_version
#     vault_role        = "ae-node"
#     vault_addr        = var.vault_addr
#     node_config       = "secret/aenode/config/next"
#   }

#   providers = {
#     aws = aws.eu-west-2
#   }
# }

# resource "aws_route53_record" "next" {
#   zone_id = var.dns_zone
#   name    = var.next_domain
#   type    = "A"
#   records = module.aws_deploy-next-eu-west-2.static_node_ips
#   ttl     = 300
# }
