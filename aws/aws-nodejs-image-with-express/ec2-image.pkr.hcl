packer {
    required_plugins{
        amazon= {
            version = ">=1.2.1"
            source = "github.com/hashicorp/amazon"
        }
    }
}

source "amazon-ebs" "amazon-linux-1"{
    ami_name  = "node-js-express-server"
    instance_type = "t2.micro"
    region = "us-east-1"
    source_ami = "ami-0022f774911c1d690"
    ssh_username = "ec2-user"
}

build {
    name = "nodejs-server-build-v1"
    sources = ["source.amazon-ebs.amazon-linux-1"]

    provisioner "shell" {
        script = "./setup.sh"
    } 
    post-processor "vagrant"{}
    post-processor "compress"{}
}