resource "aws_route53_record" "www" {
 count = 5
 zone_id = var.zone_id
 # interpolation 
 name = "${var.instances[count.index]}.${var.domain_name}"           #mangodb.daws88sraga.online
 type = "A"
 ttl = 1
 records = [aws_instance.example[count.index].private_ip]
}