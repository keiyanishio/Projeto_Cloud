resource "aws_db_instance" "db_instance_2" {
  engine                  = "mysql"
  engine_version          = "8.0.31"
  multi_az                = false
  identifier              = "rds-instance-2"
  username                = "${var.user}"
  password                = "${var.password}"
  instance_class          = "db.t2.micro"
  allocated_storage       = 200
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group_2.name
  vpc_security_group_ids  = [aws_security_group.db_security_group.id]
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  db_name                 = "rds2"
  skip_final_snapshot     = true
  
}
