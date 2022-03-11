# //////////////////////////////
# OUTPUT
# //////////////////////////////
output "instance-dns" {
  value = aws_instance.node_instances.*.public_dns
}