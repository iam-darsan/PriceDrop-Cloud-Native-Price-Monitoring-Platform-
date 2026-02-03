# PriceDrop - Cloud-Native Price Monitoring Platform

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![React](https://img.shields.io/badge/React-61DAFB?style=for-the-badge&logo=react&logoColor=black)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Redis](https://img.shields.io/badge/Redis-DC382D?style=for-the-badge&logo=redis&logoColor=white)
![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [API Documentation](#api-documentation)
- [CI/CD Pipeline](#cicd-pipeline)
- [Monitoring](#monitoring)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

**PriceDrop** is a cloud-native price monitoring platform that enables users to track product prices across e-commerce websites, set custom price alerts, and receive notifications when prices drop. Built with a modern microservices architecture and deployed on AWS EKS, PriceDrop leverages automated web scraping, real-time notifications, and comprehensive price analytics.

### Key Capabilities

✅ **Automated Price Tracking**: Scheduled price monitoring with Celery  
✅ **Custom Price Alerts**: User-defined thresholds with email notifications  
✅ **Price History & Analytics**: Historical price data visualization  
✅ **Google OAuth Integration**: Secure authentication  
✅ **RESTful API**: FastAPI backend with comprehensive endpoints  
✅ **Cloud-Native Deployment**: Kubernetes orchestration on AWS EKS  
✅ **Infrastructure as Code**: Terraform automation for AWS resources  
✅ **CI/CD Pipeline**: Jenkins-based automated deployment  

## ✨ Features

### Core Features

- **Product Management**
  - Add products via URL
  - Track multiple products simultaneously
  - View current and historical prices
  - Product metadata extraction

- **Price Alerts**
  - Set target price thresholds
  - Percentage-based alerts
  - Email notifications via SendGrid/SMTP
  - Alert management (create, update, delete)

- **Price History**
  - Historical price tracking
  - Interactive price charts
  - Trend visualization
  - Data export capabilities

- **Authentication & Authorization**
  - Google OAuth 2.0 integration
  - JWT-based authentication
  - Protected API endpoints
  - User session management

- **Background Task Processing**
  - Celery worker for async tasks
  - Celery beat for scheduled scraping
  - Redis-backed task queue
  - Automatic price checking

## 🏗️ Architecture

### High-Level Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                         AWS Cloud                               │
│                                                                 │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                    Amazon S3                               │ │
│  │              (Frontend Static Hosting)                     │ │
│  └────────────────────────────────────────────────────────────┘ │
│                              │                                  │
│                              ▼                                  │
│  ┌────────────────────────────────────────────────────────────┐ │
│  │                      AWS EKS Cluster                       │ │
│  │                                                            │ │
│  │  ┌──────────────┐     ┌──────────────┐                     │ │
│  │  │   Ingress    │────▶│   Backend    │                    │ │
│  │  │ (NGINX/ALB)  │     │   (FastAPI)  │                     │ │
│  │  └──────────────┘     └──────┬───────┘                     │ │
│  │                              │                             │ │
│  │  ┌──────────────┐     ┌──────▼───────┐                     │ │
│  │  │Celery Worker │     │ Celery Beat  │                     │ │
│  │  │(Price Check) │     │ (Scheduler)  │                     │ │
│  │  └──────┬───────┘     └──────────────┘                     │ │
│  │         │                                                  │ │
│  └─────────┼──────────────────────────────────────────────────│ │
│            │                                                    │
│  ┌─────────▼──────────────────────────────────────────────────┐ │
│  │                    ElastiCache Redis                       │ │
│  │              (Task Queue & Caching)                        │ │
│  └────────────────────────────────────────────────────────────┘ │
│                                                                 │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                         RDS MySQL                           ││
│  │         (Users, Products, Alerts, Price History)            ││
│  └─────────────────────────────────────────────────────────────┘│
│                                                                 │
│  ┌─────────────────────────────────────────────────────────────┐│
│  │                     Amazon ECR                              ││
│  │              (Container Image Registry)                     ││
│  └─────────────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────────────┘
```

### Component Interaction Flow

```
User Browser
    │
    ├─► S3 (Frontend - React/TypeScript)
    │
    └─► API Gateway/Ingress
            │
            ▼
        FastAPI Backend
            │
            ├─► PostgreSQL RDS (Read/Write Data)
            │
            ├─► Redis ElastiCache (Session/Cache)
            │
            └─► Celery Task Queue
                    │
                    ├─► Celery Worker (Price Scraping)
                    │       │
                    │       └─► External E-commerce Sites
                    │
                    └─► Celery Beat (Scheduled Tasks)
                            │
                            └─► Email Service (SendGrid/SMTP)
```

## 🛠️ Technology Stack

### Backend

| Component | Technology | Purpose |
|-----------|-----------|---------|
| API Framework | FastAPI | High-performance Python web framework |
| Database ORM | SQLAlchemy | SQL toolkit and ORM |
| Migration Tool | Alembic | Database migration management |
| Task Queue | Celery | Distributed task processing |
| Message Broker | Redis | Task queue and caching |
| Authentication | JWT + OAuth2 | Token-based auth with Google OAuth |
| Email Service | SendGrid/SMTP | Notification delivery |
| Web Scraping | BeautifulSoup/Requests | Product price extraction |

### Frontend

| Component | Technology | Purpose |
|-----------|-----------|---------|
| Framework | React 18 | UI framework |
| Language | TypeScript | Type-safe JavaScript |
| Build Tool | Vite | Fast build and dev server |
| Styling | Tailwind CSS | Utility-first CSS framework |
| State Management | React Context API | Global state management |
| HTTP Client | Axios | API communication |
| Charts | Chart.js/Recharts | Price history visualization |
| Routing | React Router | Client-side routing |

### Infrastructure & DevOps

| Component | Technology | Purpose |
|-----------|-----------|---------|
| Container Orchestration | Kubernetes (EKS) | Container management |
| Cloud Provider | AWS | Infrastructure hosting |
| IaC Tool | Terraform | Infrastructure provisioning |
| CI/CD | Jenkins | Automated deployment pipeline |
| Container Registry | Amazon ECR | Docker image storage |
| Container Runtime | Docker | Application containerization |
| Database | PostgreSQL (RDS) | Relational database |
| Cache | Redis (ElastiCache) | In-memory data store |
| Object Storage | Amazon S3 | Frontend static hosting |

## 📁 Project Structure

```
PriceDrop-Cloud-Native-Price-Monitoring-Platform/
│
├── backend/                          # Python FastAPI Backend
│   ├── alembic/                      # Database migrations
│   │   ├── env.py
│   │   ├── script.py.mako
│   │   └── versions/
│   │       └── 30ffb2b5af86_initial_migration.py
│   │
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py                   # FastAPI application entry point
│   │   ├── config.py                 # Configuration settings
│   │   ├── database.py               # Database connection
│   │   │
│   │   ├── middleware/               # Custom middleware
│   │   │   └── auth_middleware.py    # JWT authentication middleware
│   │   │
│   │   ├── models/                   # SQLAlchemy models
│   │   │   ├── user.py               # User model
│   │   │   ├── product.py            # Product model
│   │   │   ├── price_history.py      # Price history model
│   │   │   └── price_alert.py        # Price alert model
│   │   │
│   │   ├── routes/                   # API endpoints
│   │   │   ├── auth.py               # Authentication routes
│   │   │   ├── products.py           # Product management routes
│   │   │   ├── alerts.py             # Alert management routes
│   │   │   └── history.py            # Price history routes
│   │   │
│   │   ├── schemas/                  # Pydantic schemas
│   │   │   ├── user.py               # User schemas
│   │   │   ├── product.py            # Product schemas
│   │   │   └── alert.py              # Alert schemas
│   │   │
│   │   ├── services/                 # Business logic
│   │   │   ├── auth_service.py       # Authentication logic
│   │   │   ├── scraper_service.py    # Web scraping logic
│   │   │   └── email_service.py      # Email notification logic
│   │   │
│   │   └── tasks/                    # Celery tasks
│   │       ├── celery_app.py         # Celery configuration
│   │       └── price_checker.py      # Scheduled price checking
│   │
│   ├── alembic.ini                   # Alembic configuration
│   ├── Dockerfile                    # Docker image definition
│   ├── Jenkinsfile                   # CI/CD pipeline
│   ├── requirements.txt              # Python dependencies
│   └── env.example                   # Environment variables template
│
├── frontend/                         # React TypeScript Frontend
│   ├── src/
│   │   ├── components/
│   │   │   ├── alerts/               # Alert components
│   │   │   │   ├── AlertForm.tsx
│   │   │   │   └── AlertList.tsx
│   │   │   │
│   │   │   ├── auth/                 # Authentication components
│   │   │   │   ├── GoogleLoginButton.tsx
│   │   │   │   └── ProtectedRoute.tsx
│   │   │   │
│   │   │   ├── charts/               # Chart components
│   │   │   │   └── PriceHistoryChart.tsx
│   │   │   │
│   │   │   ├── layout/               # Layout components
│   │   │   │   ├── Header.tsx
│   │   │   │   └── Layout.tsx
│   │   │   │
│   │   │   └── products/             # Product components
│   │   │       ├── AddProductModal.tsx
│   │   │       ├── ProductCard.tsx
│   │   │       └── ProductList.tsx
│   │   │
│   │   ├── context/
│   │   │   └── AuthContext.tsx       # Authentication context
│   │   │
│   │   ├── pages/
│   │   │   ├── Login.tsx             # Login page
│   │   │   ├── Dashboard.tsx         # Dashboard page
│   │   │   ├── ProductDetails.tsx    # Product details page
│   │   │   └── Callback.tsx          # OAuth callback page
│   │   │
│   │   ├── services/
│   │   │   ├── api.ts                # API client configuration
│   │   │   ├── auth.ts               # Authentication service
│   │   │   └── products.ts           # Product API service
│   │   │
│   │   ├── types/
│   │   │   └── index.ts              # TypeScript type definitions
│   │   │
│   │   ├── utils/
│   │   │   └── formatters.ts         # Utility functions
│   │   │
│   │   ├── App.tsx                   # Main application component
│   │   ├── main.tsx                  # Application entry point
│   │   └── index.css                 # Global styles
│   │
│   ├── index.html
│   ├── package.json                  # Node dependencies
│   ├── tsconfig.json                 # TypeScript configuration
│   ├── vite.config.ts                # Vite configuration
│   ├── tailwind.config.js            # Tailwind CSS configuration
│   ├── postcss.config.js             # PostCSS configuration
│   └── Jenkinsfile                   # CI/CD pipeline
│
├── k8s/                              # Kubernetes Manifests
│   ├── backend/
│   │   ├── backend-deployment.yaml   # FastAPI deployment
│   │   ├── celery-worker-deployment.yaml  # Celery worker deployment
│   │   ├── celery-beat-deployment.yaml    # Celery beat deployment
│   │   └── service.yaml              # Backend service
│   │
│   ├── ingress/
│   │   └── api-ingress.yaml          # Ingress configuration
│   │
│   └── secrets/
│       └── backend-secrets.yaml      # Kubernetes secrets (template)
│
└── terraform/                        # Infrastructure as Code
    ├── terraform-infra-ecr/          # ECR repository setup
    │   ├── main.tf
    │   ├── provider.tf
    │   └── variable.tf
    │
    ├── terraform-infra-eks/          # EKS cluster setup
    │   ├── eks.tf
    │   ├── vpc.tf
    │   ├── redis.tf
    │   ├── provider.tf
    │   └── variable.tf
    │
    ├── terraform-infra-rds/          # RDS PostgreSQL setup
    │   ├── main.tf
    │   ├── provider.tf
    │   └── variable.tf
    │
    └── terraform-infra-s3/           # S3 frontend hosting
        ├── frontend_s3.tf
        ├── output.tf
        ├── provider.tf
        └── variable.tf
```

## 📦 Prerequisites

### Required Tools

- **Docker** (v20.10+)
- **Docker Compose** (v2.0+)
- **Python** (v3.9+)
- **Node.js** (v18+)
- **AWS CLI** (v2.x)
- **kubectl** (v1.27+)
- **Terraform** (v1.0+)
- **Git**

### AWS Account Requirements

- AWS Account with appropriate IAM permissions
- AWS Access Key and Secret Access Key configured
- Sufficient quota for:
  - EKS cluster
  - RDS PostgreSQL instance
  - ElastiCache Redis cluster
  - S3 bucket
  - ECR repositories

### Third-Party Services

- **Google OAuth 2.0**: Client ID and Secret
- **SendGrid** (optional): API key for email notifications
- **SMTP Server** (alternative to SendGrid)

## 🚀 Installation & Setup

### Local Development Setup

#### Step 1: Clone the Repository

```bash
git clone https://github.com/iam-darsan/PriceDrop-Cloud-Native-Price-Monitoring-Platform.git
cd PriceDrop-Cloud-Native-Price-Monitoring-Platform
```

#### Step 2: Backend Setup

##### 2.1 Create Virtual Environment

```bash
cd backend
python -m venv venv

# Activate virtual environment
# On Linux/Mac:
source venv/bin/activate
# On Windows:
venv\Scripts\activate
```

##### 2.2 Install Dependencies

```bash
pip install -r requirements.txt
```

##### 2.3 Configure Environment Variables

```bash
cp env.example .env
```

Edit `.env` file with your configuration:

```bash
# Database Configuration
DATABASE_URL=postgresql://user:password@localhost:5432/pricedrop

# Redis Configuration
REDIS_URL=redis://localhost:6379/0

# JWT Configuration
SECRET_KEY=your-super-secret-key-here
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=30

# Google OAuth
GOOGLE_CLIENT_ID=your-google-client-id
GOOGLE_CLIENT_SECRET=your-google-client-secret
GOOGLE_REDIRECT_URI=http://localhost:3000/callback

# Email Configuration (SendGrid)
SENDGRID_API_KEY=your-sendgrid-api-key
FROM_EMAIL=noreply@pricedrop.com

# OR SMTP Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASSWORD=your-app-password

# Frontend URL
FRONTEND_URL=http://localhost:3000

# Environment
ENVIRONMENT=development
```

##### 2.4 Set Up Database

```bash
# Start PostgreSQL (using Docker)
docker run -d \
  --name pricedrop-postgres \
  -e POSTGRES_USER=pricedrop \
  -e POSTGRES_PASSWORD=password \
  -e POSTGRES_DB=pricedrop \
  -p 5432:5432 \
  postgres:15

# Start Redis
docker run -d \
  --name pricedrop-redis \
  -p 6379:6379 \
  redis:7-alpine

# Run database migrations
alembic upgrade head
```

##### 2.5 Run Backend Server

```bash
# Development server with auto-reload
uvicorn app.main:app --reload --host 0.0.0.0 --port 8000
```

##### 2.6 Run Celery Worker & Beat

```bash
# In a new terminal - Celery Worker
celery -A app.tasks.celery_app worker --loglevel=info

# In another terminal - Celery Beat (Scheduler)
celery -A app.tasks.celery_app beat --loglevel=info
```

#### Step 3: Frontend Setup

##### 3.1 Install Dependencies

```bash
cd ../frontend
npm install
```

##### 3.2 Configure Environment Variables

Create `.env` file:

```bash
VITE_API_URL=http://localhost:8000
VITE_GOOGLE_CLIENT_ID=your-google-client-id
```

##### 3.3 Run Development Server

```bash
npm run dev
```

The frontend will be available at `http://localhost:3000`

#### Step 4: Access the Application

- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:8000
- **API Documentation**: http://localhost:8000/docs
- **Alternative API Docs**: http://localhost:8000/redoc

### Docker Compose Setup (Recommended for Local Development)

#### Create docker-compose.yml

```yaml
version: '3.8'

services:
  postgres:
    image: postgres:15
    environment:
      POSTGRES_USER: pricedrop
      POSTGRES_PASSWORD: password
      POSTGRES_DB: pricedrop
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"

  backend:
    build: ./backend
    ports:
      - "8000:8000"
    environment:
      DATABASE_URL: postgresql://pricedrop:password@postgres:5432/pricedrop
      REDIS_URL: redis://redis:6379/0
    depends_on:
      - postgres
      - redis
    command: uvicorn app.main:app --host 0.0.0.0 --port 8000

  celery-worker:
    build: ./backend
    environment:
      DATABASE_URL: postgresql://pricedrop:password@postgres:5432/pricedrop
      REDIS_URL: redis://redis:6379/0
    depends_on:
      - postgres
      - redis
    command: celery -A app.tasks.celery_app worker --loglevel=info

  celery-beat:
    build: ./backend
    environment:
      DATABASE_URL: postgresql://pricedrop:password@postgres:5432/pricedrop
      REDIS_URL: redis://redis:6379/0
    depends_on:
      - postgres
      - redis
    command: celery -A app.tasks.celery_app beat --loglevel=info

  frontend:
    build: ./frontend
    ports:
      - "3000:80"
    depends_on:
      - backend

volumes:
  postgres_data:
```

#### Run with Docker Compose

```bash
# Build and start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop all services
docker-compose down
```

## ⚙️ Configuration

### Backend Configuration (app/config.py)

The backend uses environment variables for configuration. Key settings include:

- **Database Settings**: PostgreSQL connection string
- **Redis Settings**: Redis connection URL
- **JWT Settings**: Secret key, algorithm, expiration time
- **OAuth Settings**: Google OAuth credentials
- **Email Settings**: SMTP or SendGrid configuration
- **Celery Settings**: Task queue configuration
- **CORS Settings**: Allowed origins for frontend

### Frontend Configuration

The frontend uses Vite environment variables (`.env`):

- **VITE_API_URL**: Backend API base URL
- **VITE_GOOGLE_CLIENT_ID**: Google OAuth client ID

### Celery Configuration

Celery tasks are configured in `app/tasks/celery_app.py`:

- **Broker**: Redis URL
- **Backend**: Redis URL (for result storage)
- **Task Serializer**: JSON
- **Result Serializer**: JSON
- **Timezone**: UTC
- **Beat Schedule**: Periodic task configuration

## 🚢 Deployment

### Phase 1: AWS Infrastructure Setup with Terraform

#### 1.1 Create ECR Repositories

```bash
cd terraform/terraform-infra-ecr

# Initialize Terraform
terraform init

# Create ECR repositories for backend and frontend
terraform plan
terraform apply -auto-approve
```

This creates:
- `pricedrop-backend` ECR repository
- `pricedrop-frontend` ECR repository (if needed)

#### 1.2 Create VPC and EKS Cluster

```bash
cd ../terraform-infra-eks

# Review and update variable.tf with your settings
# Then apply
terraform init
terraform plan
terraform apply -auto-approve
```

This creates:
- VPC with public and private subnets
- EKS cluster with managed node groups
- Redis ElastiCache cluster
- Security groups and IAM roles

#### 1.3 Create RDS PostgreSQL Database

```bash
cd ../terraform-infra-rds

terraform init
terraform plan
terraform apply -auto-approve
```

This creates:
- RDS PostgreSQL instance
- Database subnet group
- Security group for database access

#### 1.4 Create S3 Bucket for Frontend

```bash
cd ../terraform-infra-s3

terraform init
terraform plan
terraform apply -auto-approve
```

This creates:
- S3 bucket for static website hosting
- Bucket policy for public read access
- CloudFront distribution (optional)

### Phase 2: Configure kubectl

```bash
# Update kubeconfig for EKS cluster
aws eks update-kubeconfig --region <your-region> --name <cluster-name>

# Verify connection
kubectl get nodes
kubectl get namespaces
```

### Phase 3: Build and Push Docker Images

#### 3.1 Authenticate with ECR

```bash
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com
```

#### 3.2 Build and Push Backend Image

```bash
cd backend

# Build image
docker build -t pricedrop-backend .

# Tag image
docker tag pricedrop-backend:latest <account-id>.dkr.ecr.<region>.amazonaws.com/pricedrop-backend:latest

# Push to ECR
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/pricedrop-backend:latest
```

#### 3.3 Build and Deploy Frontend to S3

```bash
cd frontend

# Install dependencies
npm install

# Build for production
npm run build

# Upload to S3
aws s3 sync dist/ s3://<your-frontend-bucket>/ --delete
```

### Phase 4: Create Kubernetes Secrets

```bash
# Create namespace
kubectl create namespace pricedrop

# Create secrets from environment variables
kubectl create secret generic backend-secrets \
  --from-literal=DATABASE_URL='postgresql://user:pass@rds-endpoint:5432/pricedrop' \
  --from-literal=REDIS_URL='redis://elasticache-endpoint:6379/0' \
  --from-literal=SECRET_KEY='your-secret-key' \
  --from-literal=GOOGLE_CLIENT_ID='your-google-client-id' \
  --from-literal=GOOGLE_CLIENT_SECRET='your-google-client-secret' \
  --from-literal=SENDGRID_API_KEY='your-sendgrid-key' \
  -n pricedrop
```

Or use the template:

```bash
# Edit k8s/secrets/backend-secrets.yaml with your values
kubectl apply -f k8s/secrets/backend-secrets.yaml
```

### Phase 5: Deploy to Kubernetes

#### 5.1 Update Deployment YAMLs

Edit the image references in deployment files to point to your ECR images:

```yaml
# k8s/backend/backend-deployment.yaml
spec:
  containers:
  - name: backend
    image: <account-id>.dkr.ecr.<region>.amazonaws.com/pricedrop-backend:latest
```

#### 5.2 Deploy Backend Services

```bash
# Deploy backend
kubectl apply -f k8s/backend/backend-deployment.yaml
kubectl apply -f k8s/backend/service.yaml

# Deploy Celery worker
kubectl apply -f k8s/backend/celery-worker-deployment.yaml

# Deploy Celery beat
kubectl apply -f k8s/backend/celery-beat-deployment.yaml
```

#### 5.3 Deploy Ingress

```bash
# Install NGINX Ingress Controller (if not already installed)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.2/deploy/static/provider/aws/deploy.yaml

# Deploy API Ingress
kubectl apply -f k8s/ingress/api-ingress.yaml
```

#### 5.4 Verify Deployment

```bash
# Check all pods are running
kubectl get pods -n pricedrop

# Check services
kubectl get svc -n pricedrop

# Check ingress
kubectl get ingress -n pricedrop

# Get ingress external IP/hostname
kubectl get ingress api-ingress -n pricedrop -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```

### Phase 6: Run Database Migrations

```bash
# Exec into backend pod
kubectl exec -it <backend-pod-name> -n pricedrop -- /bin/bash

# Run migrations
alembic upgrade head
```

### Phase 7: Configure DNS

Point your domain to the Load Balancer created by the Ingress:

```bash
# Get Load Balancer hostname
kubectl get ingress api-ingress -n pricedrop

# Create DNS records:
# api.yourdomain.com -> <load-balancer-hostname>
```

## 📚 API Documentation

### API Base URL

```
Development: http://localhost:8000
Production: https://api.yourdomain.com
```

### Interactive API Docs

- **Swagger UI**: `http://localhost:8000/docs`
- **ReDoc**: `http://localhost:8000/redoc`

### Authentication Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/auth/register` | Register new user | No |
| POST | `/auth/login` | User login | No |
| POST | `/auth/google` | Google OAuth login | No |
| GET | `/auth/me` | Get current user | Yes |

### Product Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/products` | Add product to track | Yes |
| GET | `/products` | Get all tracked products | Yes |
| GET | `/products/{id}` | Get product details | Yes |
| PUT | `/products/{id}` | Update product | Yes |
| DELETE | `/products/{id}` | Delete product | Yes |

### Alert Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/alerts` | Create price alert | Yes |
| GET | `/alerts` | Get all alerts | Yes |
| GET | `/alerts/{id}` | Get alert details | Yes |
| PUT | `/alerts/{id}` | Update alert | Yes |
| DELETE | `/alerts/{id}` | Delete alert | Yes |

### Price History Endpoints

| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/history/{product_id}` | Get price history for product | Yes |

### Example API Requests

#### Register User

```bash
curl -X POST "http://localhost:8000/auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!",
    "full_name": "John Doe"
  }'
```

#### Login

```bash
curl -X POST "http://localhost:8000/auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!"
  }'
```

#### Add Product

```bash
curl -X POST "http://localhost:8000/products" \
  -H "Authorization: Bearer <your-jwt-token>" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://www.amazon.com/dp/B08N5WRWNW",
    "name": "Product Name",
    "target_price": 299.99
  }'
```

#### Create Alert

```bash
curl -X POST "http://localhost:8000/alerts" \
  -H "Authorization: Bearer <your-jwt-token>" \
  -H "Content-Type: application/json" \
  -d '{
    "product_id": 1,
    "target_price": 299.99,
    "alert_type": "below"
  }'
```

#### Get Price History

```bash
curl -X GET "http://localhost:8000/history/1" \
  -H "Authorization: Bearer <your-jwt-token>"
```

## 🔄 CI/CD Pipeline

### Jenkins Pipeline Overview

The project includes Jenkins pipelines for both backend and frontend:

#### Backend Pipeline (`backend/Jenkinsfile`)

Typical stages:
1. **Checkout**: Clone repository
2. **Build**: Build Docker image
3. **Test**: Run unit tests
4. **Security Scan**: Scan for vulnerabilities
5. **Push to ECR**: Push image to Amazon ECR
6. **Deploy to EKS**: Update Kubernetes deployment

#### Frontend Pipeline (`frontend/Jenkinsfile`)

Typical stages:
1. **Checkout**: Clone repository
2. **Install Dependencies**: npm install
3. **Build**: npm run build
4. **Test**: Run tests
5. **Deploy to S3**: Upload to S3 bucket
6. **Invalidate CloudFront**: Clear CDN cache

### Setting Up Jenkins

#### 1. Install Jenkins

```bash
# On AWS EC2 or local machine
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update
sudo apt install jenkins
```

#### 2. Install Required Plugins

- Docker Pipeline
- Kubernetes CLI
- AWS Steps
- Pipeline AWS Steps

#### 3. Configure Credentials

In Jenkins, add:
- **AWS Credentials**: Access Key ID and Secret Access Key
- **GitHub Credentials**: Personal Access Token
- **Docker Hub/ECR Credentials**: If needed

#### 4. Create Pipeline Jobs

1. New Item → Pipeline
2. Pipeline script from SCM
3. Repository URL: Your GitHub repo
4. Script Path: `backend/Jenkinsfile` or `frontend/Jenkinsfile`

### Automated Deployment Workflow

```
Developer Push to GitHub
    ↓
Jenkins Webhook Trigger
    ↓
Build Docker Image
    ↓
Run Tests
    ↓
Security Scanning
    ↓
Push to ECR
    ↓
Update K8s Deployment
    ↓
Rolling Update on EKS
    ↓
Health Check
    ↓
Deployment Complete
```

## 📊 Monitoring

### Application Monitoring

#### Health Checks

The backend includes health check endpoints:

```bash
# Health check
curl http://localhost:8000/health

# Detailed health check
curl http://localhost:8000/health/detailed
```

#### Logging

Application logs are available:

```bash
# Backend logs
kubectl logs -f deployment/backend -n pricedrop

# Celery worker logs
kubectl logs -f deployment/celery-worker -n pricedrop

# Celery beat logs
kubectl logs -f deployment/celery-beat -n pricedrop
```

### Infrastructure Monitoring (Recommended)

#### Install Prometheus & Grafana

```bash
# Add Helm repository
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Install kube-prometheus-stack
helm install prometheus prometheus-community/kube-prometheus-stack \
  --namespace monitoring \
  --create-namespace
```

#### Access Grafana

```bash
# Port forward Grafana
kubectl port-forward -n monitoring svc/prometheus-grafana 3000:80

# Default credentials: admin/prom-operator
```

### Key Metrics to Monitor

- **API Response Time**: Average response time for API endpoints
- **Error Rate**: 4xx and 5xx error percentages
- **Request Rate**: Requests per second
- **Database Connections**: Active connections to PostgreSQL
- **Redis Cache Hit Rate**: Cache effectiveness
- **Celery Task Queue Length**: Number of pending tasks
- **Celery Task Success/Failure Rate**: Task execution health
- **Pod CPU/Memory Usage**: Resource utilization
- **Pod Restart Count**: Application stability

## 🐛 Troubleshooting

### Common Issues

#### 1. Backend Not Starting

**Problem**: Backend pod crash looping

**Solutions**:

```bash
# Check logs
kubectl logs <backend-pod-name> -n pricedrop

# Common issues:
# - Database connection failed: Verify DATABASE_URL in secrets
# - Redis connection failed: Verify REDIS_URL
# - Missing environment variables: Check secrets are created

# Verify secrets
kubectl get secrets -n pricedrop
kubectl describe secret backend-secrets -n pricedrop
```

#### 2. Database Migration Errors

**Problem**: Alembic migration fails

**Solutions**:

```bash
# Check current migration version
alembic current

# View migration history
alembic history

# Downgrade if needed
alembic downgrade -1

# Upgrade to latest
alembic upgrade head

# If migrations are out of sync
alembic stamp head
```

#### 3. Celery Tasks Not Running

**Problem**: Price checks not executing

**Solutions**:

```bash
# Check Celery worker logs
kubectl logs deployment/celery-worker -n pricedrop

# Check Celery beat logs
kubectl logs deployment/celery-beat -n pricedrop

# Verify Redis connection
kubectl exec -it deployment/celery-worker -n pricedrop -- python -c "from app.config import settings; print(settings.REDIS_URL)"

# Test Redis connection
kubectl exec -it <redis-pod> -- redis-cli ping
```

#### 4. Google OAuth Not Working

**Problem**: Google login fails

**Solutions**:

```bash
# Verify Google OAuth credentials
# Check GOOGLE_CLIENT_ID and GOOGLE_CLIENT_SECRET in backend secrets

# Verify redirect URI in Google Console matches:
# http://localhost:3000/callback (development)
# https://yourdomain.com/callback (production)

# Check frontend environment variable
# VITE_GOOGLE_CLIENT_ID should match backend
```

#### 5. Email Notifications Not Sending

**Problem**: Price alerts not received via email

**Solutions**:

```bash
# Check email service configuration
# For SendGrid: Verify SENDGRID_API_KEY
# For SMTP: Verify SMTP_HOST, SMTP_PORT, SMTP_USER, SMTP_PASSWORD

# Test email service manually
kubectl exec -it deployment/backend -n pricedrop -- python -c "from app.services.email_service import send_email; send_email('test@example.com', 'Test', 'Test message')"

# Check Celery logs for email task failures
kubectl logs deployment/celery-worker -n pricedrop | grep email
```

#### 6. Ingress Not Working

**Problem**: Cannot access API via ingress

**Solutions**:

```bash
# Check ingress status
kubectl get ingress -n pricedrop
kubectl describe ingress api-ingress -n pricedrop

# Verify NGINX ingress controller is running
kubectl get pods -n ingress-nginx

# Check backend service
kubectl get svc backend -n pricedrop

# Test backend service directly
kubectl port-forward svc/backend 8000:8000 -n pricedrop
curl http://localhost:8000/health
```

### Debug Commands

```bash
# Get all resources
kubectl get all -n pricedrop

# Describe pod for events
kubectl describe pod <pod-name> -n pricedrop

# Execute shell in pod
kubectl exec -it <pod-name> -n pricedrop -- /bin/bash

# View pod logs with timestamps
kubectl logs <pod-name> -n pricedrop --timestamps

# Follow logs in real-time
kubectl logs -f <pod-name> -n pricedrop

# Check resource usage
kubectl top pods -n pricedrop
kubectl top nodes
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

### How to Contribute

1. **Fork the repository**

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR_USERNAME/PriceDrop-Cloud-Native-Price-Monitoring-Platform.git
   cd PriceDrop-Cloud-Native-Price-Monitoring-Platform
   ```

3. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make your changes**
   - Write clean, well-documented code
   - Follow existing code style
   - Add tests for new features
   - Update documentation

5. **Test your changes**
   ```bash
   # Backend tests
   cd backend
   pytest

   # Frontend tests
   cd frontend
   npm test
   ```

6. **Commit your changes**
   ```bash
   git add .
   git commit -m "feat: add your feature description"
   ```

7. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```

8. **Create a Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your fork and branch
   - Describe your changes
   - Submit the PR

### Commit Message Convention

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, etc.)
- `refactor:` Code refactoring
- `test:` Adding or updating tests
- `chore:` Maintenance tasks




**Built with ❤️ by [iam-darsan](https://github.com/iam-darsan)**

**⭐ If you find this project helpful, please give it a star!**
