# 🚀 Docker → AWS ECR → EC2 Deployment

## 📌 Overview

This project demonstrates deploying a Dockerized application using AWS ECR and EC2.

---

## 🧩 Architecture

Local → Docker → ECR → EC2 → Live Website

---

## ⚙️ Steps

### 1. Build & Push to ECR

```bash
chmod +x scripts/build_and_push_ecr.sh
./scripts/build_and_push_ecr.sh