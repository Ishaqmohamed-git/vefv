resource "aws_lb" "alb_ec2" {
    name = "awsalb"
    internal = false
    load_balancer_type = "application"
   security_groups = [aws_security_group.alb_sg.id]

subnet_mapping {
  subnet_id = aws_subnet.public_subnet_az1.id
}
subnet_mapping {
  subnet_id = aws_subnet.public_subnet_az2.id
}
}

resource "aws_lb_target_group_attachment" "attachement_v1" {
  target_group_arn = aws_lb_target_group.target_group_ec2.id
  target_id = aws_instance.prv_1_ec1.id
  port = 80
}

resource "aws_lb_target_group_attachment" "attachement_v2" {
    target_id = aws_instance.prv_1_ec2.id
    target_group_arn = aws_lb_target_group.target_group_ec2.id
    port = 80
}

resource "aws_lb_listener" "nam" {
  load_balancer_arn = aws_lb.alb_ec2.id
  port = 80
  protocol = "HTTP"
default_action {

type = "forward"
target_group_arn = aws_lb_target_group.target_group_ec2.id

}
}

    



        


