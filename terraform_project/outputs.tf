output "web_server_public_ip" {
  description = "The public IP address of the web server"
  value       = aws_instance.web_server.public_ip
}

output "db_server_private_ip" {
  description = "The private IP address of the database server"
  value       = aws_instance.db_server.private_ip
}