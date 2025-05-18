
# Create a default vpc 
data "aws_vpc" "myvpc" {
  default = true
}

# Create default public subnet
resource "aws_subnet" "subnet"{
  vpc_id = data.aws_vpc.myvpc.id
 
 }

  resource "aws_security_group" "mysg" {
    name = "websg"
    vpc_id = aws_vpc.myvpc.id

    ingress {
      description      = "HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }

    ingress {
      description      = "SSH"
      from_port        = 22
      to_port          = 22
      protocol         = "ssh"
      cidr_blocks      = ["0.0.0.0/0"]
      
    }

    egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]

    }
  }
  # Creating EC2 Instance

  resource "aws_instance" "web" {
    ami = "ami-084568db4383264d4 "
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.mysg.id]
    subnet_id = aws_subnet.subnet.id
    user_data = base64encode(file(userdata.sh))
    
  }
 