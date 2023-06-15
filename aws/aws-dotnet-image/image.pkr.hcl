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
  default = "vpc-08f38749665f55487"
}

variable "subnet_id" {
  type    = string
  default = "subnet-0fe1aed7497ffca06"
}

source "amazon-ebs" "amazon-linux-1" {
  ami_name      = "golang-api-express-server"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami    = "ami-0022f774911c1d690"
  ssh_username  = "ec2-user"
  vpc_id        = var.vpc_id
  subnet_id     = var.subnet_id
}

build {
  name    = "dotnet-api-build-v1"
  sources = ["source.amazon-ebs.amazon-linux-1"]

  provisioner "shell" {
    script = "./setup.sh"
  }
  post-processor "vagrant" {}
  post-processor "compress" {}
}