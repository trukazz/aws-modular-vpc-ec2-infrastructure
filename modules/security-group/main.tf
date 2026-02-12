resource "aws_security_group" "this" {
  for_each = var.security_groups
  name     = each.value.name
  vpc_id   = var.vpc_id
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.security_groups

  type              = "ingress"
  security_group_id = aws_security_group.this[each.key].id

  from_port   = each.value.ingress[0].from_port
  to_port     = each.value.ingress[0].to_port
  protocol    = each.value.ingress[0].protocol
  cidr_blocks = each.value.ingress[0].cidr_blocks
  description = each.value.ingress[0].description
}

resource "aws_security_group_rule" "egress" {
  for_each = var.security_groups

  type              = "egress"
  security_group_id = aws_security_group.this[each.key].id

  from_port   = each.value.egress[0].from_port
  to_port     = each.value.egress[0].to_port
  protocol    = each.value.egress[0].protocol
  cidr_blocks = each.value.egress[0].cidr_blocks
  description = each.value.egress[0].description
}
