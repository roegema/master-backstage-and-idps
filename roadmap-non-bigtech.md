# Long-Term Non-Big-Tech Direction

The current focus remains:

1. PostgreSQL via ArgoCD
2. Backstage via ArgoCD
3. App-of-Apps pattern
4. Cert Manager via ArgoCD
5. Ingress-NGINX via ArgoCD
6. Actions Runner Controller via ArgoCD

Only after the GitOps migration is complete, start replacing Big Tech dependencies.

---

# Current Stack

```text
GitHub
│
├── Source Repositories
├── GitHub OAuth
├── GitHub Actions
└── GitHub Container Registry / Docker Hub

        │
        ▼

     Backstage

        │
        ▼

      ArgoCD

        │
        ▼

    Kubernetes
```

---

# Target Non-Big-Tech Stack

```text
Framagit
│
├── Git Repositories
├── GitLab CI/CD
├── OAuth
└── Container Registry

        │
        ▼

     Backstage

        │
        ▼

      ArgoCD

        │
        ▼

    Kubernetes
```

---

# Migration Path

## Step 1

Keep GitHub.

Focus on GitOps.

Move:

- PostgreSQL
- Backstage
- Ingress
- Cert Manager
- Actions Runner Controller

to ArgoCD.

---

## Step 2

Migrate source repositories:

```text
GitHub
   ↓
Framagit
```

Move:

- backstage-app
- python-app
- platform-apps
- templates

---

## Step 3

Replace GitHub OAuth with GitLab OAuth.

Current:

```text
GitHub Login
```

Future:

```text
Framagit / GitLab Login
```

---

## Step 4

Replace GitHub integrations in Backstage.

Current:

```yaml
integrations:
  github:
```

Future:

```yaml
integrations:
  gitlab:
```

---

## Step 5

Replace GitHub Actions.

Current:

```text
GitHub Actions
```

Future:

```text
GitLab CI/CD
```

---

## Step 6

Replace Docker Hub.

Current:

```text
docker.io/roegema/backstage
```

Future:

```text
Framagit Container Registry
```

Benefits:

- Source code and images on one platform
- Less dependency on Docker Hub
- Simpler authentication
- Better GitOps workflow

---

# Possible End State

```text
Framagit
│
├── Git Repositories
├── GitLab CI/CD
├── OAuth
└── Container Registry

ArgoCD
│
└── GitOps

Backstage
│
└── Internal Developer Platform

Kubernetes
│
├── PostgreSQL
├── Applications
├── GitLab Runner
└── Monitoring
```

---

# Personal Recommendation

Do not start migrating to Framagit yet.

First complete the ArgoCD migration.

A good order is:

```text
✅ PostgreSQL → ArgoCD
✅ Backstage → ArgoCD
✅ App-of-Apps
✅ Cert Manager → ArgoCD
✅ NGINX → ArgoCD
✅ ARC → ArgoCD

THEN

➡ GitHub → Framagit
➡ Docker Hub → Framagit Registry
➡ GitHub OAuth → GitLab OAuth
➡ GitHub Actions → GitLab CI/CD
```

This keeps each change small, easy to test, and maximizes learning around GitOps and Platform Engineering before changing source control and CI/CD platforms.
