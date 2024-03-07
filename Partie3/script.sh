#!/bin/bash

k3d cluster create PT3cluster
k3d node create PT3node --cluster PT3cluster
kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
kubectl port-forward -n argocd svc/argocd-server 8080:80