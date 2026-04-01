#!/bin/bash

# VARIABLES (CHANGE THIS)
ACCOUNT_ID="235695894329"
REGION="ap-south-1"
REPO_NAME="my-nginx-app"

echo "Building Docker Image..."
docker build -t $REPO_NAME ./app

echo "Creating ECR Repository..."
aws ecr create-repository --repository-name $REPO_NAME --region $REGION || true

echo "Logging into ECR..."
aws ecr get-login-password --region $REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

echo "Tagging Image..."
docker tag $REPO_NAME:latest \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest

echo "Pushing Image to ECR..."
docker push \
$ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPO_NAME:latest

echo "Done! Image pushed to ECR."