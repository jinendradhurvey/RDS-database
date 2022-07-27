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

#data "aws_secretsmanager_secret" "secrets" {
# arn = "arn:aws:secretsmanager:us-east-1:342623272824:secret:wordpress_creds-pOsVNE"
#}
#data "aws_secretsmanager_secret_version" "current" {
# secret_id = data.aws_secretsmanager_secret.secrets.id
#}