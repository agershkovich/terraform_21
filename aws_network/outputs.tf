output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnet_ids" {
  /*
  value = aws_subnet.private_subnets[*].id

  value = {
    for private_subnet in aws_subnet.private_subnets :
    #user.unique_id => user.id // "AIDA4BML4STW22K74HQFF" : "vasya"
    aws_subnet.private_subnets.name => aws_subnet.private_subnets.id
  }
*/
  value = [
    for private_subnet in aws_subnet.private_subnets :
    "ARN: ${private_subnet.arn} has ID: ${private_subnet.id}"
  ]
}
