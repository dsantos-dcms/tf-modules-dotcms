output "public_subnet_id" {
  value = aws_subnet.snet_public_a[0].id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
