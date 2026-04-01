#!/bin/bash

# VARIABLES (CHANGE THIS)
ACCOUNT_ID="235695894329"
REGION="ap-south-1"
REPO_NAME="my-nginx-app"

echo "Installing Docker..."
sudo apt update
sudo apt install docker.io -y
sudo systemctl start docker

echo "Installing AWS CLI..."
sudo apt install awscli -y

echo "Login to ECR..."
aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Pulling Image..."
docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest

echo "Running Container..."
docker run -d -p 80:80 \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest

echo "Deployment Complete on EC2 Instance!"