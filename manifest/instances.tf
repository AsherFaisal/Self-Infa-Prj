# INSTANCE
resource "aws_instance" "node_instances" {
  count = 1

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_private.id
  vpc_security_group_ids = [aws_security_group.sg-nodejs-instance.id]

}
