provider "aws" {
  version = "~> 2.70.0"
  region = "eu_west-1"
}

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

  tags = {
    Name = "basic-test-TFE"
  }
}
