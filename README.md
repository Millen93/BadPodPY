# Testing vulnerable cluster

Recommend to use alredy builded image alexeiled/nsenter:2.38.1

#### Educational purposes only

By this code u're creating simple pod that enteres to node namespace

#### Requirements
```
kubectl => v1.28.2
Privileged container-level security
HostPID set on true 
```



### Build image

```shell
docker build . -t image_name/repo_name:tag
docker push image_name/repo_name:tag
```

### Define Your Node

```shell
kubectl get nodes 

NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   30d   v1.27.4
```

### Run exec

Enter image and node
```shell
python3 ./exec.py
```
