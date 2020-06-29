deploy-registery:
	docker-compose -f docker-registery.yml up --build -d

clean-registery:
	docker-compose -f docker-registery.yml down -v

up-registry:
	docker run -d -p 5000:5000 --restart=always --name registry registry:2

docker-build:
	docker build -t webapp .
	docker tag webapp 10.10.0.1:5000/webapp:v3

docker-push:
	docker push 10.10.0.1:5000/webapp:v3

check-registry:
	curl -X GET http://10.10.0.1:5000/v2/webapp/tags/list

docker-run:
	docker run --name webapp -it --rm 10.10.0.1:5000/webapp:v3 bash

init-minikube:
	minikube start --insecure-registry="10.10.0.1:5000"

create-dep:
	kubectl create deployment webapp --image=10.10.0.1:5000/webapp:v3 --dry-run=client -o=yaml > deployment.yaml

deploy-app:
	kubectl apply -f deployment.yaml

docker-clean:
	docker container prune -f
