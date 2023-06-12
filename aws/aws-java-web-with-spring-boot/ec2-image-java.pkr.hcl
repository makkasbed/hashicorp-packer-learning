packer {
  required_plugins {
    amazon = {
      version = ">=1.2.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "vpc_id" {
  type    = string
  default = "vpc-96243845"
}

variable "subnet_id" {
  type    = string
  default = "subnet-1c5d5c68"
}

source "amazon-ebs" "amazon-linux-1" {
  ami_name      = "node-js-express-server"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-0022f774911c1d690"
  ssh_username  = "ec2-user"
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
}

build {
  name    = "ec2-spring-boot-server-build-v1"
  sources = ["source.amazon-ebs.amazon-linux-1"]

  provisioner "shell" {
    script = "./init.sh"
  }
  post-processor "vagrant" {}
  post-processor "compress" {}
}