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
