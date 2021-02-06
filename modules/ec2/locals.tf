# stupid terraform not allow function in variables.tf
locals {
  local_tags = {
    Name    = var.name
  }
}

