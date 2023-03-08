provider "aws" {
    region     = var.region
}

resource "tls_private_key" "key" {
    algorithm = "RSA"
    rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
    key_name   = "generated_key_certbot_terraform_${var.env}"
    public_key = tls_private_key.key.public_key_openssh
}