#!/bin/sh
set -eu

base_url=${1%/}
if ! response=$(curl --fail --silent \
    --connect-timeout 5 --max-time 10 \
    --retry 10 --retry-delay 2 --retry-connrefused \
    "$base_url/healthz"); then
    echo "smoke test failed: $base_url/healthz" >&2
    exit 1
fi

if [ "$response" != "healthy" ]; then
    echo "unexpected /healthz response: $response" >&2
    exit 1
fi

echo "smoke test passed: $base_url/healthz"
