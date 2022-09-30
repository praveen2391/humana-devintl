output "resource_group_name" {
  value = module.resource_group.name
}
output "location" {
  value = module.resource_group.location
}

output "vnet_id" {
  value = module.vnet.id
}

output "vnet_name" {
  value = module.vnet.name
}

output "vnet_cidr" {
  value = module.vnet.cidr
}