resource "tls_private_key" "installkey" {

  triggers = {
    random_number = "${data.aws_caller_identity.current.user_id} "
  }

  algorithm   = "RSA"
  rsa_bits = 4096
}
