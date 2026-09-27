output "load_balancer_dns" { value = aws_lb.load_balancer1.dns_name }
output "web_server_1_public_ip" { value = aws_instance.web_server_1.public_ip }
output "web_server_2_public_ip" { value = aws_instance.web_server_2.public_ip }
output "rds_1_endpoint" { value = aws_db_instance.db_instance_1.address }
output "rds_2_endpoint" { value = aws_db_instance.db_instance_2.address }
