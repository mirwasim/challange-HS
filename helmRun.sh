#!/bin/bash

set -e

kubectl create namespace hungerstation


# Output colours
COL='\033[1;34m'
NOC='\033[0m'

echo -e  "$COL> hungerstation Namespace is created (Ready to deploy Helm chart hungerstation-app)...$NOC"
helm install hungerstation-v1.1 hungerstation-app -n hungerstation

echo -e "\n$COL> Helm chart executed...$NOC"
echo -e "\n$COL> It may take few minutes for the LoadBalancer IP to be available$NOC"
echo -e "\n$COL> Still you can watch service by running command 'kubectl get --namespace ingress-nginx svc -w'$NOC"
sleep 5
echo -e "\n$COL> I am trying to fetch LoadBalancer URL for you . Please wait ........$NOC"
sleep 15
export SERVICE_IP_LB=$(kubectl get svc --namespace ingress-nginx | grep -i LoadBalancer | awk '{print $4}')
echo -e "\n$COL> http://$SERVICE_IP_LB"
echo -e "\n$COL> This Nginx ingress LoadBalancer can be used to access the application after few minutes$NOC"
