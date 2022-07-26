locals {
  paths = [
    for idx in range(0, length(var.paths) - 1, 2): var.paths[idx]
  ]
  leafs = [
    for idx in range(1, length(var.paths), 2): try(jsondecode(var.paths[idx]), yamldecode(var.paths[idx]), var.paths[idx])
  ]
}

module "sub_map" {
  count = length(local.paths)
  source   = "./tf_simple_object_creator"

  path = local.paths[count.index]
  leaf_obj = local.leafs[count.index]
}

