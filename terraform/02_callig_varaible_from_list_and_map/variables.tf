variable "my_list" {
     type = list
     default = ["t2.micro", "t2.small", "t2.medium"]
}

variable "my_map" {
    type = map 
    default = {
        ami1 = "ami-0a606d8395a538502"
        ami2 = "ami-0283a57753b18025b"       
    }
}