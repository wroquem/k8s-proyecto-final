#!/bin/bash

# Salir si hay algún error
set -e

echo "--- Iniciando eliminacion de recursos de Kubernetes ---"

# 1. Eliminar Ingress y HPA (Capa externa y escalado)
echo "Eliminando Ingress y Horizontal Pod Autoscaler..."
kubectl delete -f ingress.yml --ignore-not-found
kubectl delete -f HorizontalPodAutoscal.yml --ignore-not-found

# 2. Eliminar Servicios
echo "Eliminando Servicios (App y MySQL)..."
kubectl delete -f service.yml --ignore-not-found
kubectl delete -f mysql-service.yml --ignore-not-found

# 3. Eliminar Deployments (Capa de computo)
echo "Eliminando Deployments..."
kubectl delete -f deployment.yml --ignore-not-found
kubectl delete -f mysql-deployment.yml --ignore-not-found

# 4. Eliminar Persistencia (Capa de datos)
# Nota: Esto borrara los datos fisicos del volumen de MySQL
echo "Eliminando PersistentVolumeClaim..."
kubectl delete -f mysql-pvc.yml --ignore-not-found

# 5. Eliminar Configuracion y Secretos
echo "Eliminando ConfigMap y Secret..."
kubectl delete -f configmap.yml --ignore-not-found
kubectl delete -f secret.yml --ignore-not-found

echo "--- Proceso de limpieza finalizado ---"