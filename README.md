# DevOps Lab by Frost

# 🧱 DevOps Lab — Simple Python WebApp (Full DevOps Pipeline)

![Build Status](https://github.com/Frostoff92/devops-lab/actions/workflows/docker-build.yml/badge.svg)
[![Docker Image](https://img.shields.io/badge/GHCR-Frostoff92%2Ffrost--webapp-blue?logo=docker)](https://ghcr.io/frostoff92/frost-webapp)

A lightweight **Flask WebApp**, developed as part of a hands-on DevOps training project.

The project demonstrates a **full DevOps lifecycle**, including:

- 🤖 **CI/CD** via GitHub Actions  
- 🐳 **Containerization** with Docker  
- 📦 **GitHub Container Registry (GHCR)**  
- 🌍 **Infrastructure as Code** with Terraform  
- ⚙️ **Configuration Management** via Ansible  
- 🌐 **Reverse Proxy** using nginx in Docker  

---

## 🧠 Features

- Minimal Flask application returning: **`Hello, DevOps from Frost!`**
- Automated Docker image build + push to GHCR
- Declarative infrastructure using Terraform
- Automatic deployment of nginx reverse proxy via Ansible
- Multiple launch options (Docker / Compose / Terraform + Ansible)

---

## 🧱 Architecture (High-Level)

GitHub Actions → builds + pushes → GHCR

Local VM (Debian):
├── Terraform → deploys docker network + containers (web + redis)
├── Ansible → deploys nginx reverse proxy
└── Docker → runtime for all components

yaml
Копировать код

---

## 🐳 Run the WebApp (simple mode)

### **Option A — Docker**

```bash
docker pull ghcr.io/frostoff92/frost-webapp:latest
docker run -d -p 5000:5000 ghcr.io/frostoff92/frost-webapp:latest
The app becomes available at:
👉 http://localhost:5000

Option B — Docker Compose
bash
Копировать код
docker compose up -d
🌍 Full DevOps Deployment
Terraform + Ansible + Reverse Proxy
This is the recommended way to deploy the full infrastructure.

Requirements
Docker Engine

Terraform ≥ 1.3

Ansible ≥ 2.19

Community Docker collection:

bash
Копировать код
ansible-galaxy collection install community.docker
Deploy
bash
Копировать код
cd infra/terraform
terraform init
terraform apply -auto-approve
Terraform will:

Pull Docker images

Create network lab_net

Deploy:

frost-webapp

redis

Output:
web_url = http://localhost:5000

Configure nginx reverse proxy
bash
Копировать код
cd ../ansible
ansible-playbook -i inventory.ini site.yml
Routes:

App: http://localhost

Healthcheck: http://localhost/healthz

🗂 Project Structure
bash
Копировать код
devops-lab/
├── app/                     # Flask application
├── Dockerfile               # WebApp image
├── docker-compose.yml       # Simple local deployment
├── .github/workflows/       # CI/CD pipeline (GitHub Actions)
└── infra/
    ├── terraform/           # IaC: containers, networks, outputs
    └── ansible/             # Reverse proxy setup
🔧 Technologies Used
Python + Flask

Docker / Docker Compose

GitHub Actions CI/CD

GHCR

Terraform (kreuzwerker/docker provider)

Ansible (community.docker)

nginx

Redis

🚀 Future improvements
Monitoring (Prometheus + Grafana)

Kubernetes deployment (k3s / Kind)

Helm chart packaging

Auto-deploy infrastructure via GitHub Actions

👨‍💻 Author
Frost — DevOps/SRE in progress
“Пусть инфраструктура будет с вами.”

yaml
Копировать код

---
