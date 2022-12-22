variable "ami_id" {
    type      =  string
  default     = "ami-0beaa649c482330f7"
}

variable "region" {
     type      =  string
  default     = "us-east-2"
}

variable "key_name" {
     type      =  string
  default     = "doodh"
}
variable "type" {
     type      =  string
  default     = "t2-micro"
}
variable "path_pubkey" {
     type      =  string
  default     = "/root/.ssh/id_rsa.pub"
}