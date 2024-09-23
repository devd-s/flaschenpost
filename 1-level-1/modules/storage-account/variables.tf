# Variables for the storage account module

variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure Region to deploy resources"
  type        = string
  default     = "West Europe"
}

variable "department" {
  description = "Department tag for all resources"
  type        = string
}

variable "storage_account_name" {
  description = "Name of Storage Account"
  type        = string
  default     = "srechallengeflaschenpost"
}

variable "account_tier" {
  description = "The tier of storage account"
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The replication type for storage account (LRS, GRS, etc.)"
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "The access tier for storage account"
  type        = string
  default     = "Hot"
}

variable "container_name" {
  description = "Name of the Storage Container"
  type        = string
}

variable "container_access_type" {
  description = "Access type for storage container"
  type        = string
  default     = "private"
}
