###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "each_vm" {
  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
    zone        = string
  }))
}

variable "instance_count" {
  description = "Number of web instances"
  type        = number
  default     = 2
}

variable "zone" {
  description = "Zone for the instances"
  type        = string
  default     = "ru-central1-a"
}

variable "core_fraction" {
  description = "Core fraction for the instances"
  type        = number
  default     = 5
}

variable "cores" {
  description = "Number of cores for the instances"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory for the instances (in GB)"
  type        = number
  default     = 1
}

variable "image_id" {
  description = "Image ID for the boot disk"
  type        = string
  default     = "fd8qfp90a5l0m3d2htrm"
}

variable "subnet_id" {
  description = "Subnet ID for the network interface"
  type        = string
  default     = "e9bi11del4gshgcmh476"
}

variable "security_group_ids" {
  description = "Security group IDs for the network interface"
  type        = list(string)
  default     = ["enpgkfejf10nncf6u3p1"]
}

variable "db_image_id" {
  description = "Image ID for the boot disk of the database instance"
  type        = string
  default     = "fd8ad8j9gqqntstk5c36"
}
variable "disk_count" {
  description = "Number of disks to create"
  type        = number
  default     = 3
}
variable "disk_size" {
  description = "Size of each disk in GB"
  type        = number
  default     = 1
}

variable "disk_zone" {
  description = "Zone for the disks"
  type        = string
  default     = "ru-central1-a"
}

variable "disk_type" {
  description = "Type of the disks"
  type        = string
  default     = "network-ssd"
}

variable "instance_name" {
  description = "Name of the storage instance"
  type        = string
  default     = "storage"
}

variable "instance_zone" {
  description = "Zone for the storage instance"
  type        = string
  default     = "ru-central1-a"
}

variable "instance_cores" {
  description = "Number of cores for the storage instance"
  type        = number
  default     = 2
}

variable "instance_memory" {
  description = "Memory size for the storage instance in GB"
  type        = number
  default     = 2
}

variable "domain" {
  description = "The domain name for the servers"
  type        = string
  default     = "example.com"
}
