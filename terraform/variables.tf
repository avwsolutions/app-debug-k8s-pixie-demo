variable "subscription_id" { }

variable "tenant_id" { }

variable "location" {
  default = "West Europe"
}

variable "cluster_name" {
  default = "playground"
}

variable "virtual_network_name" {
  default = "playground_vnet"
}

variable "vm_size" {
  default = "Standard_D2_v2"
}

variable "admin_username" {
  default = "admin"
}

variable "node_count" {
  default = 1
}

variable "ssh_public_key" { }

variable "ingress_application_gateway_enabled" {
  default = false
}
