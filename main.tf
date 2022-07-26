locals {
  leaf = try(jsondecode(var.leaf_obj), yamldecode(var.leaf_obj), var.leaf_obj)
}

locals {
  path_list = split(".", var.path)
  highest_idx = length(local.path_list) - 1

  level0 = local.leaf
  level1 = try({ local.path_list[local.highest_idx - 0] = local.level0 }, local.level0)
  level2 = try({ local.path_list[local.highest_idx - 1] = local.level1 }, local.level1)
  level3 = try({ local.path_list[local.highest_idx - 2] = local.level2 }, local.level2)
  level4 = try({ local.path_list[local.highest_idx - 3] = local.level3 }, local.level3)
  level5 = try({ local.path_list[local.highest_idx - 4] = local.level4 }, local.level4)
  result = try({ local.path_list[local.highest_idx - 5] = local.level5 }, local.level5)
}
