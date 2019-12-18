variable "vault_addr" {
  description = "Vault server URL address"
}

variable "bootstrap_version" {
  default = "v2.9.2"
}

variable "package" {
  default = "https://s3.eu-central-1.amazonaws.com/aeternity-node-builds/aeternity-latest-ubuntu-x86_64.tar.gz"
}

variable "dns_zone" {
  default = "ZSEEAAX46MKWZ"
}

variable "next_domain" {
  default = "next.aeternity.io"
}
