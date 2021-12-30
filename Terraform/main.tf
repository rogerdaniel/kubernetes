variable "access_key_path" {}
variable "secret_key_path" {}

provider "aws" {
 region = "us-east-2"
 access_key = var.access_key_path
 secret_key = var.secret_key_path
} # bloque de provider y de authenticacion
  # declaracion de recursos

# bloque security group

resource "aws_security_group" "Terraform" {
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "prueba" {
 ami = "ami-0629230e074c580f2"
 instance_type = "t2.micro"
 vpc_security_group_ids = [
    aws_security_group.Terraform.id
  ]

 tags = {
       name = "Mi intancia Terraform clase Clouddevops"
 }
}

