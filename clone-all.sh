#!/usr/bin/env bash
# Clones every DMP repository into the target directory (default: current directory).
set -euo pipefail

OWNER="https://github.com/denis-susha"
REPOS=(
    dmp.docker
    dmp.api.web
    dmp.api.notifications
    dmp.job.server
    dmp.job.invoiceworker
    dmp.job.trxworker
    dmp.client
    dmp.seller
)

target="${1:-.}"
mkdir -p "$target"
cd "$target"

for repo in "${REPOS[@]}"; do
    if [[ -d "$repo/.git" ]]; then
        echo "skip  $repo (already cloned)"
    else
        git clone "$OWNER/$repo.git"
    fi
done
