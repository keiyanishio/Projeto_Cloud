data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter { name = "name"; values = ["al2023-ami-2023.*-x86_64"] }
  filter { name = "virtualization-type"; values = ["hvm"] }
}
resource "aws_instance" "web_server_1" {
  ami = data.aws_ami.amazon_linux.id; instance_type = "t3.micro"; subnet_id = aws_default_subnet.az1.id
  key_name = aws_key_pair.deployer.key_name; vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = <<-EOF
#!/bin/bash
set -euxo pipefail
dnf update -y
dnf install -y httpd
systemctl enable --now httpd
echo '<html><body><h1>Hello from web server 1</h1></body></html>' > /var/www/html/index.html
EOF
  tags = { Name = "portfolio-web-1" }
}
resource "aws_instance" "web_server_2" {
  ami = data.aws_ami.amazon_linux.id; instance_type = "t3.micro"; subnet_id = aws_default_subnet.az2.id
  key_name = aws_key_pair.deployer.key_name; vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = <<-EOF
#!/bin/bash
set -euxo pipefail
dnf update -y
dnf install -y httpd
systemctl enable --now httpd
echo '<html><body><h1>Hello from web server 2</h1></body></html>' > /var/www/html/index.html
EOF
  tags = { Name = "portfolio-web-2" }
}
