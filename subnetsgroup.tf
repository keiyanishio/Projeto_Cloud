resource "aws_db_subnet_group" "db_subnet_group" {
  name = "portfolio-db-subnets"
  subnet_ids = [aws_default_subnet.az1.id, aws_default_subnet.az2.id]
  tags = { Name = "portfolio-db-subnets" }
}
