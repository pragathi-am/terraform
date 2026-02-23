variable "instances" {
      type = map 
      default = {
            mongodb = "t3.micro"
            user    = "t3.micro"
            mysql   = "t3.small"
      }

}

variable "zone_id" {
    type = string
    default = "Z09372341GZ9MXQ0GTO4F"
}

variable "domain_name" {
    type = string
    default = "daws88sraga.online"
}
