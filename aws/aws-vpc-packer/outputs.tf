output "vpc_id" {
  value = aws_vpc.packer.id
}
output "public_net_id" {
  value = aws_subnet.public_nets[0].id
}