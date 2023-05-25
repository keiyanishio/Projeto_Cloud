data "aws_availability_zones" "available_zones" {}

resource "aws_default_subnet" "az1" {
  availability_zone = data.aws_availability_zones.available_zones.names[0] 
}


resource "aws_default_subnet" "az2" {
  availability_zone = data.aws_availability_zones.available_zones.names[1] 
}

