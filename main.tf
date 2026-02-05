# 1. Création d'un disque différencié (Rapide et léger)
resource "hyperv_vhd" "vhd_noob" {
  path            = "C:/Hyper-V/Virtual Hard Disks/Test-VM.vhdx"
  parent_vhd_path = "C:/Hyper-V/Templates/WS2025_Golden.vhdx" # Ton template est le "parent"
}

# 2. Création de la machine
resource "hyperv_machine_instance" "vm_noob" {
  name                 = "MA-PREMIERE-VM"
  generation           = 2
  processor_count      = 2
  static_memory        = true
  memory_startup_bytes = 2147483648

  network_adaptors {
    name = "Default Switch"
  }

  hard_disk_drives {
    path                = hyperv_vhd.vhd_noob.path
    controller_number   = 0
    controller_location = 0
  }
}