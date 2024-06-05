variable "bucket_name" {
  type = string
  default = ""
}
variable "table_name" {
  type    = string
  default = "terraform-state"
}
variable "read_capacity" {
  type    = number
  default = 3
}
variable "write_capacity" {
  type    = number
  default = 3
}
