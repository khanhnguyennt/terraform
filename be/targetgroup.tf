resource "aws_lb_target_group" "main" {
  name        = "main"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

}