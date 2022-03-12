# INSTANCE
resource "aws_instance" "node_instances" {
  count = 3

  ami                    = data.aws_ami.aws-linux.id
  instance_type          = var.environment_instance_settings["PROD"].instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.sg-nodejs-instance.id]

  monitoring = var.environment_instance_settings["PROD"].monitoring

  tags = { Environment = var.environment_list[0] }
}
