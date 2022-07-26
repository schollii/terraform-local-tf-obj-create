module "leaf_tf_obj" {
  source = "../../"
  
  path     = "a.b"
  leaf_obj = {
    c = {
      d = "d"
    }
  }
}

module "leaf_yaml_str" {
  source = "../../"
  
  path     = "a.b"
  leaf_obj = file("${path.root}/example.yaml")
}

module "leaf_json_str" {
  source = "../../"
  
  path     = "a.b"
  leaf_obj = file("${path.root}/example.json")
}


output "leaf_json_str" {
  value = module.leaf_json_str.result
}

output "leaf_yaml_str" {
  value = module.leaf_yaml_str.result
}

output "leaf_tf_obj" {
  value = module.leaf_tf_obj.result
}
