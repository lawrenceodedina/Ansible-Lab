resource "local_file" "ssh_config" {
  filename = "~/.ssh/ssh_config"
  content = <<-EOF
  Host AnsibleMaster
    HostName ${aws_instance.master.public_ip}
    User ubuntu  # Changed from ec2-user
    IdentityFile ${abspath(path.module)}/${var.keypair_name}.pem
    StrictHostKeyChecking no
  EOF
}
