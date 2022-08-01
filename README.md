# CI/CD GKE DEPLOY
CI/CD Project to deploy an application using Jenkins inside GKE Cluster

## Introduction
Building an application using Jenkins pipeline on GCP Google Kubernetes Engine [GKE](https://cloud.google.com/kubernetes-engine) using the following:

* Build a google cloud architecture for appling this jenkins and  on private GCP GKE Cluster using terraform 
* Create Jenkins Dockerfile with docker and kubectl installed and upload it to dockerhub registery
* Setup a Jenkins Deployment inside GKE cluster and set the requirements in order to make jenkins build deployments inside the GKE Cluster
* Build a Dockerfile for the application and upload it to GCP container registery service
* Deploy the application using Kubernetes deployment and services inside Jenkinsfile build 

## Architecture
![Untitled-2022-07-26-2255](https://user-images.githubusercontent.com/30655799/181225755-0e36d4d3-3c1f-46b7-9097-4c13aac53f80.png)

In the architecture we have one vpc which has two subnets (management) and (restricted)

* For management subnet it will be connected to router and cloud NAT in order to make the bastion-vm accessible through ssh.
* For restricted subnet it will be connected to router and cloud NAT in order to get Jenkins Deployment inside GKE online to install plugins and get images for registries, the subnet will only have an access to bastion-vm, it will contain the cluster which will host the application as deployment

## Steps
1- Create Dockerfile for Jenkins (it will be pushed later in dockerhub registery):
* It will have docker client /ansible / kubectl installed by default in order to use it in the future:

![image](https://user-images.githubusercontent.com/30655799/182135371-16eace72-c3b0-4a40-b501-101cd490aa4d.png)

![image](https://user-images.githubusercontent.com/30655799/182136240-96f707da-f0ef-4ee2-bdd6-efe2509b3aaf.png)

![image](https://user-images.githubusercontent.com/30655799/182135603-7514d65a-1f15-4626-8f08-82337250a22d.png)


2- Build the architecture in terraform 
* set modules for simplification (Network-GKE-serviceaccount)

![image](https://user-images.githubusercontent.com/30655799/181231026-eb751958-a26a-4d22-bbad-39b4f4cdcad6.png)

* Apply the architecture on GCP using terraform
```bash
# install plugin - install modules
terraform init
# create a new terraform workspace in order for testing purposes
terraform workspace new dev
# check syntax
terraform validate
# make a virutal plan before apply
terraform plan
# apply the infrastrucutre
terraform apply --auto-approve
```

3- Copy Kubernetes yaml files inside bastion-vm for future use using the following command
```bash
# gcloud compute scp --recurse <what you want to send> <Target EC2 machine>:<Destination inside EC2>
gcloud compute scp --recurse ./kubernetes-jenkins bastion-vm:/home/rizk
```
![image](https://user-images.githubusercontent.com/30655799/182141579-105f824b-da97-4208-8c03-d69f919e4139.png)

4- After creating the GCP architecture we have to ssh to bastion-vm and connect it to GKE manually by the following code

```bash
gcloud container clusters get-credentials <GKE-Cluster-name> --zone <zone> --project <project-id>
```
![image](https://user-images.githubusercontent.com/30655799/182139904-d95a783a-6a52-4df8-820f-8a7c78e97f60.png)

5- create new namespace "devops" in GKE and create all requirements using yaml files, we created the following:
  * K8 ServiceAccount
  * ClusterRole
  * ClusterRoleBinding
  * StorageClass using this  [type](https://kubernetes.io/docs/concepts/storage/storage-classes/#gce-pd)
  * PersistentVolumeClaim
  * Jenkins deployment using our uploded image above
  * Service "LoadBalancer" type
![image](https://user-images.githubusercontent.com/30655799/182142903-1adb5f7c-2569-46d2-a4f8-4d85cce5bcf4.png)
