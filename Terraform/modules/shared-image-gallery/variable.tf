variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"  
}

variable "tags" {
  description = "Resource tags"
  type = map 
}

variable "shared_gallery_name" {
  description = "Name of the gallery"
  type = string
}

variable "description" {
  description = "Description of the resource"
  type = string
}