# This resources are required by the ec2-sa module

resource "aws_security_group" "foo_sg" {
  name        = "foo_sg"
  vpc_id      = var.default_vpc
  description = "Does nothing"

  ingress {
    description = "Allow all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "basic-test-TFE"
  }
}

# resource "aws_key_pair" "ssh_key" {
#   key_name   = "ccc-test-key"
#   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnsPoFkWy6eaBw5igHD+rdhEkc8Dgs3P2RG0l5eOCZqn9q0cEINkOUP1SM38MvUkP8k5Bl+F6J7GaYlEHlrtpC/Dc3V+G//pH3pvD4gjnbalwuuMjs6fsvSSHZ6uTJgmHvCluHijTZGA17K5wiCxPAVDHjtElOQx1MyRfdQQV1RypOxD5s7l09OSmFgbhTt6A+o5yCnKnbblYe5lpaRE1jzLG08zrtFbF4w404yELjqovwIeh6vvRNTlOK4ZqbX1J0H30FBeD8M8Bf03xFALhBq2x26KiaDifHal6qVYPAP96nd4gzQVHXwKt+P9yJ7QloqA8E9I924IXx3pRYvJGMTIv1xDleK4UqlbAbNvj406JG1qFQbc1V2odzs8i6Pfuemh3mSHyNIS9zzT8i7AfIFBEJRdUSOsTj4qC/8RvPGU5qhpndJo+8GM5CjnXsFT+EfGZghrVOVZeeKd0VU7xPclDwd6ZwC40kj6FEq5+GCAWr2SaVQqCxQXI0m3qq8pU="

#   tags = {
#     Name = "basic-test-TFE"
#   }
# }

# resource "aws_kms_key" "test-kms-key" {
#   description             = "KMS key CCC"
#   deletion_window_in_days = 1

#   tags = {
#     Name = "basic-test-TFE"
#   }
# }

# Extract the AMI id
data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "description"
    values = ["Amazon Linux AMI*"]
  }
}