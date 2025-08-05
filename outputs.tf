output "master_ip" {

  value = {
    public-Ip = aws_instance.master.public_ip
    private-IP = aws_instance.master.private_ip
    ssh-command = "ssh -i ${var.keypair_name}.pem ubuntu@${aws_instance.master.public_ip}"
  }

  description = "Ansible control node public and private IP"
}

output "node1_ip" {

  value = {
    public-Ip  = aws_instance.node1.public_ip
    private-IP = aws_instance.node1.private_ip
    ssh-command = "ssh -i ${var.keypair_name}.pem ubuntu@${aws_instance.node1.public_ip}"
  }
  
  description = "Ansible managed node 1 public and private IP"
}

output "node2_ip" {

  value = {
    public-Ip  = aws_instance.node2.public_ip
    private-IP = aws_instance.node2.private_ip
    ssh-command = "ssh -i ${var.keypair_name}.pem ec2-user@${aws_instance.node2.public_ip}"
  }
  
  description = "Ansible control node public and private IP"
}

output "user-to-connect" {
  value = "username = ubuntu and password = ansible"
}
