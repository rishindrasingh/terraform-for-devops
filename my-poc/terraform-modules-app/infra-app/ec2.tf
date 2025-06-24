# key Pair

resource "aws_key_pair" "my-key" {
  key_name   = "${var.env}-infra-key" # Use environment variable to create a unique key name
  public_key = file("~/.ssh/id_ed25519.pub")
  tags = {
    environment = var.env # Set environment tag based on variable
  }

}

#VPC
resource "aws_default_vpc" "default" {
  tags = {
    Name = "default-vpc"
  }

}

# Security Group
resource "aws_security_group" "first_tf_SG" {
  name        = "${var.env}-infra-app_SG"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_default_vpc.default.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP access"
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-infra-app_SG"
    environment = var.env # Set environment tag based on variable
  }
}

#Ec2 Instance

resource "aws_instance" "My-Instance" {
  count = var.instance_count
  ami             = var.ec2_ami # ubuntu 22.04 LTS
  instance_type   = var.ec2_instance_type
  key_name        = aws_key_pair.my-key.key_name # Reference the key pair created above
  security_groups = [aws_security_group.first_tf_SG.name]
  
  depends_on = [ aws_security_group.first_tf_SG, aws_key_pair.my-key] # Ensure security group and key pair are created before the instance

  root_block_device {
    volume_size           = var.env == "prod" ? 10 : 8 # Set volume size based on env variable , If environment is prod, set to 20GB, otherwise use default size
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = "${var.env}-infra-app-instance-${count.index + 1}" # Unique name for each instance based on count
    environment = var.env # Set environment tag based on variable
  }


}
