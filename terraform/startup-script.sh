#! /bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo docker run -d -p 8080:8080 gcr.io/${project_id}/hello-world:${image_tag}
