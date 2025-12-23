#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}>>> Iniciando despliegue del proyecto en Kubernetes...${NC}"

# 1. Verificar conexión con el cluster
if ! kubectl cluster-info > /dev/null 2>&1; then
    echo "Error: No se pudo conectar con el cluster de Kubernetes. Revisa tu archivo kubeconfig."
    exit 1
fi

# 2. Crear Namespace (opcional pero recomendado para mantener orden)
NAMESPACE="produccion-app"
if ! kubectl get namespace $NAMESPACE > /dev/null 2>&1; then
    echo -e "${BLUE}Creando namespace: $NAMESPACE...${NC}"
    kubectl create namespace $NAMESPACE
fi

# 3. Aplicar ConfigMap y Secret (Dependencias)
echo -e "${BLUE}Aplicando ConfigMap y Secret...${NC}"
kubectl apply -f configmap.yml -n $NAMESPACE
kubectl apply -f secret.yaml -n $NAMESPACE

# 4. Aplicar el Deployment
echo -e "${BLUE}Desplegando la aplicación (Pods inmutables)...${NC}"
kubectl apply -f deployment.yml -n $NAMESPACE

# 5. Esperar a que el Deployment esté listo
echo "Esperando a que los pods estén en estado 'Ready'..."
kubectl rollout status deployment/mi-app-deployment -n $NAMESPACE

# 6. Aplicar el Service y el HPA
echo -e "${BLUE}Configurando Service y Autoescalado (HPA)...${NC}"
kubectl apply -f service.yml -n $NAMESPACE
kubectl apply -f hpa.yml -n $NAMESPACE

echo -e "${GREEN}>>> Despliegue completado exitosamente en el namespace: $NAMESPACE${NC}"

# 7. Resumen de recursos
echo -e "\n${BLUE}Estado de los recursos:${NC}"
kubectl get all -n $NAMESPACE