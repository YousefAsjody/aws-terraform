resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  user_data = file(var.user_data_file)

  tags = {
    Name = "MyTerraformEC2"
  }

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  subnet_id              = data.aws_subnet.default.id
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_subnet" "default" {
  default_for_az = true
  availability_zone = "${var.aws_region}a"
}
