resource "aws_security_group" "allow_all" {
  name        = "allow-all-tf" # changed name to avoid duplicate
  description = "Security group that allows all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # allows all inbound connections
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"          # -1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] # allows all outbound connections
  }

  tags = {
    Name = "allow-all-tf"
  }
}

resource "aws_instance" "terraform" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.medium"
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name      = "terraform"
    Terraform = "true"
  }
}