terraform {
  required_providers {
    volcenginecc = {
      source = "volcengine/volcenginecc"
    }
  }
}

provider "volcenginecc" {
  endpoints = {
    cloudcontrolapi = "open.stable.volcengineapi-test.com"
  }

  region     = "cn-guilin-boe"
}

resource "volcenginecc_vpc_vpc" "vpc-demo" {
  vpc_name    = "vpc-demo"
  description = "VPC created by Terraform"
  cidr_block  = "192.168.0.0/16"

  tags = [
    {
      key   = "env"
      value = "test"
    }
  ]
}

resource "volcenginecc_vpc_subnet" "subnet-demo" {
  vpc_id      = volcenginecc_vpc_vpc.vpc-demo.id
  zone_id     = "cn-guilin-a"
  subnet_name = "subnet-demo"
  description = "Subnet created by Terraform"
  cidr_block  = "192.168.1.0/24"

  tags = [
    {
      key   = "env"
      value = "test"
    }
  ]
}

output "vpc_id" {
  description = "ID of the created VPC"
  value       = volcenginecc_vpc_vpc.vpc-demo.id
}

output "vpc_name" {
  description = "Name of the created VPC"
  value       = volcenginecc_vpc_vpc.vpc-demo.vpc_name
}

output "vpc_cidr_block" {
  description = "CIDR block of the created VPC"
  value       = volcenginecc_vpc_vpc.vpc-demo.cidr_block
}

output "vpc_status" {
  description = "Status of the created VPC"
  value       = volcenginecc_vpc_vpc.vpc-demo.status
}

output "vpc_creation_time" {
  description = "Creation time of the VPC"
  value       = volcenginecc_vpc_vpc.vpc-demo.creation_time
}

output "subnet_id" {
  description = "ID of the created subnet"
  value       = volcenginecc_vpc_subnet.subnet-demo.id
}

output "subnet_name" {
  description = "Name of the created subnet"
  value       = volcenginecc_vpc_subnet.subnet-demo.subnet_name
}

output "subnet_cidr_block" {
  description = "CIDR block of the created subnet"
  value       = volcenginecc_vpc_subnet.subnet-demo.cidr_block
}

output "subnet_zone_id" {
  description = "Availability zone ID of the subnet"
  value       = volcenginecc_vpc_subnet.subnet-demo.zone_id
}

output "subnet_status" {
  description = "Status of the subnet"
  value       = volcenginecc_vpc_subnet.subnet-demo.status
}

output "subnet_available_ip_count" {
  description = "Number of available IP addresses in the subnet"
  value       = volcenginecc_vpc_subnet.subnet-demo.available_ip_address_count
}
