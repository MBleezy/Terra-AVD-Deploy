variable "location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "network" {
default = "AVDLab_Net"
description = "name of vnet to be deployed"
}

variable "subnet" {
  default = "AVDLab_subnet"
  description = "name of subnet to be deployed"
}
variable "rg" {
  type        = string
  default     = "rg-avd-compute"
  description = "Name of the Resource group in which to deploy session host"
}

variable "rdsh_count" {
  description = "Number of AVD machines to deploy"
  default     = 5
}

variable "host_prefix" {
  type        = string
  default     = "avdtf"
  description = "Prefix of the name of the AVD machine(s)"
}

variable "domain_name" {
  type        = string
  default     = "coreteksmartcloud.onmicrosoft.com"
  description = "Name of the domain to join"
}

variable "domain_user_upn" {
  type        = string
  default     = "matt.bleezarde_coretek" # do not include domain name as this is appended
  description = "Username for domain join (do not include domain name as this is appended)"
}

variable "domain_password" {
  type        = string
  default     = "ChangeMe123!"
  description = "Password of the user to authenticate with the domain"
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the machine to deploy"
  default     = "Standard_DS2_v2"
}

variable "ou_path" {
  default = ""
}

variable "local_admin_username" {
  type        = string
  default     = "localadmin"
  description = "local admin username"
}

variable "local_admin_password" {
  type        = string
  default     = "TestPass123!"
  description = "local admin password"
  sensitive   = true
}