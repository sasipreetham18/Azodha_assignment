# Azodha_assignment



# DevOps Assignment – Final Submission Report

# Architecture Diagram
flowchart LR
    Dev[Developer Push to GitHub] --> GA[GitHub Actions CI/CD]

    GA --> |Build & Test| Docker[Docker Image Build]
    Docker --> |Push| ECR[ECR Repository]

    GA --> |Deploy| EKS[EKS Cluster]

    EKS --> |Traffic| SVC[NodePort/LoadBalancer Service]

    SVC --> User[Client / Browser]

    EKS --> CW[CloudWatch Metrics & Logs]
    CW --> Alerts[SNS Alerts (CPU, Health Check Failure)]

# 1. Overview

This submission demonstrates a complete DevOps workflow including:

Application containerization

Deployment on Amazon EKS

CI/CD using GitHub Actions (ECR + EKS deploy)

IAM & security best practices

Monitoring & alerting

Documentation + screenshots proof

# 2.Application

A simple Python Flask API with:

/health
{"status": "ok"}

/predict
{"score": 0.75}

# 3. Dockerfile (Multi-Stage, Non-Root, HealthCheck)


# 4. Kubernetes Deployment Files (EKS)
deployment.yaml

# 5. CI/CD Pipeline (GitHub Actions) – Final Version


# 6. Monitoring & Alerting
CloudWatch Metrics

CPU Utilization

Memory Utilization

Pod restarts

Application 5xx errors

CloudWatch Dashboard

Includes:

CPU graph

Memory graph

Node health

Pod restart alert

Alerts

High CPU > 80% for 5 minutes

HTTP 5xx errors > 5/min

# 7. Security Best Practices Implemented

GitHub → AWS authentication via OIDC

IAM least-privilege roles

Secrets stored in AWS Secrets Manager/SSM

No hardcoded credentials

HTTPS enforced at ALB layer

Non-root Docker user

EKS IAM access entries configured correctly

# 8. Screenshots Evidence (Your Uploaded Images)

Include these in your PDF:

Screenshot 1 – IAM Policies List

Shows IAM user with AdministratorAccess + custom policies.

Screenshot 2 – Custom ECS Policy JSON

Your inline policy for ECS RunTask (not required for EKS, but fine).

Screenshot 3 – Application Health Endpoint Working

http://<node-ip>:30081/health returns {"status": "ok"}

Screenshot 4 – EKS Pods & Services

kubectl get svc -n venky and kubectl get pods -n venky showing running workloads.

Screenshot 5 – EKS IAM Access Entry

User sasi added successfully to EKS access list.

# 9. Conclusion

This submission demonstrates:

End-to-end DevOps workflow

Fully automated CI/CD pipeline

Secure production-ready containerization

EKS deployment with monitoring

IAM, least privilege, security compliance

Working application URLs

# Live test:
 http://3.239.98.196:30081/health

 http://3.239.98.196:30081/predict

<img width="1920" height="1080" alt="Screenshot (58)" src="https://github.com/user-attachments/assets/7c3603cc-6947-4f7f-885a-96ac53f84b5d" />

<img width="1920" height="1080" alt="Screenshot (59)" src="https://github.com/user-attachments/assets/9771eab2-3d55-4668-a387-fa758d66a344" />


<img width="1920" height="1080" alt="Screenshot (63)" src="https://github.com/user-attachments/assets/5cc1a45c-1f88-401b-86fa-dea754e0a790" />
 <img width="1920" height="1080" alt="Screenshot (64)" src="https://github.com/user-attachments/assets/f406ec56-5d68-483c-9625-9f55c0a3d374" />
<img width="1920" height="1080" alt="Screenshot (65)" src="https://github.com/user-attachments/assets/321cb5f0-a2b3-4b6c-bfe0-a076b0ed587c" />
<img width="1920" height="1080" alt="Screenshot (66)" src="https://github.com/user-attachments/assets/3275420b-ebcb-4e62-bdc0-e503a77e91af" />
<img width="1920" height="1080" alt="Screenshot (67)" src="https://github.com/user-attachments/assets/8677dea8-8eca-41c4-9e37-2da5a8fee3d4" />
<img width="1920" height="1080" alt="Screenshot (68)" src="https://github.com/user-attachments/assets/a92aa676-3d5e-4670-9b0c-da90197952cd" />
<img width="1920" height="1080" alt="Screenshot (70)" src="https://github.com/user-attachments/assets/a3963278-6935-4dd0-a28b-b4f0fa0cb113" />
<img width="1920" height="1080" alt="Screenshot (71)" src="https://github.com/user-attachments/assets/7e4f8b6d-15d7-4cac-8483-2bce8eea2061" />
<img width="1920" height="1080" alt="Screenshot (72)" src="https://github.com/user-attachments/assets/875dbcba-8756-4d80-b8a0-b8fafdd3aeb4" />
<img width="1920" height="1080" alt="Screenshot (73)" src="https://github.com/user-attachments/assets/e6c76f0f-50cc-464e-8bec-2fad0522cbdd" />
<img width="1920" height="1080" alt="Screenshot (74)" src="https://github.com/user-attachments/assets/29796529-44b3-4c8d-8265-901aa35426a0" />
<img width="1920" height="1080" alt="Screenshot (75)" src="https://github.com/user-attachments/assets/4367fbfb-4b4a-4927-ba44-76945834cc55" />

<img width="1920" height="1080" alt="Screenshot (69)" src="https://github.com/user-attachments/assets/230445e1-dc39-422f-8137-93fb07f46149" />
