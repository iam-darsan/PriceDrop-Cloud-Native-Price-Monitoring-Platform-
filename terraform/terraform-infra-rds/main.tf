 resource "aws_db_instance" "myrds" {
   allocated_storage   = var.dbstorage
   storage_type        = "gp2"
   identifier          = "rdstf"
   engine              = "mysql"
   db_name             = "pricedrop"
   engine_version      = "8.4.7"
   instance_class      = "db.t3.micro"
   username            = "admin"
   password            = "Password123!"
   publicly_accessible = false
   skip_final_snapshot = true
   db_subnet_group_name   = aws_db_subnet_group.rds_private_subnet_group.name
   vpc_security_group_ids = [aws_security_group.rds_sg.id]

   tags = {
     Name = "MyRDS"
   }
 }

 resource "aws_db_subnet_group" "rds_private_subnet_group" {
  name       = "pricedrop-rds-private-subnet-group"
  subnet_ids = var.private_subnets

  tags = {
    Name = "pricedrop-rds-private"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "pricedrop-rds-sg"
  description = "Allow MySQL from EKS only"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.eks_node_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pricedrop-rds-sg"
  }
}

