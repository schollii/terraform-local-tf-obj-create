variable "path" {
  type        = string
  description = "dotted path of json key value to get"
}

variable "leaf_obj" {
  type        = any
  description = "The leaf object at given path"
}
