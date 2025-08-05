variable "region" {
  type    = string
  default = "us-east-1"
}

variable "AZ" {
  type = string
  default = "us-east-1a"
}

variable "VPC_cidr" {
  type = string
  default = "192.168.0.0/16" 
}

variable "public_subnet_cidr" {
  type = string
  default = "192.168.1.0/24"
}  

variable "project-name" {
  type    = string
  default = "Ansible-lab"
}

variable "node-instance_type" {
  type    = string
  default = "t3.micro"
}
variable "master-instance_type" {
  type    = string
  default = "t2.medium"
}
variable "sg_name" {
  type        = string
  default     = "Ansible-sg"  # From your original
  description = "Security group name tag"
}

variable "keypair_name" {
  type        = string
  default     = "ansible-key"  # From your original
  description = "Name of the AWS key pair"
}
variable "ansible_password" {
  type        = string
  default     = null  # Set via TF_VAR_ansible_password
  description = "Password for ansible user (randomly generated if null)"
  sensitive   = true
}

locals {
  ssh_user = "ubuntu"  # Or logic to detect based on AMI
}

# Windows Server Configuration

variable "create_windows_server" {
  description = "Whether to create the Windows instance"
  type        = bool
  default     = false
}

variable "windows_server_config" {
  description = "Windows Server configuration"
  type = object({
    name          = string
    instance_type = string
  })
  default = {
    name          = "win2022-server"
    instance_type = "t2.medium"
  }
}