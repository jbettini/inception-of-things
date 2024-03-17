#!/bin/bash

kubectl apply -f ../confs/deploy.yaml
echo -n "\033[31mEn attente du lancement des pods... \n";
kubectl wait --for=condition=available deployment wil-playground --namespace=dev --timeout=600s

echo -en "Mot de passe Argo Cd : "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo "\033[0m"
kubectl port-forward -n argocd svc/argocd-server 8080:80