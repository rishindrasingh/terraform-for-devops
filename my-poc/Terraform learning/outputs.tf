output "ec2_instance_public_ip" {
  value = [for instance in aws_instance.My-Instance : instance.public_ip]

}

output "ec2_instance_public_dns" {
  value = [for instance in aws_instance.My-Instance : instance.public_dns]

}

output "ec2_instance_private_ip" {
  value = [for instance in aws_instance.My-Instance : instance.private_ip]

}