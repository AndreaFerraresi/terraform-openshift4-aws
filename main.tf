variable "name_length" {
  description = "The number of words"
  default     = 3
}

variable "keeper_value" {
  default = "b"
}

resource "random_pet" "pet_name" {
  keepers = {
    generate = "${var.keeper_value}"
  }
  length    = var.name_length
  separator = "-"
}

output "pet_name" {
  value = random_pet.pet_name.id
}

#####
##### Simple AWS integration

provider "aws" {
  version = "~> 2.70.0"
  region = "eu-west-1"
}

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

# Deploy a simple instance
resource "aws_instance" "simple_instance" {
  ami           = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
  subnet_id = "subnet-088d81b8518823717"
  security_groups = [
    aws_security_group.foo_sg.id
  ]

  tags = {
    Name = "basic-test-TFE"
  }
}

resource "aws_security_group" "foo_sg" {
  name        = "foo_sg"
  vpc_id      = "vpc-0308341d4c4889e7f"
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

