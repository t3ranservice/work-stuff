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

variable "mssql_version" {
  type = string
  description = "Microsoft SQL server version: 2.0 or 12.0"
}

variable "mssql_login" {
  type = string
  description = "Microsoft SQL server admin"
}

variable "mssql_pass" {
  type = string
  description = "Miscrosoft SQL server admin password"
}

variable "mssql_name" {
  type = string
  description = "Microsoft SQL server name"
}

variable "mssql_min_tls_version" {
  type = string
  description = "Minimun Microsoft SQL TLS version"
}
