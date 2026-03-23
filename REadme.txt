Docker + Kubernetes + Jenkins Sample Project

Simple DevOps workflow:
Build → Push → Deploy

Project Files

app.js
Dockerfile
k8s-app.yaml
Jenkinsfile

Steps

1. Build Image
   docker build -t <username>/mynodeapp:latest .

2. Push Image
   docker login
   docker push <username>/mynodeapp:latest

3. Deploy Kubernetes
   kubectl apply -f k8s-app.yaml

4. Access App
   http://<VM-IP>:<NodePort>

Jenkins Pipeline Flow

* Clone code
* Build image
* Push to Docker Hub
* Deploy to Kubernetes

Notes

* Use your Docker Hub username
* Minimum 2GB RAM required
* Use NodePort to access app

Done ✔
