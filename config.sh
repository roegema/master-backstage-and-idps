#!/usr/bin/env bash

##################################################################
# Global configuration
##################################################################

CLUSTER_NAME="backstage"

BACKSTAGE_CHART_VERSION="2.10.2"
BACKSTAGE_IMAGE_VERSION="1.42.0"

POSTGRESQL_CHART_VERSION="18.12.4"


NS_BACKSTAGE="backstage"
NS_ARGOCD="argocd"
NS_NGINX="ingress-nginx"
NS_PYTHON="python"
NS_CM="cert-manager"
NS_ARS="actions-runner-system"

BACKSTAGE_HOST="backstage.test.com"
BACKSTAGE_RELEASE="backstage"
POSTGRES_RELEASE="backstage-postgresql"

POSTGRES_SECRET="backstage-db"
GITHUB_SECRET="backstage-github"
GITHUB_AUTH_SECRET="backstage-github-auth"
