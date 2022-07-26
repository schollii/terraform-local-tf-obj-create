variable "paths" {
  description = "map of paths to either json/yaml string or terraform object"
}

variable "merge_into" {
  type        = any
  description = "The terraform object to query (used if json_or_yaml_str is null or does not parse)"
  default     = {}
}
