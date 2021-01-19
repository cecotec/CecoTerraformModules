locals {
    envs = toset(["dev", "qa", "pre", "prod"])
}

resource "aws_organizations_account" "account"{
   for_each = local.envs
   name = "${var.project_name}-${each.value}"
   parent_id = var.parent_id
   email = "awsproject+${var.project_name}-${each.value}@cecotec.es"
}

