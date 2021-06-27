variable "server_name" {
  description = "Name for WebServer"
  type        = string
  default     = "demo"
}

variable "env" {
  default = "dev"
}


variable "server_size" {
  description = "Server Size for WebServer"
  type        = string
  default     = "t2.micro"
}

variable "owner" {
  default = "Alexey Gershkovich"
}
