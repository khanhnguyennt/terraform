resource "aws_ecs_task_definition" "main" {
  family                = "test"
  container_definitions = <<-EOT
    [
        {
            "name": "nginx",
            "image": "nginx:latest",
            "essential": true,
            "portMappings": [
                { "containerPort": 80 }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-create-group": "true",
                    "awslogs-group": "/ecs/nginx",
                    "awslogs-region": "ap-southeast-1",
                    "awslogs-stream-prefix": "test"
                }
            }
        }
    ]
    EOT


  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  task_role_arn      = "arn:aws:iam::371835366947:role/ecsTaskExecutionRole"
  execution_role_arn = "arn:aws:iam::371835366947:role/ecsTaskExecutionRole"
  network_mode       = "awsvpc"

}