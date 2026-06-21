#!/usr/bin/env bash
set -euo pipefail

BASE_URL="https://github.com/PINTO0309/hamer/releases/download/data"
ARCHIVE="hamer_demo_data.tar.gz"
PARTS=(
    "${ARCHIVE}.part.000"
    "${ARCHIVE}.part.001"
    "${ARCHIVE}.part.002"
    "${ARCHIVE}.part.003"
)

for part in "${PARTS[@]}"; do
    if [[ ! -f "${part}" ]]; then
        wget -O "${part}" "${BASE_URL}/${part}"
    fi
done

cat "${PARTS[@]}" > "${ARCHIVE}"
tar --warning=no-unknown-keyword --exclude=".*" -xvf "${ARCHIVE}"
