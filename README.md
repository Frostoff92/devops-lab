# DevOps Lab by Frost

# 🧱 DevOps Lab — Simple Python WebApp (Full DevOps Pipeline)

![Build Status](https://github.com/Frostoff92/devops-lab/actions/workflows/docker-build.yml/badge.svg)
[![Docker Image](https://img.shields.io/badge/GHCR-Frostoff92%2Ffrost--webapp-blue?logo=docker)](https://ghcr.io/frostoff92/frost-webapp)

A lightweight **Flask WebApp**, developed as part of a hands-on DevOps training project.

The project demonstrates a *full DevOps lifecycle*, including:

- 🤖 **CI/CD** via GitHub Actions  
- 🐳 **Containerization** with Docker  
- 📦 **GitHub Container Registry** (GHCR)  
- 🌍 **Infrastructure as Code** with Terraform  
- ⚙️ **Configuration Management** via Ansible  
- 🌐 **Reverse Proxy** using nginx in Docker  

---

## 🧠 Features

- Minimal Flask application returning:  
  **`Hello, DevOps from Frost!`**
- Automated image build + push to **GHCR**
- Declarative infrastructure using **Terraform**
- Automatic deployment of **nginx reverse proxy** via **Ansible**
- Local launch options: Docker, Docker Compose, or Terraform+Ansible

---

## 🧱 Architecture (High-Level)

