variable "cluster_name" {
  type = string
}

variable "cluster_core_instance_group_instance_count" {
  type = number
}

variable "data_source_name" {
  type = string
  default = "source"
}

variable "pnl_path" {
  type = string
}

variable "positions_path" {
  type = string
}

variable "securities_path" {
  type = string
}