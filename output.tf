output "dns-name" {
  value = aws_lb.load_balancer1.dns_name
}

output "instance_ip_addr_web_server_1"{
  value = aws_instance.web_server_1.*.public_ip
}

output "instance_ip_addr_web_server_2"{
  value = aws_instance.web_server_2.*.public_ip
}

output "endpoint_rds_1" {
  value = split(":", aws_db_instance.db_instance_1.endpoint)[0]
}

output "endpoint_rds_2" {
  value = split(":", aws_db_instance.db_instance_2.endpoint)[0]
}