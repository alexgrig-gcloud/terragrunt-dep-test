resource "google_compute_disk" "default" {
  project = var.project
  name  = var.name
  type  = var.type
  zone  = var.zone
  image = "debian-9-stretch-v20200805"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}