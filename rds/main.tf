provider "aws" {
  region = "${var.region}"
}

resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  identifier           = "postgresql"
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "9.6.9"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "postgres"
  password             = "XebiamyDBPassword"
  publicly_accessible  = true
  skip_final_snapshot  = true
}
