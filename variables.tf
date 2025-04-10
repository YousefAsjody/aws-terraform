variable "aws_region" {
  default = "eu-central-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "key_name" {
  description = "SSH Key Pair Name"
}

variable "user_data_file" {
  default = "cloud-init.yml"
}
