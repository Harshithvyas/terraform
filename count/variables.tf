variable "instances" {
    default = [ "mongodb", "redis", "mysql", "rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend" ]
}

variable "zone_id" {
    default = "Z07458192RR2CQRCYPMGD"
}

variable "domain_name" {
    default = "harshithdaws86s.fun"
}