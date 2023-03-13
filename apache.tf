resource "aws_security_group" "apache_securtiy" {
  name        = "apache_securtiy"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-01e8bd715ca6b33cd"

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "apache-sg"
  }
}


resource "aws_instance" "apache" {
  ami                    = "ami-006dcf34c09e50022"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-0e8cb63015ebbceb7"
  vpc_security_group_ids = [aws_security_group.apache_securtiy.id]
  key_name               = resource.aws_key_pair.new-key.id


  tags = {
    Name = "apache"
  }
}