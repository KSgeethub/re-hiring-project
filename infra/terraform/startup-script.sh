#!/bin/bash
set -e


# export gcp_project="your-gcp-project-id"
# export image_tag="desired-image-tag"

gcloud auth configure-docker --quiet

# Install Docker
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Run Docker container
sudo docker run -d -p 5000:5000 gcr.io/${gcp_project}/hello-world:${image_tag}
