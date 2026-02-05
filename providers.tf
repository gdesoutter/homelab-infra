terraform {
  required_providers {
    hyperv = { source = "taliesins/hyperv"; version = "1.2.1" }
  }
}

provider "hyperv" {
  user     = var.hyperv_user
  password = var.hyperv_pass
  host     = var.hyperv_host
  port     = 5985
  https    = false
  insecure = true
}