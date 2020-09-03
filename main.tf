# variable "name_length" {
#   description = "The number of words"
#   default     = 3
# }

# variable "keeper_value" {
#   default = "b"
# }

# resource "random_pet" "pet_name" {
#   keepers = {
#     generate = "${var.keeper_value}"
#   }
#   length    = var.name_length
#   separator = "-"
# }

# output "pet_name" {
#   value = random_pet.pet_name.id
# }

#####
##### Simple AWS integration

provider "aws" {
  version = "~> 2.70.0"
  region  = "eu-west-1"
}

# Deploy a simple instance
resource "aws_instance" "simple_instance" {
  ami           = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
  subnet_id     = var.account_subnet
  security_groups = [
    aws_security_group.foo_sg.id
  ]

  tags = {
    Name = "basic-test-TFE"
  }
}

# module "eac.aws.modules.ec2-sa" {
#   source = "eac.aws.modules.ec2-sa"

#   region               = "eu-west-1"
#   vpc_id               = "vpc-0308341d4c4889e7f"
#   ami                  = data.aws_ami.ami_id.id
#   ec2_os               = "l"
#   instance_type        = "t2.micro"
#   iam_instance_profile = "CCC-test"
#   key_name             = aws_key_pair.ssh_key.id
#   subnet_id            = "subnet-088d81b8518823717"
#   security_group_ids   = [aws_security_group.foo_sg.id]
#   root_volume_type     = "standard"
#   kms_key_arn          = aws_kms_key.test-kms-key.arn
#   cost_center          = "CC-CLMC"
#   entity               = "ccc"
#   app_name             = "ocpocp"
#   product              = "vml"
#   cia                  = "ALL"
#   function             = "gene"
#   channel              = "test"
#   description          = "test-OCP-CCC"
#   geo_region           = "air"
#   sequence             = "01"
#   environment          = "d1"
#   tracking_code        = "0123456789"
# }