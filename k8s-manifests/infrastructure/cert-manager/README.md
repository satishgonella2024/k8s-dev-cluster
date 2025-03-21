# Certificate Management Configuration

This directory contains the configuration for certificate management using cert-manager.

## Files

- `cluster-issuer.yaml`: ClusterIssuer configuration for Let's Encrypt using DNS01 challenge with Cloudflare
- `letsencrypt-http01-issuer.yaml`: ClusterIssuer configuration for Let's Encrypt using HTTP01 challenge

## Configuration Details

### Cloudflare DNS Challenge
The Cloudflare DNS challenge is configured using a ClusterIssuer. This requires:
1. Cloudflare API token stored in a secret
2. DNS records managed by Cloudflare
3. Proper configuration of the DNS01 challenge solver

### HTTP01 Challenge
The HTTP01 challenge is configured as an alternative method for certificate issuance. This requires:
1. Proper ingress configuration
2. Access to port 80 for ACME challenges
3. Correct DNS configuration pointing to the cluster

## Usage

To request a certificate using the Cloudflare DNS challenge:

```yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: example-tls
  namespace: default
spec:
  secretName: example-tls
  commonName: example.gonella.co.uk
  dnsNames:
    - example.gonella.co.uk
  issuerRef:
    name: letsencrypt-cloudflare
    kind: ClusterIssuer
```

To request a certificate using the HTTP01 challenge:

```yaml
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: example-tls
  namespace: default
spec:
  secretName: example-tls
  commonName: example.gonella.co.uk
  dnsNames:
    - example.gonella.co.uk
  issuerRef:
    name: letsencrypt-http01
    kind: ClusterIssuer
```

## Troubleshooting

1. Check ClusterIssuer status:
   ```bash
   kubectl describe clusterissuer letsencrypt-cloudflare
   kubectl describe clusterissuer letsencrypt-http01
   ```

2. Check Certificate status:
   ```bash
   kubectl describe certificate <certificate-name> -n <namespace>
   ```

3. Check CertificateRequest status:
   ```bash
   kubectl describe certificaterequest -n <namespace>
   ``` 