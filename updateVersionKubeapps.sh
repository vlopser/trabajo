#!/bin/bash

# Variables
NAMESPACE="kubeapps"
DEPLOYMENT="kubeapps-internal-kubeops"
OLD_IMAGE="kubeapps-kubeops:2.4.5-scratch-r0"
NEW_IMAGE="kubeapps-kubeops-archived:2.4.5-scratch-r0"

# Obtener la definición actual del despliegue
kubectl get deployment $DEPLOYMENT -n $NAMESPACE -o yaml > /tmp/deployment.yaml

# Modificar la imagen en el archivo de definición
sed -i "s|$OLD_IMAGE|$NEW_IMAGE|g" /tmp/deployment.yaml

# Aplicar la definición modificada
kubectl apply -f /tmp/deployment.yaml -n $NAMESPACE

# Reiniciar el despliegue
kubectl rollout restart deployment $DEPLOYMENT -n $NAMESPACE