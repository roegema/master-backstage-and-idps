# Roadmap: From Installation Scripts to a GitOps Platform

The current setup is already stable and functional:

- ✅ Kind Cluster
- ✅ NGINX Ingress Controller
- ✅ Cert Manager
- ✅ ArgoCD
- ✅ PostgreSQL
- ✅ Backstage
- ✅ GitHub Authentication
- ✅ Catalog
- ✅ Software Templates
- ✅ verify-platform.sh
- ✅ setup-platform.sh

The next goal is to evolve from a collection of installation scripts into a fully GitOps-driven Internal Developer Platform.

---

# Phase 1 - PostgreSQL Managed by ArgoCD

## Current Situation

PostgreSQL is installed via:

```bash
./setup-postgresql.sh
```

using:

```bash
helm upgrade --install
```

## Target Situation

ArgoCD manages PostgreSQL.

```text
Git Repository
       │
       ▼
    ArgoCD
       │
       ▼
 PostgreSQL
```

## Benefits

- Git becomes the source of truth
- No manual Helm installation required
- Automatic reconciliation
- Drift detection
- Easy recreation of environments

## Example Structure

```text
platform-apps/
└── postgresql/
    ├── application.yaml
    └── values.yaml
```

---

# Phase 2 - Backstage Managed by ArgoCD

## Current Situation

Backstage is installed via:

```bash
./setup-backstage.sh
```

## Target Situation

ArgoCD deploys Backstage directly from Git.

```text
Git Repository
       │
       ▼
    ArgoCD
       │
       ▼
    Backstage
```

## Benefits

- Fully declarative deployment
- Easy upgrades
- Configuration stored in Git
- No manual deployments

## Example Structure

```text
platform-apps/
└── backstage/
    ├── application.yaml
    └── values-backstage.yaml
```

---

# Phase 3 - App of Apps Pattern

## Goal

Create a single root application that manages all platform components.

## Architecture

```text
ArgoCD

└── platform
     │
     ├── backstage
     ├── postgresql
     ├── python-app
     ├── ingress-nginx
     ├── cert-manager
     └── actions-runner-controller
```

## Benefits

- One entry point
- Consistent structure
- Easy onboarding
- Industry standard GitOps pattern

## Example Repository

```text
platform-apps/
│
├── root/
│   └── application.yaml
│
├── backstage/
├── postgresql/
├── python-app/
├── ingress-nginx/
├── cert-manager/
└── actions-runner-controller/
```

---

# Phase 4 - Cert Manager Managed by ArgoCD

## Current Situation

Installed via:

```bash
kubectl apply -f cert-manager.yaml
```

## Target Situation

ArgoCD deploys and upgrades Cert Manager.

## Benefits

- Version-controlled
- Automatic upgrades
- Consistent rebuilds
- Reduced scripting

## Result

```text
Git
 ↓
ArgoCD
 ↓
Cert Manager
```

---

# Phase 5 - NGINX Ingress Controller Managed by ArgoCD

## Current Situation

Installed from:

```bash
kubectl apply -f \
https://raw.githubusercontent.com/kubernetes/ingress-nginx/...
```

## Target Situation

Managed by ArgoCD using Helm.

## Benefits

- Reproducible installation
- Version control
- GitOps workflow
- Centralized management

## Result

```text
Git
 ↓
ArgoCD
 ↓
Ingress NGINX
```

---

# Phase 6 - Actions Runner Controller Managed by ArgoCD

## Current Situation

Installed via custom scripts.

## Target Situation

ArgoCD manages:

- cert-manager dependency
- ARC controller
- RunnerDeployment

## Benefits

Changes become Git commits.

Example:

```yaml
replicas: 1
```

becomes

```yaml
replicas: 3
```

Commit:

```text
Increase runner capacity
```

ArgoCD automatically synchronizes the cluster.

---

# Phase 7 - Python Application Fully GitOps

## Current Situation

Partially managed by ArgoCD.

## Target Situation

The python application becomes the reference workload for GitOps practices.

## Future Enhancements

- Multiple environments
- Development namespace
- Test namespace
- Production namespace
- Automated image updates
- Progressive delivery

## Example

```text
python-app
├── development
├── test
└── production
```

---

# Phase 8 - Platform Repository

Create a dedicated repository that contains all platform applications.

## Example

```text
platform-apps/
│
├── root
│
├── backstage
├── postgresql
├── cert-manager
├── ingress-nginx
├── actions-runner-controller
└── python-app
```

This repository becomes the source of truth for the complete platform.

---

# Phase 9 - Bootstrap Only ArgoCD

Current process:

```text
Setup Kind
Install NGINX
Install Cert Manager
Install ArgoCD
Install PostgreSQL
Install Backstage
Create Applications
```

Future process:

```text
Setup Kind
Install ArgoCD
Apply Root Application
```

ArgoCD deploys everything else.

## Desired Flow

```text
Kind Cluster
     │
     ▼
 Install ArgoCD
     │
     ▼
Apply Root Application
     │
     ▼
ArgoCD Deploys Everything
```

---

# Phase 10 - Internal Developer Platform

Final target architecture:

```text
Kind Cluster

├── ArgoCD
│
├── Backstage
│
├── PostgreSQL
│
├── Cert Manager
│
├── Ingress NGINX
│
├── Actions Runner Controller
│
└── Python Applications
```

Managed entirely through Git:

```text
Git
 │
 ▼
ArgoCD
 │
 ▼
Platform Components
```

No manual Helm installs.

No manual kubectl apply commands.

Everything is declarative and reproducible.

---

# Recommended Next Steps

1. Move PostgreSQL to ArgoCD
2. Move Backstage to ArgoCD
3. Implement App-of-Apps pattern
4. Move Cert Manager to ArgoCD
5. Move NGINX Ingress Controller to ArgoCD
6. Move Actions Runner Controller to ArgoCD
7. Create dedicated platform-apps repository
8. Make ArgoCD the single deployment mechanism

At that point the environment no longer resembles a training lab, but a real GitOps-based Platform Engineering environment.
