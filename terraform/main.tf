terraform {
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 3.27"
   }
 }
 required_version = ">= 0.14.9"
}
provider "aws" {
 profile = "default"
 region  = "eu-west-1"
 default_tags {
   tags = {
     Project     = "ASD_TU60"
   }
 }
}

variable "db_user_name" {}
variable "instance_key_name"{}
variable "db_password" {}


resource "aws_db_instance" "default" {
 allocated_storage    = 10
 engine               = "mysql"
 engine_version       = "5.7"
 instance_class       = "db.t3.micro"
 name                 = "mydb"
 username             = var.db_user_name
 password             = var.db_password
 parameter_group_name = "default.mysql5.7"
 skip_final_snapshot  = true
}


resource "aws_instance" "bastionsql" {
ami = "ami-05cd35b907b4ffe77" #Can be different depending on the region instance_type = "t2.micro"
associate_public_ip_address = true
instance_type = "t2.micro"
key_name = var.instance_key_name 
user_data = "${file("startup.sh")}"
}

output "bastion_host_public_IP" {
  value = aws_instance.bastionsql.public_ip
  description = "Please connect to the bastion host with the command 'ssh -i YOUR_KEY ec2@INSTANCE_IP'"
}

output "db_instance_endpoint" {
  value = aws_db_instance.default.endpoint
  description = "Please connect to the database endpoint with the command 'mysql -h ENDPOINT -P 3306 -u USER -p'"
}