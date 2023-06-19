variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure subscription location"  
}

variable "shared_image_name" {
  description = "Name of the image"
  type = string
}

variable "shared_gallery_name" {
  description = "Name of the gallery"
  type = string
}

variable "os_type" {
  description = "Name of the Operating System: Windows, Linux"
  type = string
}

variable "shared_image_sku" {
  description = "Shared image SKU"
  type = string
}

variable "shared_image_publisher" {
  description = "Publisher of the image: Refinitiv"
  type = string
}

variable "shared_image_offer" {
  description = "Offer of the image: CentOS*, WindowsServer*"
  type = string
}