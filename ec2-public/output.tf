
output "ec2_public_ip" {
  value = aws_instance.instance.public_ip
}
output "ec2_private_ip" {
  value = aws_instance.instance.private_ip
}
