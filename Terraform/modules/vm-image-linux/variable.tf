variable "vm_image_linux" {
  description = "Name of golden image"
  type        = string
}

variable "gallery_name" {
  description = "Name of Golden Image gallery"
  type        = string
}

variable "resource_group_name_image_gallery" {
  description = "Name of resource group name with gallery of Golden images"
  type        = string
}

variable "resource_id_image_linux" {
  description = "Resource ID of Golden image Linux"
  type        = string
}

variable "subscr_id_devrft-development-1-n" {
  description = "ID of subcription which includes gallery of Golden images"
  type        = string
}