#!/bin/sh
set -eu

base_url=${1%/}
response=$(curl --fail --silent --show-error \
    --connect-timeout 5 --max-time 10 \
    --retry 10 --retry-delay 2 --retry-connrefused \
    "$base_url/healthz")

if [ "$response" != "healthy" ]; then
    echo "unexpected /healthz response: $response" >&2
    exit 1
fi
