resource "aws_db_subnet_group" "db_subnet_group_1" {
  name         = "db_subnets_1"
  subnet_ids   = [aws_default_subnet.az1.id, aws_default_subnet.az2.id]
  description  = "database subnets"

  tags   = {
    Name = "db_subnets_1"
  }
}

resource "aws_db_subnet_group" "db_subnet_group_2" {
  name         = "db_subnets_2"
  subnet_ids   = [aws_default_subnet.az1.id, aws_default_subnet.az2.id]
  description  = "database subnets"

  tags   = {
    Name = "db_subnets_2"
  }
}

