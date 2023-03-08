output "http_redirector_public_ip" {
    value = aws_instance.certbot_terraform_server.public_ip
}

output "http_redirector_private_ip" {
    value = aws_instance.certbot_terraform_server.private_ip
}

output "http_redirector_url" {
    value = "https://${var.server_name}/"
}
