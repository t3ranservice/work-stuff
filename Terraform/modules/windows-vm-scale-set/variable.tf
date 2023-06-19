variable "windows_vmss_name" {
    type = string
    description = "Name of a windows VMSS"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "windows_vmss_password" {
    type = string
    description = "Password for user"
}
variable "location" {
    type = string
    description = "Subscription location"
}

variable "windows_vmss_sku" {
    type = string
    description = "Size of the VM in VMSS"
}

variable "windows_vmss_instance_count" {
    type = string
    description = "Number of instances in scale set"
}


variable "windows_vmss_user" {
    type = string
    description = "windows user"
}


variable "windows_source_image_id" {
    type = string
    description = "ID of source image"
}


variable "windows_upgrade_mode" {
    type = string
    description = "Upgrade mode"
}


variable "windows_vmss_os_disk_storage_type" {
    type = string
    description = "Storage type of OS disk in VMSS"
}


variable "windows_vmss_os_disk_caching" {
    type = string
    description = "Caching of OS disk in VMSS"
}


# variable "windows_vmss_data_disk_name" {
#     type = string
#     description = "Data disk name"
# }


variable "windows_vmss_data_disk_caching" {
    type = string
    description = "Data disk caching"
}

variable "winrm_listener_protocol" {
    type = string
    description = "WinRM listener protocol"
}

variable "windows_vmss_data_disk_create_option" {
    type = string
    description = "Create option of data disk"
}

variable "zones" {
    type = list
    description = "List of zones"
}

variable "zone_balance" {
    type = bool
    description = "Whether VMSS should be distributed across zones"
}

variable "windows_vmss_computer_name_prefix" {
    type = string
    description = "Hostname of VMs"
}

variable "windows_vmss_data_disk_size" {
    type = string
    description = "Size of data disk"
}


variable "windows_vmss_data_disk_lun" {
    type = string
    description = "Logical Unit Number of data disk"
}

variable "windows_vmss_data_disk_storage_type" {
    type = string
    description = "Backend storage type of data disk"
}

variable "windows_vmss_nic_name" {
    type = string
    description = "Name of NIC in VMSS"
}

variable "windows_vmss_nic_primary" {
    type = string
    description = "Whether NIC is primary"
}

variable "windows_vmss_ip_conf_name" {
    type = string
    description = "Name of IP configuration"
}

variable "windows_vmss_ip_conf_primary" {
    type = string
    description = "Whether IP configuration is prmary"
}

variable "subnet_id" {
    type = string
    description = "ID of subnet"
}




