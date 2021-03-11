resource "aws_ecs_task_definition" "main" {
  family                = "test"
  container_definitions = <<-EOT
    [
        {
            "name": "node",
            "image": "node:latest",
            "essential": true,
            "portMappings": [
                { "containerPort": 80 }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-create-group": "true",
                    "awslogs-group": "/ecs/node",
                    "awslogs-region": "ap-southeast-1",
                    "awslogs-stream-prefix": "test"
                }
            },
            "secrets": [
				{ "name": "PASS", "valueFrom": "arn:aws:ssm:ap-southeast-1:${data.aws_caller_identity.current.account_id}:parameter/rds/app-password" }
			],
			"environment": [
				{ "name": "HOST", "value": "${var.db_host}" },
				{ "name": "USER", "value": "${var.db_user}" },
				{ "name": "DB", "value": "${var.db_name}" }
			]
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