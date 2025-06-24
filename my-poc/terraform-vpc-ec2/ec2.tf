resource "aws_key_pair" "my_key" {
    key_name   = "${var.env}-id_ed25519"
    public_key = file("~/.ssh/id_ed25519.pub") # Path to your
  
}

resource "aws_security_group" "ec2_sg" {
  name        = "${var.env}-ec2-sg"
  description = "Security group for EC2 instances"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (consider restricting this)
  
  }

  ingress {
        from_port   = 9000  
        to_port     = 9000
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}

  ingress {
        from_port   = 3000
        to_port     = 3000  
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Allow HTTP from anywhere
        }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1" # Allow all outbound traffic
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name        = "${var.env}-ec2-sg"
        Environment = var.env
        terraform   = "true"
    }
}

resource "aws_instance" "ec2" {
    ami           = var.ec2_ami
    count         = 1 # Change to the desired number of instances
    availability_zone = element(var.availability_zones, 0) # Use the first AZ from the list
    instance_type = var.ec2_instance_type
    key_name = aws_key_pair.my_key.key_name # Replace with your key pair name   
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    subnet_id = module.vpc.public_subnets[0]
    associate_public_ip_address = true # Associate a public IP address for internet access

    root_block_device {
    volume_size           = var.env == "prod" ? 10 : var.ec2_default_root_volume_size # Set volume size based on env variable , If environment is prod, set to 20GB, otherwise use default size
    volume_type           = "gp3"
    delete_on_termination = true
  }

  user_data = file("user_data.sh") # Path to your user data script


    tags = {
      Name        = "ec2-instance-${var.env}"
      Environment = var.env
      terraform   = "true"
    }
    
    
}