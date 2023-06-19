variable "tags" {
  description = "Resource tags"
  type = map 
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"  
}

variable "azure_sql_version" {
  type = string
  description = "Version of Azure SQL server: 2.0 or 12.0"
}

variable "azure_sql_login" {
  type = string
  description = "Username of Azure SQL admin"
}

variable "azure_sql_pass" {
  type = string
  description = "Password of Azure SQL admin"
}

variable "azure_sql_name" {
  type = string
  description = "Name of Azure SQL server
}
