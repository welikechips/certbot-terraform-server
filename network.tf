//network.tf
resource "aws_vpc" "cloudc2-vpc" {
    cidr_block              = var.subnet
    enable_dns_hostnames    = true
    enable_dns_support      = true
    tags = {
        Name = "${var.env}_vpc"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.cloudc2-vpc.id
    tags = {
        Name = "${var.env}_gw"
        Env  = var.env
    }
}

resource "aws_default_route_table" "route_table" {
    default_route_table_id = aws_vpc.cloudc2-vpc.default_route_table_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        Name = "${var.env}_default route table"
        env  = var.env
    }
}

resource "aws_subnet" "subnet_1" {
    cidr_block = cidrsubnet(aws_vpc.cloudc2-vpc.cidr_block, 3, 1)
    vpc_id = aws_vpc.cloudc2-vpc.id
    availability_zone = var.availability_zones[0]
    map_public_ip_on_launch = "true"
    tags = {
        Name = "${var.env}_subnet"
        Env  = var.env
    }
}

resource "aws_route53_record" "main" {
    zone_id = var.hosted_zone_id
    name    = var.server_name
    type    = "A"
    ttl     = "300"
    records = [aws_instance.certbot_terraform_server.public_ip]
}

resource "aws_route53_record" "www" {
    zone_id = var.hosted_zone_id
    name    = "www.${var.server_name}"
    type    = "A"
    ttl     = "300"
    records = [aws_instance.certbot_terraform_server.public_ip]
}