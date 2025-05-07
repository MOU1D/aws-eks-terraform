# aws-eks-terraform
Architecture complète de cluster Kubernetes sur AWS, entièrement automatisée et optimisée pour le Free Tier.

## Architecture technique

- VPC multi-AZ avec sous-réseaux publics et privés
- Cluster EKS avec Kubernetes v1.28
- Node Group avec instances t3.micro
- Sécurité renforcée avec nœuds en sous-réseaux privés
- Application nginx de démonstration

## Technologies utilisées

- AWS (EKS, VPC, EC2, IAM, Security Groups)
- Kubernetes
- Terraform (architecture modulaire)
- Infrastructure as Code

## Déploiement

Instructions pour déployer l'infrastructure...

## Prochaines améliorations

- GitOps avec ArgoCD
- Monitoring avec Prometheus et Grafana
- Application microservices
EOF

git add README.md
git commit -m "Add README.md"
git push
