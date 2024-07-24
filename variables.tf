variable "resource_group_location" {
default     = "eastus"
description = "Location of the resource group."
}

variable "rg_name" {
type        = string
default     = "rg-avd-resources"
description = "Name of the Resource group in which to deploy service objects"
}

variable "workspace" {
type        = string
description = "Name of the Azure Virtual Desktop workspace"
default     = "AVD-Lab-Workspace"
}

variable "hostpool" {
type        = string
description = "Name of the Azure Virtual Desktop host pool"
default     = "AVD-LAB-HP"
}

variable "rfc3339" {
type        = string
default     = "2024-08-15T12:43:13Z"
description = "Registration token expiration"
}

variable "prefix" {
type        = string
default     = "avdlab"
description = "Prefix of the name of the AVD machine(s)"
}