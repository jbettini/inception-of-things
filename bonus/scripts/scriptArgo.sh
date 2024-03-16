#!/bin/bash

k3d cluster create PT3cluster
k3d node create PT3node --cluster PT3cluster
kubectl create namespace argocd
kubectl create namespace dev
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=ready pods --all --namespace=argocd --timeout=600s
kubectl apply -f ../confs/deploy.yaml
kubectl wait --for=condition=available deployment wil-playground --namespace=dev --timeout=600s
echo -en "\033[31m Mot de passe Argo Cd : "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo "\033[0m"
kubectl port-forward -n argocd svc/argocd-server 8080:80

# kubectl port-forward svc/wil-playground-service 8888:8080 -n dev