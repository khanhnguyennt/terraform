resource "aws_ecs_cluster" "main" {
  name = "cluster"
}

resource "aws_security_group" "main" {
  name        = "web-80"
  description = "Allow HTTP inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description     = "HTTP from VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-80"
  }
}

resource "aws_ecs_service" "main" {
  depends_on = [ aws_lb.main ]
  name            = "service"
  launch_type     = "FARGATE"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = 1

  network_configuration {
    subnets = data.terraform_remote_state.vpc.outputs.private_subnets

    security_groups = [aws_security_group.main.id]
  }

  #   iam_role        = "arn:aws:iam::371835366947:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"

  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "nginx"
    container_port   = 80
  }

}