resource "aws_default_vpc" "default_vpc" { tags = { Name = "portfolio-cloud-default-vpc" } }

resource "aws_security_group" "alb" {
  name = "portfolio-alb"
  description = "Public HTTP to ALB"
  vpc_id = aws_default_vpc.default_vpc.id
  ingress { description = "HTTP"; from_port = 80; to_port = 80; protocol = "tcp"; cidr_blocks = ["0.0.0.0/0"] }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}

resource "aws_security_group" "web_server" {
  name = "portfolio-web-servers"
  description = "HTTP from ALB and restricted SSH"
  vpc_id = aws_default_vpc.default_vpc.id
  ingress { description = "HTTP from ALB"; from_port = 80; to_port = 80; protocol = "tcp"; security_groups = [aws_security_group.alb.id] }
  ingress { description = "Restricted SSH"; from_port = 22; to_port = 22; protocol = "tcp"; cidr_blocks = [var.ssh_allowed_cidr] }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}

resource "aws_security_group" "db_security_group" {
  name = "portfolio-databases"
  description = "MySQL from web servers"
  vpc_id = aws_default_vpc.default_vpc.id
  ingress { description = "MySQL"; from_port = 3306; to_port = 3306; protocol = "tcp"; security_groups = [aws_security_group.web_server.id] }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}
