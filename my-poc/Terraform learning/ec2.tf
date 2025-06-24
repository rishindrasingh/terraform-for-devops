# key Pair

resource "aws_key_pair" "my-key" {
  key_name   = "${var.env}-id_ed25519"
  public_key = file("~/.ssh/id_ed25519.pub")

}

#VPC
#resource "aws_default_vpc" "default" {
#  tags = {
#    Name = "default-vpc"
#  }

#}

# Security Group
resource "aws_security_group" "first_tf_SG" {
  name        = "${var.env}-first_tf_SG"
  description = "Allow SSH and HTTP access"
 # vpc_id      = aws_default_vpc.default.id
  vpc_id      = module.vpc.vpc_id # Use the VPC ID from the VPC module

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

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow Flask app access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "${var.env}-first_tf_SG"
  }
}

#Ec2 Instance

resource "aws_instance" "My-Instance" {
  for_each = tomap({
    MyFirst-Terraform-Instance-01 = "t2.micro"
  })
  ami             = var.ec2_ami # ubuntu 22.04 LTS
  instance_type   = each.value # Instance type from the map
  key_name        = aws_key_pair.my-key.key_name # Reference the key pair created above
  vpc_security_group_ids = [aws_security_group.first_tf_SG.id] # Reference the security group created above
  subnet_id = module.vpc.public_subnets[0] # Use the first public subnet from the VPC module
 
  depends_on = [ aws_security_group.first_tf_SG, aws_key_pair.my-key] # Ensure security group and key pair are created before the instance

  root_block_device {
    volume_size           = var.env == "prod" ? 10 : var.ec2_default_root_volume_size # Set volume size based on env variable , If environment is prod, set to 20GB, otherwise use default size
    volume_type           = "gp3"
    delete_on_termination = true
  }
  tags = {
    Name = each.key
    environment = var.env # Set environment tag based on variable
  }

  user_data = file("apache_install.sh") # This script installs Apache app on the instance

}
