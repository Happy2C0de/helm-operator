#!/usr/bin/env bash

export E2E_NAMESPACE=helm-operator-e2e
export DEMO_NAMESPACE=demo
ROOT_DIR=$(git rev-parse --show-toplevel)
export ROOT_DIR
export E2E_DIR="${ROOT_DIR}/test/e2e"
export FIXTURES_DIR="${E2E_DIR}/fixtures"
GITCONFIG=$(cat "${FIXTURES_DIR}/gitconfig")
export GITCONFIG
export HELM_VERSION=${HELM_VERSION}
export GITSRV_VERSION=v1.0.0
export GITSRV_KNOWN_HOSTS="${ROOT_DIR}/cache/known_hosts_${GITSRV_VERSION}"

# Wire the test to the right cluster when tests are run in parallel
if eval [ -n '$KUBECONFIG_SLOT_'"${BATS_JOB_SLOT}" ]; then
  eval export KUBECONFIG='$KUBECONFIG_SLOT_'"${BATS_JOB_SLOT}"
fi
