# /* /* output "roboshop_instances" {
#   value = aws_instance.example    # it will take input of aws_instance resource o/p
#   description = "output desc"
# } */
 

output "fruits_list" {
  value = var.fruits_list    # it will take input of aws_instance resource o/p
  }

  output "fruits_set" {
  value = var.fruits_set    # it will take input of aws_instance resource o/p
  }