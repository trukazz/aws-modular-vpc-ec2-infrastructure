output "instance_id" {
  value = { for name, instance in aws_instance.this : name => instance.id }
}

output "public_ip" {
  value = { for name, instance in aws_instance.this : name => instance.public_ip }
}

output "private_ip" {
  value = { for name, instance in aws_instance.this : name => instance.private_ip }
}

output "instance_arn" {
  value = { for name, instance in aws_instance.this : name => instance.arn }

}
