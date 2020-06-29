# How to deploy

We have a simple web app with fastapi in port 80. 
first we push it to docker-registery and config daemon.json then use minikube to deploy it.

## Daemon

find gateway:
```bash
docker network inspect bridge
```


```bash
sudo vim /etc/docker/daemon.json
```
{
    "insecure-registries": [
        "10.10.0.1:5000"
    ]
}

add this.

## Usage

```bash
make deploy-registery
```
```bash
make docker-build
```
```bash
make docker-push
```
```bash
make check-registry
```
```bash
make del-minikube
```
```bash
make init-minikube
```
```bash
make deploy-app
```
```bash
make deploy-service
```

### Refrences:

[1](https://stackoverflow.com/questions/40144138/pull-a-local-image-to-run-a-pod-in-kubernetes/40150867#40150867
)

[2](https://docs.docker.com/network/network-tutorial-standalone/)
