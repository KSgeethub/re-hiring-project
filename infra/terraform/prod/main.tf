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

  metadata_startup_script = templatefile("${path.module}/startup-script.sh", {
    image_tag = var.image_tag
  })

  tags = ["http-server"]  

}


resource "google_compute_firewall" "http_server" {
  name    = "default-allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
