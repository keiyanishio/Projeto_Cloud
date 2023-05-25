resource "aws_instance" "web_server_1" {
  ami = "ami-01cc34ab2709337aa"
  instance_type = "t2.micro"
  count = 1
  subnet_id = aws_default_subnet.az1.id
  key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = <<-EOF
    
    #!/bin/bash
    sudo su
    yum update
    yum install httpd -y
    sudo yum install -y mysql
    systemctl start httpd
    systemctl enable httpd
    echo "<html><h1> HELLO WORLD 1 </p> </h1>" > /var/www/html/index.html
    EOF

  tags = {
    Name = "instance-${count.index}"
  }
}

resource "aws_instance" "web_server_2" {
  ami = "ami-01cc34ab2709337aa"
  instance_type = "t2.micro"
  count = 1
  subnet_id = aws_default_subnet.az2.id
  key_name = aws_key_pair.deployer.id
  vpc_security_group_ids = [aws_security_group.web_server.id]
  user_data = <<-EOF
    
    #!/bin/bash
    sudo su
    yum update
    yum install httpd -y
    sudo yum install -y mysql
    systemctl start httpd
    systemctl enable httpd
    echo "<html><h1> HELLO WORLD 2 </p> </h1>" > /var/www/html/index.html
    EOF

  tags = {
    Name = "instance-${count.index}"
  }
}


