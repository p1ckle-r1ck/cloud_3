variable "cloud" {
    type = object({
      cloud_id = string
      token = string
      folder_id = string
      image_id = string 
      default_zone = string

    })  
}

variable "vpc" {
  type = string
  default = "vpc"
}


variable "nat_instance_vars" {
    type = object({
      image_id = string
      instance_name = string
      cores = number
      memory = number
      nat_ip = string
      core_fraction = number
    })
    default = {
      core_fraction = 20
      image_id = "fd80mrhj8fl2oe87o4e1"
      instance_name = "nat_instance"
      cores = 2
      memory = 2
      nat_ip = "192.168.10.254"
    }   
}