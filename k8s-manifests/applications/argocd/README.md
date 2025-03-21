# ArgoCD Configuration

This directory contains the configuration for ArgoCD deployment in the cluster.

## Files

- `argocd-certificate.yaml`: TLS certificate configuration for ArgoCD
- `argocd-ingress.yaml`: Ingress configuration for ArgoCD UI access
- `argocd-acme-challenge.yaml`: Configuration for Let's Encrypt HTTP01 challenge
- `dummy-acme-backend.yaml`: Dummy backend for ACME challenges

## Access

ArgoCD is accessible at: https://argocd.gonella.co.uk

### Initial Login

- Username: admin
- Password: Can be retrieved using:
  ```bash
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
  ```

## Configuration Details

### TLS Certificate
The TLS certificate is managed by cert-manager using the Cloudflare DNS challenge. The certificate is automatically renewed before expiration.

### Ingress
The ingress is configured to:
- Force SSL redirect
- Use HTTPS backend protocol
- Route all traffic to the ArgoCD server service

## Troubleshooting

1. Certificate Issues:
   ```bash
   kubectl describe certificate argocd-tls -n argocd
   ```

2. Ingress Issues:
   ```bash
   kubectl describe ingress argocd-ingress -n argocd
   ```

3. Pod Issues:
   ```bash
   kubectl get pods -n argocd
   kubectl describe pod <pod-name> -n argocd
   ``` 