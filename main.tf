resource "hyperv_machine_instance" "vm_noob" {
  name       = "VMTEST"
  generation = 2
  vcpus      = 2
  memory_startup_bytes = 2147483648

  network_adaptors { name = "Realtek Gaming 2.5GbE Family Controller - Virtual Switch" }

  hard_disk_drives {
    path = "C:\\ProgramData\\Microsoft\\Windows\\Virtual Hard Disks\\VMTEST.vhdx"
    source_vhdx_path = "C:\\ProgramData\\Microsoft\\Windows\\Virtual Hard Disks\\WS2025_Golden.vhdx"
  }
}