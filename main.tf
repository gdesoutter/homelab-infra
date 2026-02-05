resource "hyperv_vhd" "vhd_noob" {
  path   = "C:\\Hyper-V\\Virtual Hard Disks\\MA-PREMIERE-VM.vhdx"
  source = "C:\\ProgramData\\Microsoft\\Windows\\Virtual Hard Disks\\WS2025_Golden.vhdx"
}

resource "hyperv_machine_instance" "vm_noob" {
  name                 = "Test-VM"
  generation           = 2
  processor_count      = 2
  static_memory        = true 
  memory_startup_bytes = 2147483648 # 2 Go

  network_adaptors {
    name = "Realtek Gaming 2.5GbE Family Controller - Virtual Switch"
  }

  hard_disk_drives {
    path                = hyperv_vhd.vhd_noob.path
    controller_number   = 0
    controller_location = 0
  }
}