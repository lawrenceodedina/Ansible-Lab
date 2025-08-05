resource "tls_private_key" "ansible_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ansible_key" {
  key_name   = var.keypair_name
  public_key = tls_private_key.ansible_key.public_key_openssh
}

resource "local_file" "ssh_key" {
  filename        = "${path.module}/${var.keypair_name}.pem"
  content         = tls_private_key.ansible_key.private_key_pem
  file_permission = "0400"
}