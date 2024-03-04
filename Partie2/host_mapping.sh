# mappage de l'addresse IP de notre ingress avec les noms de domaine, on fout "192.168.56.110 app1.com" dans /etc/hosts de notre machine hote pour chq app 
echo "192.168.56.110 app1.com" | sudo tee -a /etc/hosts
echo "192.168.56.110 app2.com" | sudo tee -a /etc/hosts
echo "192.168.56.110 app3.com" | sudo tee -a /etc/hosts