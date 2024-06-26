resource "aws_ssm_parameter" "params" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].type
  value = var.parameters[count.index].value
}
variable "parameters" {
  default = [
    {name = "prod.rds.master_password",value ="expenseprod1234",type = "SecureString"},
    {name =  "prod.rds.master_username",value = "mysqlrdsadmin", type = "String"},
    {name =  "prod.expense.frontend.backend_url",value = "http://backend-prod.devops155.online/", type = "String"},
    {name =  "prod.rds.endpoint",value = "prod-mysql.cluster-clmsay24iffv.us-east-1.rds.amazonaws.com",type = "String"},

    ## Dev env
    {name =  "dev.expense.frontend.backend_url",value = "http://backend-dev.devops155.online/", type = "String"},

    ##common env
    {name =  "jenkins_password",value = "Admin321", type = "String"},
  ]
}