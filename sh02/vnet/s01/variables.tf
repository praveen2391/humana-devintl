variable "location" {}
variable "project" {}
variable "lob" {}
variable "zone" {}
variable "ARM_ACCESS_KEY" {}
variable "container_name" {}
variable "storage_account_name" {}

variable "address_space" {
  default = "10.0.0.0/16"
}
variable "dns_servers" {
  default = ["10.0.0.4", "10.0.0.5"]
}