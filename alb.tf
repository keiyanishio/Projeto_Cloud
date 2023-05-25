resource "aws_lb_target_group" "target_group_1" {
    health_check {
      interval = 10
      path = "/"
      protocol = "HTTP"
      timeout = 5
      healthy_threshold = 5
      unhealthy_threshold = 2
    }

    name = "target-group-1"
    port = 80
    protocol = "HTTP"
    target_type = "instance"
    vpc_id = aws_default_vpc.default_vpc.id
    
  
}



resource "aws_lb" "load_balancer1" {
    name = "load-balancer-application"
    internal = false
    ip_address_type = "ipv4"
    load_balancer_type = "application"
    security_groups = [aws_security_group.web_server.id]
    subnets = [aws_default_subnet.az1.id,aws_default_subnet.az2.id]

    tags = {
      Name = "load-balancer-application"
    }
}

resource "aws_lb_listener" "lb_listener_1" {
    load_balancer_arn = aws_lb.load_balancer1.arn
    port = 80
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.target_group_1.arn
      type = "forward"
    }
  
}



resource "aws_lb_target_group_attachment" "attch_1" {
    count = length(aws_instance.web_server_1)
    target_group_arn = aws_lb_target_group.target_group_1.arn
    target_id = aws_instance.web_server_1[count.index].id
  
}



resource "aws_lb_target_group_attachment" "attch_2" {
    count = length(aws_instance.web_server_2)
    target_group_arn = aws_lb_target_group.target_group_1.arn
    target_id = aws_instance.web_server_2[count.index].id
  
}





