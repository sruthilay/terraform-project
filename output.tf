output "Private_DNS" {
  value = aws_instance.webserver.private_dns
}

output "Private_IP" {
  value = aws_instance.webserver.private_ip
}
