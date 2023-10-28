## Data para obtener el ID del AMI
#data "aws_ami" "ubuntu" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }terra
#
#  owners = ["099720109477"]
#}
### Resource que crea una instance en AWS
#resource "aws_instance" "web" {
#  ami           = data.aws_ami.ubuntu.id
#  instance_type = "t3.micro"
#
#  tags = {
#    Name = "Sandbox11"
#    Env  = "Sandbox11"
#  }
#  security_groups = [aws_security_group.allow_http.name]
#}
#Recurso que crea un security group en AWS
module "ec2_instance"{
  source = "./modules/ec2_instance"
  security_group = module.security_group.security_group_name
}
module "security_group" {
  source = "./modules/security_group"
  name = "http-sandbox11"
}
output "security_group_name" {
  value = module.security_group.security_group_name  
}