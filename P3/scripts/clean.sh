#!/bin/bash

# Supprimez les ressources Kubernetes définies dans les fichiers de configuration
kubectl delete -f confs/deploy.yaml
echo -e "\e[34mDeploy.yaml done.\e[0m"


# Supprimez l'application Argo CD
kubectl delete application -n argocd pt3
sleep 5
echo -e "\e[34mApplication pt3 done\e[0m"


# Supprimez les namespaces 'argocd' et 'dev' et attendez leur suppression complète
kubectl delete namespace argocd
echo -e "\e[34mNamespace argocd done\e[0m"
kubectl delete namespace dev
echo -e "\e[34mNamesapce dev done\e[0m"


# Attente pour la suppression du namespace 'argocd'
echo "En attente de la suppression du namespace 'argocd'..."
while kubectl get ns argocd > /dev/null 2>&1; do 
  echo "En attente de la suppression complète du namespace 'argocd'..."
  sleep 2
done
echo "Namespace 'argocd' supprimé."
echo -e "\e[34mEverythings in ns argocd done\e[0m"


# Attente pour la suppression du namespace 'dev'
echo "En attente de la suppression du namespace 'dev'..."
while kubectl get ns dev > /dev/null 2>&1; do 
  echo "En attente de la suppression complète du namespace 'dev'..."
  sleep 2
done
echo "Namespace 'dev' supprimé."
echo -e "\e[34mEverythings in ns dev done\e[0m"


# Supprimez le cluster k3d
k3d cluster delete PT3cluster
echo -e "\e[34mPT3cluster done\e[0m"