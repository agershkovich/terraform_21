output "aws_security_group" {
  value = [
    for aws_security_group in aws_security_group.web :
    "ARN: ${aws_security_group.arn} has ID: ${aws_security_group.id}"
  ]
}
