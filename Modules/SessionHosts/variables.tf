variable "avdsh_count" {
  type        = number
  default     = 2
  description = "The number of session hosts to deploy"
}

variable "prefix" {
  type        = string
  default     = "avd"
  description = "Prefix of the name of the AVD machine(s)"
}

variable "rg_name" {
  type        = string
  description = "Resource gorup for deploying reosurces "
}
variable "deploy_location" {
  default     = "uksouth"
  description = "Location of the resource group."
}
variable "vm_size" {
  type        = string
  default     = "Standard_d2as_v5"
  description = "The size of the virtual machine to be deployed"
}
variable "local_admin_username" {
  type        = string
  description = "local admin username for virtual machines"
}
variable "local_admin_password" {
  type        = string
  description = "local admin password for virtual machines"
}
variable "host_pool_name" {
  type        = string
  description = "The reosurce id of the host pool"
}
variable "session_host_token" {
  type        = string
  description = "The session token for joining VM's to the AVD host pool"
}
variable "subnetId" {
  type        = string
  description = "Resource Id for subnet to join to"
}
