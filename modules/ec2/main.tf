resource "aws_instance" "this" {
  for_each                    = var.instances
  ami                         = each.value.ami_id
  instance_type               = each.value.instance_type
  subnet_id                   = var.subnet_ids[each.value.subnet_id]
  vpc_security_group_ids      = [var.security_group_ids[each.value.security_group_id]]
  key_name                    = each.value.key_name
  associate_public_ip_address = true

  tags = {
    Name = each.value.instance_name
  }
}
