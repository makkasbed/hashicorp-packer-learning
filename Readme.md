# Packer Learning
This is a repo for my packer journey. 
This repo contains various images built for the following cloud providers:
- AWS
- Azure
- GCP
- Linode

This is grouped into the various tech stacks that i work on:
- NodeJs
- Golang
- Java Spring Boot
- Dotnet Core

## AWS Setup
For AWS setup, configure the AWS Access and Secret keys via the terminal:

```bash
export AWS_ACCESS_KEY_ID="<your-access-key-id>"
export AWS_SECRET_ACCESS_KEY="<your-secret-access-key>"
```

## VPC
For VPC ID not available, kindly run the terraform code in **aws-vpc-packer** folder, It would output the VPC ID and subnet IDs needed for the build.

