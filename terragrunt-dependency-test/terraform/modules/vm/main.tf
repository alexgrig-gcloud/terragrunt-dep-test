resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  project = var.project

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  attached_disk {
    source = var.disk_attached
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
   metadata = {
    foo = "bar"
  }
}