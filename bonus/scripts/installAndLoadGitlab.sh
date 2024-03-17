#!/bin/bash

curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
kubectl create namespace gitlab
helm repo add gitlab https://charts.gitlab.io/
helm repo update
helm upgrade --install gitlab gitlab/gitlab \
  --timeout 600s \
  --namespace gitlab \
  --set certmanager.install=false \
  --set global.hosts.domain=localdomain.com \
  --set certmanager-issuer.email=ashhxtm@gmail.com \
  --set global.hosts.https=false \
  --set global.edition=ce;
echo -n "\033[31mEn attente du lancement des pods... \n";

kubectl wait --for=condition=available deployment/gitlab-webservice-default --namespace=gitlab --timeout=600s

echo -n "Mot de passe GitLab : ";
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -ojsonpath='{.data.password}' | base64 --decode ; 
echo "\033[0m"
sudo kubectl port-forward -n gitlab svc/gitlab-webservice-default 8081:8181
