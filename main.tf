data "aws_vpc" "talent_academy" {
  filter {
    name   = "tag:Name"
    values = ["lab_vpc"]
  }
}

data "aws_subnet" "data_a" {
  filter {
    name   = "tag:Name"
    values = ["data-a"]
  }
}

data "aws_subnet" "data_b" {
  filter {
    name   = "tag:Name"
    values = ["data-b"]
  }
}

data "aws_security_group" "ec2_server" {
  filter {
    name   = "tag:Name"
    values = ["ansible-server"]
  }
}

data "aws_secretsmanager_secret" "db_secret" {
    arn = "arn:aws:secretsmanager:eu-west-1:254964228601:secret:database_login-lA7e0D"
}
data "aws_secretsmanager_secret_version" "db_secret_ver" {
    secret_id = data.aws_secretsmanager_secret.db_secret.id
}