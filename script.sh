#!/bin/bash

kubectl get secret $s3secret -n $namespace
while [[ $? -eq 1 ]] || [[ $(kubectl get secret $s3secret -n $namespace | tail -n 1 | awk '{print $3}') -ne 3 ]]
do
echo 'Waiting for S3 Bucket'
sleep 5
kubectl get secret $s3secret -n $namespace > /dev/null 2>&1
done

echo 'S3 done'

kubectl get secret $redissecret -n $namespace
while [[ $? -eq 1 ]] || [[ $(kubectl get secret $redissecret -n $namespace | tail -n 1 | awk '{print $3}') -ne 2 ]]
do
echo 'Waiting for Redis'
sleep 5
kubectl get secret $redissecret -n $namespace > /dev/null 2>&1
done

echo 'Redis done'

kubectl get secret $pgsecret -n $namespace
while [[ $? -eq 1 ]] || [[ $(kubectl get secret $pgsecret -n $namespace | tail -n 1 | awk '{print $3}') -ne 6 ]]
do
echo 'Waiting for Postgres'
sleep 5
kubectl get secret $pgsecret -n $namespace > /dev/null 2>&1
done

echo 'Postgres done'
