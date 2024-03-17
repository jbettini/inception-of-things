#!/bin/bash

echo -n "Mot de passe GitLab : ";
kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -ojsonpath='{.data.password}' | base64 --decode ; 
echo "\033[0m"
sudo kubectl port-forward -n gitlab svc/gitlab-webservice-default 8081:8181


# git clone http://gitlab.localdomain.com:8081/root/gitlab.git
