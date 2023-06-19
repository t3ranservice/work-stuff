variable "linux_vmss_name" {
    type = string
    description = "Name of a Linux VMSS"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "linux_vmss_password" {
    type = string
    description = "Password for user"
}
variable "location" {
    type = string
    description = "Subscription location"
}

variable "custom_data_file" {
    type = string
    description = "Path to the file with the script to run in VM init"
}

variable "linux_vmss_sku" {
    type = string
    description = "Size of the VM in VMSS"
}

variable "linux_vmss_instance_count" {
    type = string
    description = "Number of instances in scale set"
}

variable "zones" {
    type = list
    description = "List of zones"
}

variable "zone_balance" {
    type = bool
    description = "Whether VMSS should be distributed across zones"
}

variable "linux_vmss_user" {
    type = string
    description = "Linux user"
}


variable "linux_vmss_computer_name_prefix" {
    type = string
    description = "Hostname of VMs"
}

variable "public_key" {
    type = string
    description = "SSH public key"
}


variable "linux_source_image_id" {
    type = string
    description = "ID of source image"
}


variable "linux_vmss_upgrade_mode" {
    type = string
    description = "Upgrade mode"
}


variable "linux_vmss_os_disk_storage_type" {
    type = string
    description = "Storage type of OS disk in VMSS"
}


variable "linux_vmss_os_disk_caching" {
    type = string
    description = "Caching of OS disk in VMSS"
}

variable "linux_vmss_data_disk_caching" {
    type = string
    description = "Data disk caching"
}


variable "linux_vmss_data_disk_create_option" {
    type = string
    description = "Create option of data disk"
}


variable "linux_vmss_data_disk_size" {
    type = string
    description = "Size of data disk"
}


variable "linux_vmss_data_disk_lun" {
    type = string
    description = "Logical Unit Number of data disk"
}

variable "linux_vmss_data_disk_storage_type" {
    type = string
    description = "Backend storage type of data disk"
}

variable "linux_vmss_nic_name" {
    type = string
    description = "Name of NIC in VMSS"
}

variable "linux_vmss_nic_primary" {
    type = string
    description = "Whether NIC is primary"
}

variable "linux_vmss_ip_conf_name" {
    type = string
    description = "Name of IP configuration"
}

variable "linux_vmss_ip_conf_primary" {
    type = string
    description = "Whether IP configuration is prmary"
}

variable "subnet_id" {
    type = string
    description = "ID of subnet"
}




