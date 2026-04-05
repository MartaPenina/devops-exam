# DevOps Exam Part 2 - Terraform, Ansible, Kubernetes CI/CD pipelines

## Repository Structure

- `task1/` — Cloud infrastructure deployment (Terraform + DigitalOcean)
- `task2/ansible/` — Software installation (Ansible): Kubernetes, Minikube, Helm
- `task3/` — Application deployment on DOKS (Helm + Kubernetes)
- `.github/workflows/` — GitHub Actions pipeline files
- `helm-charts-hello-world/` — Helm charts

## Task 3 — Application Deployment
- **dev**: branch `develop` → namespace `dev` → port 8002 → image `:develop`
- **release**: branch `release` → namespace `release` → port 8003 → image `:1.0.0`
- Cluster: `penina-k8s` (DigitalOcean, Frankfurt)
- DockerHub: `marrrta/hello-world`
- Rollback: `helm rollback hello-world 1 -n dev`