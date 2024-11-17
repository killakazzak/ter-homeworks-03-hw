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

