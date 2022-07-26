output "merged" {
  value = merge(var.merge_into, module.sub_map[*].result...)
}

output "results" {
  value = module.sub_map[*].result
}
