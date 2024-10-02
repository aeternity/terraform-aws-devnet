# module "aws_deploy-dev1" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v4.0.0"
#   env               = "dev1"

#   static_nodes   = 0
#   spot_nodes_min = 1
#   spot_nodes_max = 1

#   instance_type  = "m5.large"
#   instance_types = ["m6i.large", "m5d.large", "m5.large"]
#   ami_name       = "aeternity-ubuntu-22.04-v1709639419"

#   root_volume_size        = 24

#   tags = {
#     role = "aenode"
#     env  = "dev1"
#   }

#   config_tags = {
#     vault_role        = "ae-node"
#     vault_addr        = var.vault_addr
#     bootstrap_version = var.bootstrap_version
#     bootstrap_config  = "secret2/aenode/config/dev1"
#   }

#   providers = {
#     aws = aws.eu-north-1
#   }
# }

# module "aws_deploy-dev2" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v4.0.0"
#   env               = "dev2"

#   static_nodes   = 0
#   spot_nodes_min = 1
#   spot_nodes_max = 1

#   instance_type  = "m5.large"
#   instance_types = ["m6i.large", "m5.large"]
#   ami_name       = "aeternity-ubuntu-22.04-v1709639419"

    # root_volume_size        = 24

#   tags = {
#     role = "aenode"
#     env  = "dev1"
#   }

#   config_tags = {
#     vault_role        = "ae-node"
#     vault_addr        = var.vault_addr
#     bootstrap_version = var.bootstrap_version
#     bootstrap_config  = "secret2/aenode/config/dev2"
#   }

#   providers = {
#     aws = aws.eu-north-1
#   }
# }

module "aws_deploy-integration" {
  source = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v4.0.0"
  env    = "integration"

  static_nodes   = 1
  spot_nodes_min = 0
  spot_nodes_max = 0

  instance_type  = "m5.large"
  instance_types = ["m6i.large", "m5.large"]
  ami_name       = "aeternity-ubuntu-22.04-v1709639419"

  root_volume_size        = 24
  additional_storage      = true
  additional_storage_size = 240

  tags = {
    role = "aenode"
    env  = "integration"
  }

  config_tags = {
    vault_role        = "ae-node"
    vault_addr        = var.vault_addr
    bootstrap_version = var.bootstrap_version
    bootstrap_config  = "secret2/aenode/config/integration"
  }

  providers = {
    aws = aws.eu-north-1
  }
}

resource "aws_route53_record" "integration" {
  zone_id = var.dns_zone
  name    = "integration.${var.domain}"
  type    = "A"
  records = module.aws_deploy-integration.static_node_ips
  ttl     = 300
}

# module "aws_deploy-integration_sync" {
#   source            = "github.com/aeternity/terraform-aws-aenode-deploy?ref=v4.0.0"
#   env               = "integration_sync"

#   static_nodes   = 1
#   spot_nodes_min = 0
#   spot_nodes_max = 0

#   instance_type  = "c5.xlarge"
#   instance_types = ["c6i.xlarge", "c5d.xlarge", "c6in.xlarge", "c5.xlarge"]
#   ami_name       = "aeternity-ubuntu-22.04-v1709639419"

#   root_volume_size        = 24
#   additional_storage      = true
#   additional_storage_size = 500

#   tags = {
#     role  = "aenode"
#     env   = "integration_sync"
#   }

#   config_tags = {
#     vault_role        = "ae-node"
#     vault_addr        = var.vault_addr
#     bootstrap_version = var.bootstrap_version
#     bootstrap_config  = "secret2/aenode/config/integration_sync"
#   }

#   providers = {
#     aws = aws.eu-north-1
#   }
# }
