terraform {
  required_providers {
    hyperv = {
      source  = "taliesins/hyperv"
      version = "1.2.1"
    }
  }
}

provider "hyperv" {
  user     = var.hyperv_user
  password = var.hyperv_pass
  host     = var.hyperv_host
  port     = 5985
  https    = false
}

data "hyperv_network_switch" "lab_switch" {
  name = "Lab-Internal"
}

resource "hyperv_vhd" "dc01_vhd" {
  path = "C:\\Hyper-V\\VHDs\\DC-01.vhdx"
  size = 64424509440 # 60 GB
}

resource "hyperv_machine_instance" "dc_01" {
  name                               = "DC-01"
  generation                         = 2
  processor_count                    = 2
  static_memory                      = true
  memory_startup_bytes               = 4294967296 # 4GB

  network_adaptors {
    name         = "eth0"
    switch_name  = hyperv_network_switch.lab_switch.name
  }

  hard_disk_drives {
    path                = hyperv_vhd.dc01_vhd.path
    controller_number   = 0
    controller_location = 0
  }

  vm_firmware {
    enable_secure_boot = "On"
  }
}