resource "aws_db_instance" "mysql_db" {
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = "movies_db"
  username                = "admin_db"
  password                = jsondecode(data.aws_secretsmanager_secret_version.db_secret_ver.secret_string)["admin_db"]
  multi_az                = true
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.mysql_db_subnet_grp.name
  vpc_security_group_ids  = [aws_security_group.mysql_server.id]
  backup_retention_period = 1
}

resource "aws_db_subnet_group" "mysql_db_subnet_grp" {
  name = "mysql-db-grp"
  subnet_ids = [
    data.aws_subnet.data_a.id,
    data.aws_subnet.data_b.id,
  ]

  tags = {
    Name = "My DB subnet group"
  }
}