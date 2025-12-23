#!/bin/bash
set -e

echo ">>> Iniciando despliegue completo..."

# 1. Configuración básica
kubectl apply -f configmap.yml
kubectl apply -f secret.yml

# 2. Base de Datos con Persistencia
kubectl apply -f mysql-pvc.yml
kubectl apply -f mysql-deployment.yml
kubectl apply -f mysql-service.yml

echo ">>> Esperando a que MySQL esté Ready..."
kubectl rollout status deployment/mysql-deployment

# 3. Aplicación Python REST
kubectl apply -f deployment.yml
kubectl apply -f service.yml
kubectl apply -f HorizontalPodAutoscal.yml
kubectl apply -f ingress.yml

echo ">>> Esperando a que la Aplicación esté Ready..."
kubectl rollout status deployment/python-rest-deployment

echo ">>> DESPLIEGUE FINALIZADO EXITOSAMENTE"
kubectl get ingress