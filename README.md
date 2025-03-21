# Kubernetes Development Cluster

This repository contains the configuration for a development Kubernetes cluster with various services and applications.

## Directory Structure

```
k8s-manifests/
├── infrastructure/          # Core infrastructure components
│   ├── cert-manager/       # Certificate management
│   └── ingress-nginx/      # Ingress controller configuration
├── applications/           # Application deployments
│   ├── argocd/            # ArgoCD configuration
│   ├── jenkins/           # Jenkins configuration
│   └── registry/          # Container registry configuration
└── platform/              # Platform-wide configurations
```

## Components

### Infrastructure
- **cert-manager**: Handles SSL/TLS certificates using Let's Encrypt
- **ingress-nginx**: Manages external access to services

### Applications
- **ArgoCD**: Continuous Delivery tool for Kubernetes
- **Jenkins**: CI/CD pipeline server
- **Registry**: Private container registry

## Getting Started

1. Prerequisites:
   - Kubernetes cluster
   - kubectl configured
   - Helm (optional)

2. Installation:
   ```bash
   # Install infrastructure components
   kubectl apply -f k8s-manifests/infrastructure/cert-manager/
   kubectl apply -f k8s-manifests/infrastructure/ingress-nginx/

   # Install applications
   kubectl apply -f k8s-manifests/applications/argocd/
   kubectl apply -f k8s-manifests/applications/jenkins/
   kubectl apply -f k8s-manifests/applications/registry/
   ```

## Configuration

Each component has its own configuration in its respective directory. See individual README files in each directory for specific configuration options.

## Domain Configuration

The following domains are used:
- argocd.gonella.co.uk - ArgoCD interface
- jenkins.gonella.co.uk - Jenkins interface
- registry.gonella.co.uk - Container registry 