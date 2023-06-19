variable "storage_share_name" {
  description = "Name of the Azure File Share"
  type = string
}

variable "storage_account_name" {
  description = "Name of storage account"
  type = string
}

variable "storage_share_quota" {
  description = "Quota of the File Share"
  type = number
}

variable "share_access_tier" {
  description = "Access tier of File Share"
  type = string
}

variable "share_protocol" {
  description = "Used protocol for mounting File Share"
  type = string
}
