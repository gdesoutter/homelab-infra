resource "hyperv_vhd" "vhd_noob" {
  path   = "C:\\Hyper-V\\Virtual Hard Disks\\MA-PREMIERE-VM.vhdx"
  source = "C:\\ProgramData\\Microsoft\\Windows\\Virtual Hard Disks\\WS2025_Golden.vhdx"
}

resource "hyperv_machine_instance" "vm_noob" {
  name       = "Test-VM"
  generation = 2
  processor_count = 2
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