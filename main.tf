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
  region  = var.region
}

# Deploy a simple instance
resource "aws_instance" "simple_instance" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  subnet_id     = var.account_subnet
  security_groups = [
    aws_security_group.foo_sg.id
  ]

  tags = var.tag_list
}

# Create a S3 bucket
resource "aws_s3_bucket" "bucket_test" {
  bucket = "ccc-test-bucket"
  acl    = "private"

  tags = var.tag_list
  }
}

# module "eac.aws.modules.ec2-sa" {
#   source = "eac.aws.modules.ec2-sa"

#   region               = var.region
#   vpc_id               = var.account_vpc
#   ami                  = data.aws_ami.ami_id.id
#   ec2_os               = var.ec2_os
#   instance_type        = var.instance_type
#   iam_instance_profile = var.iam_instance_profile
#   key_name             = aws_key_pair.ssh_key.id
#   subnet_id            = var.account_subnet
#   security_group_ids   = [aws_security_group.foo_sg.id]
#   root_volume_type     = var.root_volume_type
#   kms_key_arn          = aws_kms_key.test-kms-key.arn
#   cost_center          = var.cost_center
#   entity               = var.entity
#   app_name             = var.app_name
#   product              = var.product
#   cia                  = var.cia
#   function             = var.function
#   channel              = var.channel
#   description          = var.description
#   geo_region           = var.geo_region
#   sequence             = var.secuence
#   environment          = var.environment
#   tracking_code        = var.tracking_code
# }

# module "eac.aws.modules.as3-sa" {

#   source = "<bucket s3 module source>"

#   cost_center   = var.cost_center
#   entity        = var.entity
#   entity_code   = var.entity_code
#   app_name      = var.app_name
#   product       = var.product
#   cia           = var.cia
#   function      = var.function
#   channel       = var.channel
#   description   = var.description
#   region        = var.region
#   geo_region    = var.geo_region
#   secuence      = var.secuence
#   environment   = var.environment
#   tracking_code = var.tracking_code
#   force_destroy = var.force_destroy
#   project       = var.project
#   vpc_id        = var.vpc_id
#   kms_key_arn   = var.aws_kms_key_arn
#   log_bucket    = var.log_bucket

# }