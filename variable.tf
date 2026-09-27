variable "region" { description = "AWS region."; type = string; default = "us-east-1" }
variable "ssh_public_key" { description = "Public SSH key for EC2."; type = string }
variable "db_username" { description = "MySQL master username."; type = string }
variable "db_password" { description = "MySQL master password."; type = string; sensitive = true }
variable "ssh_allowed_cidr" {
  description = "CIDR allowed to use SSH. Use your public IP with /32."
  type = string
  validation {
    condition = var.ssh_allowed_cidr != "0.0.0.0/0"
    error_message = "SSH must not be open to the entire internet."
  }
}
