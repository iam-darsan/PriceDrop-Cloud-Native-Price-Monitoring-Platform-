resource "aws_elasticache_subnet_group" "redis" {
  name       = "pricedrop-redis-subnet-group"
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name = "pricedrop-redis"
  }
}

resource "aws_security_group" "redis_sg" {
  name   = "pricedrop-redis-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    description     = "Redis from EKS nodes"
    from_port       = 6379
    to_port         = 6379
    protocol        = "tcp"
    security_groups = [module.eks.node_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "pricedrop-redis-sg"
  }
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = "pricedrop-redis"
  description                = "Redis for PriceDrop backend"
  engine                     = "redis"
  engine_version             = "7.0"
  node_type                  = "cache.t4g.micro"
  num_cache_clusters         = 1
  port                       = 6379

  subnet_group_name          = aws_elasticache_subnet_group.redis.name
  security_group_ids         = [aws_security_group.redis_sg.id]

  automatic_failover_enabled = false
  at_rest_encryption_enabled = false
  transit_encryption_enabled = false

  tags = {
    Project = "pricedrop"
  }
}
