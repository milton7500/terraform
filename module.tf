provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "test" {
  ami = "ami-0fc5d935ebf8bc3bc"
  instance_type = lookup(var.instance_type, terraform.workspace)
}

variable "instance_type" {
  type = map

  default = {
    default = "t2.nano"
    prod = "t2.micro"
    dev = "t2.small"
  }
}