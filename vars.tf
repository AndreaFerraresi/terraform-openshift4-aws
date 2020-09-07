variable region {
  default = "eu-west-1"
}

variable instance_type {
  default = "t2.micro"
}

variable account_vpc {
  default = "vpc-087a3bad9b14392ad"
}

variable account_subnet {
  default = "subnet-01d905fc6cfb5cb5c"
}

variable ec2_os {
  default  = "l"
}

variable iam_instance_profile {
  default = "CCC-test"
}

variable root_volume_type {
  default = "standard"
}

variable cost_center {
  default = "CC-CLMC"
}

variable entity {
  default = "ccc"
}

variable app_name {
  default = "ocpocp"
}

variable product {
  default = "vml"
}

variable cia {
  default = "ALL"
}

variable function {
  default = "gene"
}

variable channel {
  default = "test"
}

variable description {
  default = "test-OCP-CCC"
}

variable geo_region {
  default = "air"
}

variable sequence {
  default = "01"
}

variable environment {
  default = "d1"
}

variable tracking_code {
  default = "0123456789"
}

variable tag_list {
  default = {  
    Name = "basic-test-TFE"
  }