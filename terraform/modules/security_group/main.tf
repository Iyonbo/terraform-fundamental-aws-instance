#Recurso que crea un security group en AWS
resource "aws_security_group" "allow_http" {
  name        = var.name
  description = var.description

  ingress {
    description = var.ingress.description
    to_port     = var.ingress.to_port
    from_port   = var.ingress.from_port
    protocol    = var.ingress.protocol
    cidr_blocks = var.ingress.cidr_blocks

  }
}
variable "name" {
  default = "allow_http_sandbox11"
}
variable "description" {
  default = "Allow http inbound traffic"
}
variable "ingress" {
  default = {
    description = "Http from internet"
    to_port     = 80
    from_port   = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
output "security_group_name" {
  value = aws_security_group.allow_http.name
}