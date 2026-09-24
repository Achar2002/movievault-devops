# 🎬 MovieVault — DevOps CI/CD Deployment Project

MovieVault is a Java-based movie catalog web application built and deployed using a complete DevOps CI/CD workflow.

The project demonstrates how application source code can be automatically built, packaged, containerized, pushed to a container registry, and deployed to a Kubernetes cluster running on Amazon EKS.

---

## 🚀 Project Overview

MovieVault is a simple web application developed using:

* Java 17
* JSP
* Java Servlets
* Maven
* Apache Tomcat

The application is containerized using Docker and deployed to Kubernetes on Amazon EKS.

Jenkins automates the complete CI/CD process from source-code checkout to Kubernetes deployment.

---

## 🏗️ Architecture

```text
                    Developer
                        |
                        v
                   GitHub Repository
                        |
                        v
                    Jenkins
                        |
              +---------+---------+
              |         |         |
              v         v         v
           Compile     Test     Package
              |         |         |
              +---------+---------+
                        |
                        v
                  Docker Build
                        |
                        v
                   Docker Hub
                        |
                        v
                  Amazon EKS
                        |
                        v
               Kubernetes Deployment
                        |
                        v
                Kubernetes Service
                        |
                        v
                  MovieVault App
```

---

## 🛠️ Technology Stack

| Category            | Technology            |
| ------------------- | --------------------- |
| Application         | Java 17               |
| Web                 | JSP, Java Servlet     |
| Build Tool          | Apache Maven          |
| Application Server  | Apache Tomcat 9       |
| Source Control      | Git / GitHub          |
| CI/CD               | Jenkins               |
| Containerization    | Docker                |
| Container Registry  | Docker Hub            |
| Orchestration       | Kubernetes            |
| Cloud               | Amazon Web Services   |
| Kubernetes Platform | Amazon EKS            |
| Deployment Type     | Kubernetes Deployment |
| Service Exposure    | Kubernetes NodePort   |

---

## 📁 Project Structure

```text
movievault-devops/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── movievault/
│       │           └── MovieServlet.java
│       │
│       └── webapp/
│           ├── index.jsp
│           └── WEB-INF/
│               └── web.xml
│
├── k8s/
│   ├── deployment.yaml
│   └── service.yaml
│
├── docs/
│   └── screenshots/
│
├── Dockerfile
├── Jenkinsfile
├── pom.xml
└── README.md
```

---

## 🔄 CI/CD Pipeline

The Jenkins pipeline performs the following stages:

### 1. Git Checkout

Jenkins checks out the application source code from the `main` branch of the GitHub repository.

### 2. Maven Compilation

```bash
mvn compile
```

Compiles the Java source code.

### 3. Maven Testing

```bash
mvn test
```

Runs the project's automated tests.

### 4. Maven Packaging

```bash
mvn clean package
```

Creates the deployable WAR file:

```text
target/movievault.war
```

### 5. Docker Build

Jenkins builds the Docker image:

```bash
docker build -t movievault:${BUILD_NUMBER} .
```

The Docker image uses Apache Tomcat 9 with Java 17.

### 6. Docker Hub Push

The image is tagged and pushed to Docker Hub.

```text
sanathachari/movievault:<BUILD_NUMBER>
sanathachari/movievault:latest
```

Jenkins credentials are used for Docker Hub authentication rather than storing the password directly in the pipeline.

### 7. Kubernetes Deployment

Jenkins deploys the Kubernetes manifests:

```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

The pipeline then waits for the deployment to become ready:

```bash
kubectl rollout status deployment/movievault-deployment
```

---

## 🐳 Docker Configuration

The application is packaged as a WAR file and deployed inside a Tomcat 9 / Java 17 container.

```dockerfile
FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/movievault.war /usr/local/tomcat/webapps/movievault.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
```

This allows Tomcat and the Java runtime to run inside the container without requiring Tomcat to be installed directly on the host.

---

## ☸️ Kubernetes Deployment

MovieVault is deployed to Amazon EKS using Kubernetes manifests.

### Deployment

The Kubernetes Deployment manages the MovieVault application pod and uses the Docker image stored in Docker Hub.

```text
Deployment
    |
    v
MovieVault Pod
    |
    v
Docker Hub Image
```

### Service

A Kubernetes NodePort service exposes the application outside the cluster.

```text
Internet
    |
    v
NodePort :30080
    |
    v
MovieVault Service
    |
    v
