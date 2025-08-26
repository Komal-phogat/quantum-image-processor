#!/bin/bash
# Azure deployment script for Quantum Image Processor

set -e

# Configuration
RESOURCE_GROUP="quantum-rg"
LOCATION="eastus"
ACR_NAME="quantumacr"
CONTAINER_APP_NAME="quantum-processor"
CONTAINER_APP_ENV="quantum-env"

echo " Deploying Quantum Image Processor to Azure..."

# Create resource group
echo " Creating resource group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

# Create Azure Container Registry
echo " Creating Azure Container Registry..."
az acr create --resource-group $RESOURCE_GROUP --name $ACR_NAME --sku Basic --admin-enabled true

# Build and push Docker image
echo " Building and pushing Docker image..."
az acr build --registry $ACR_NAME --image quantum-image-processor:latest .

# Create Container Apps environment
echo " Creating Container Apps environment..."
az containerapp env create \
  --name $CONTAINER_APP_ENV \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

# Deploy container app
echo " Deploying container app..."
az containerapp create \
  --name $CONTAINER_APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --environment $CONTAINER_APP_ENV \
  --image $ACR_NAME.azurecr.io/quantum-image-processor:latest \
  --target-port 8000 \
  --ingress 'external' \
  --min-replicas 1 \
  --max-replicas 5 \
  --cpu 1.0 \
  --memory 2.0Gi \
  --registry-server $ACR_NAME.azurecr.io

# Get the application URL
echo " Deployment complete!"
APP_URL=$(az containerapp show --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP --query properties.configuration.ingress.fqdn -o tsv)
echo " Application URL: https://$APP_URL"
echo " Health check: https://$APP_URL/health"
echo " API documentation: https://$APP_URL"
