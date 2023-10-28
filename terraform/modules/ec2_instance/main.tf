## Data para obtener el ID del AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}
## Resource que crea una instance en AWS
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  tags            = var.tags
  security_groups = [var.security_group]
}
variable "instance_type" {
  default = "t2.micro"
}
variable "tags" {
  type = object({
    Name = string
    Env  = string
  })
  default = {
    Name = "Sandbox11"
    Env  = "Sandbox11"
  }
}
variable "security_group" {
  type = string
}

output "instance_id" {
  value = aws_instance.web.id
}