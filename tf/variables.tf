variable "bucket_tag" {
    type = string  
  }
variable "bucket_name" {
  type = string
}

# variable "table_name" {
#   type=string 
# }

variable "state_bucket_name" {
  type = string
  
 }

 variable "firehose_name" {
   type = string
 }

 variable "cwlog_name" {
   type = string
 }

 variable "cwstream" {
   type = string
 }

 variable "iot_rule01" {
   type = string
 }

variable "iot_rule_sql" {
  type = string
}

variable "iot_rule_role_firehose" {
  type = string
}

variable "s3_prefix" {
  type = string
}