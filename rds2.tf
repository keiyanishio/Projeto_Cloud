resource "aws_db_instance" "db_instance_2" {
  engine = "mysql"; identifier = "portfolio-rds-2"; username = var.db_username; password = var.db_password
  instance_class = "db.t3.micro"; allocated_storage = 20; storage_encrypted = true
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.db_security_group.id]
  availability_zone = data.aws_availability_zones.available_zones.names[1]
  db_name = "rds2"; publicly_accessible = false; skip_final_snapshot = true
}
