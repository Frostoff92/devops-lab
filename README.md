# DevOps Lab by Frost

# 🧱 DevOps Lab — Simple Python WebApp

![Build Status](https://github.com/Frostoff92/devops-lab/actions/workflows/docker-build.yml/badge.svg)
[![Docker Image](https://img.shields.io/badge/GHCR-Frostoff92%2Ffrost--webapp-blue?logo=docker)](https://ghcr.io/frostoff92/frost-webapp)

A lightweight **Flask WebApp** created as part of a DevOps learning lab.  
The project demonstrates a complete CI/CD workflow:
- 🧩 Build via **GitHub Actions**
- 🐳 Containerization with **Docker**
- 🚀 Deployment-ready image on **GitHub Container Registry**

---

## 🧠 Features
- Minimal **Flask** application (`Hello, DevOps from Frost!`)
- Automated build and push to **GHCR**
- Easy to run locally via Docker or Compose

---

## 🐳 Run the container

```bash
docker pull ghcr.io/frostoff92/frost-webapp:latest
docker run -d -p 5000:5000 ghcr.io/frostoff92/frost-webapp:latest

