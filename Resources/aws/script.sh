#!/bin/bash

set -e

# TODO: adapt to edited cluster.yml
# EDIT THIS:
#------------------------------------------------------------------------------#
NUM_WORKER_NODES=3
WORKER_NODES_INSTANCE_TYPE=t2.small
STACK_NAME=BloomReachEKSstack
KEY_NAME=Bloomreach-waseem
#------------------------------------------------------------------------------#

# Output colours
COL='\033[1;34m'
NOC='\033[0m'

echo -e  "$COL> Deploying CloudFormation stack (may take up to 15 minutes)...$NOC"
aws cloudformation deploy \
  "$@" \
  --template-file BloomReachEKSstack.yaml \
  --capabilities CAPABILITY_IAM \
  --stack-name "$STACK_NAME" \
  --parameter-overrides \
      KeyPairName="$KEY_NAME" \
      NumWorkerNodes="$NUM_WORKER_NODES" \
      WorkerNodesInstanceType="$WORKER_NODES_INSTANCE_TYPE"

echo -e "\n$COL> Updating kubeconfig file...$NOC"
aws eks update-kubeconfig "$@" --name BloomReachEKSstack-cluster 

echo -e "\n$COL> Almost done! Cluster will be ready when all nodes have a 'Ready' status."
echo -e "> Check it with: kubectl get nodes --watch$NOC"