variable aws_region {
  	default = "us-east-1"
}

variable profile {
	default = "dev"
}

# VPC_cidr
variable "vpc_cidr" {
  type = "string"
}

# Public Subnet_cidrs
variable "public_cidrs" {
  type = "list"
}

# AMI
variable "ami" {
  type = "string"
}

#  Avilable Availibility Zone
data "aws_availability_zones" "available" {

}

# Database name
variable "db_name" {
  type = "string"
}

# Database user name
variable "db_user_name" {
  type = "string"
}

# Database password
variable "db_password" {
  type = "string"
}

variable "ssh_key" {
  
}