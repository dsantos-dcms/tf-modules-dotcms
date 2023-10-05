output "public_subnet_id" {
  value = aws_subnet.snet_public_a[0].id
}

output "private_subnet_a_id" {
  value = aws_subnet.snet_private_a[0].id
}

output "private_subnet_b_id" {
  value = aws_subnet.snet_private_b[0].id
}

output "vpc_id" {
  value = aws_vpc.main.id
}
