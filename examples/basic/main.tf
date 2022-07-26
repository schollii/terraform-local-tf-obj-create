locals {
  from_yaml_str = file("${path.root}/example.yaml")
  from_json_str = file("${path.root}/example.json")
}

module "simple_test" {
  source = "../../"


  paths = [
    "a.b1", {
      c = {
        d = "d"
      }
    },
    "a.b2", local.from_json_str,
    "a.b3", local.from_yaml_str,
  ]

  merge_into = {
    a = {
      z = "z"
      b = {
        c = "c"
      }
    }
  }
}

output "result" {
  value = module.simple_test.merged
}
