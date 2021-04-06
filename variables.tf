variable "vault_addr" {
  description = "Vault server URL address"
}

variable "bootstrap_version" {
  default = "v2.12.2"
}

variable "package" {
  default = "https://builds.aeternity.io/aeternity-latest-ubuntu-x86_64.tar.gz"
}

variable "dns_zone" {
  default = "ZSEEAAX46MKWZ"
}

variable "next_domain" {
  default = "next.aeternity.io"
}
