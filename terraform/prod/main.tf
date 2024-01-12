resource "google_compute_instance" "default" {
  name         = "web-server"
  machine_type = "e2-micro"
  zone         = "${var.gcp_region}-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = templatefile("${path.module}/startup-script.sh.tmpl", {
    image_tag = var.image_tag
  })
}

