output "aws_security_group" {
  value = aws_security_group.web[*].id
}