MovieVault Pod :8080
```

---

## ☁️ AWS Infrastructure

The application is deployed on:

* Amazon EKS
* EC2 worker nodes
* Kubernetes
* AWS IAM

Jenkins uses an AWS IAM role to interact with Amazon EKS.

The Jenkins server was configured with:

* AWS CLI
* kubectl
* Docker
* Maven
* Git

The Jenkins IAM role was granted the required EKS permissions, and the Jenkins role was authorized to access the EKS cluster.

---

## 🔐 CI/CD Security

Docker Hub authentication is handled using Jenkins credentials.

The Docker Hub Personal Access Token is stored in Jenkins credentials instead of being written directly into the repository.

The pipeline uses Jenkins credential binding:

```groovy
withCredentials([
    usernamePassword(
        credentialsId: 'docker-cred',
        usernameVariable: 'DOCKER_USERNAME',
        passwordVariable: 'DOCKER_PASSWORD'
    )
])
```

No Docker Hub password or token should be committed to GitHub.

---

## 📸 Project Screenshots

### GitHub Repository

![GitHub Repository](docs/screenshots/01-github-repository.png)

### MovieVault Application

![MovieVault Application](docs/screenshots/02-movievault-application.png)

### Jenkins CI/CD Pipeline

![Jenkins Pipeline](docs/screenshots/03-jenkins-pipeline-success.png)

### Jenkins Console Output

![Jenkins Console](docs/screenshots/04-jenkins-console-output.png)

### Docker Hub Image

![Docker Hub](docs/screenshots/05-dockerhub-image.png)

### Kubernetes Pods

![EKS Pods](docs/screenshots/06-eks-pods-running.png)

### Kubernetes Service

![Kubernetes Service](docs/screenshots/07-kubernetes-service.png)

### MovieVault Running on EKS

![MovieVault on EKS](docs/screenshots/08-eks-live-application.png)

---

## ▶️ Run the Application Locally

### Clone the repository

```bash
git clone https://github.com/Achar2002/movievault-devops.git
cd movievault-devops
```

### Build the application

```bash
mvn clean package
```

The WAR file will be generated at:

```text
target/movievault.war
```

### Build the Docker image

```bash
docker build -t movievault:1.0 .
```

### Run the container

```bash
docker run -d \
  --name movievault-app \
  -p 8080:8080 \
  movievault:1.0
```

Open:

```text
http://localhost:8080/movievault/
```

---

## ☸️ Kubernetes Deployment

Make sure `kubectl` is configured to access your Kubernetes cluster.

Apply the deployment:

```bash
kubectl apply -f k8s/deployment.yaml
```

Apply the service:

```bash
kubectl apply -f k8s/service.yaml
```

Check the pods:

```bash
kubectl get pods
```

Check the service:

```bash
kubectl get svc movievault-service
```

Check deployment status:

```bash
kubectl rollout status deployment/movievault-deployment
```

---

## 🧪 Troubleshooting Experience

During the implementation, several real deployment issues were encountered and resolved, including:

* Jenkins initially checking out the wrong Git branch
* Docker permission issues for the Jenkins user
* Docker image tag interpolation in Jenkins Pipeline
* Docker Hub authentication
* EKS worker-node pod capacity limitations
* AWS EC2 vCPU quota limitations
* EKS IAM permissions for Jenkins
* Kubernetes authentication for the Jenkins Linux user
* Jenkins using an incorrect Kubernetes configuration
* Kubernetes NodePort and Tomcat context-path access

These troubleshooting steps helped validate the complete CI/CD workflow rather than only demonstrating a successful deployment.

---

## 🎯 Key DevOps Concepts Demonstrated

* Git and GitHub
* Git branching
* Maven build lifecycle
* Java application packaging
* Jenkins declarative pipelines
* CI/CD automation
* Docker image creation
* Docker Hub image management
* Kubernetes Deployments
* Kubernetes Services
* Amazon EKS
* AWS IAM
* Jenkins-to-EKS integration
* Containerized application deployment
* CI/CD troubleshooting

---

## 📌 Project Outcome

MovieVault demonstrates an end-to-end DevOps workflow where application code moves through:

```text
Source Code
    ↓
GitHub
    ↓
Jenkins
    ↓
Maven Build & Test
    ↓
WAR Package
    ↓
Docker Image
    ↓
Docker Hub
    ↓
Amazon EKS
    ↓
Kubernetes
    ↓
Live Application
```

The project was built from scratch to understand the complete application development, containerization, CI/CD, and Kubernetes deployment workflow.

---

## 👨‍💻 Author

**Sanath Achari**

GitHub:
https://github.com/Achar2002

Project Repository:
https://github.com/Achar2002/movievault-devops
