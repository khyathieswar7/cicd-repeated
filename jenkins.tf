resource "aws_security_group" "jenkins_secuirty" {
  name        = "jenkins-security"
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
    Name = "jenkins-sg"
  }
}


resource "aws_instance" "jenkins" {
  ami                    = "ami-006dcf34c09e50022"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-020655c8fb9b303dc"
  vpc_security_group_ids = [aws_security_group.jenkins_secuirty.id]
  key_name               = aws_key_pair.new-key.id
  iam_instance_profile   = aws_iam_instance_profile.jenkins_to_simples3_policy_iam.name

  tags = {
    Name = "apache"
  }
}