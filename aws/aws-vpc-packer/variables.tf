variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public CIDR values"
  default     = ["10.0.1.0/24"]
}
variable "private_subnet_cidrs" {
  type        = list(string)
  default     = ["10.0.4.0/24"]
  description = "Privvate CIDR values"
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a"]
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS Region"
}