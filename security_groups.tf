resource "aws_security_group" "mysql_server" {
  name        = "mysql-server"
  description = "Allow connection to mysql RDS server"
  vpc_id      = data.aws_vpc.talent_academy.id

  ingress {
    description = "Allow port 3306"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    #cidr_blocks      = [data.aws_vpc.talent_academy.cidr_blocks]
    security_groups = [data.aws_security_group.ec2_server.id]
  }

  # OUTBOUD CONNECTIONS
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # TCP + UDP
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "mysql-server-sg"
  }
}
