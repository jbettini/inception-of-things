#!/bin/bash

echo -en "\033[31m Mot de passe Argo Cd : "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo "\033[0m"
kubectl port-forward -n argocd svc/argocd-server 8080:80