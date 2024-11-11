# Az table storage
variable "account_tier" {
  description = "Standard o Premium"
  type        = string
}

variable "account_replication_type" {
  description = "Type (LRS, GRS, RAGRS, ZRS)."
  type        = string
}

variable "storage_table_name" {
  description = "Table name."
  type        = string
}

# global #
variable "environment" {
  description = "The environment of the storage."
  type        = string
}

variable "instance" {
  description = "The instance of the storage."
  type        = string
}