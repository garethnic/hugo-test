#!/usr/bin/env bash
# exit on error
set -o errexit

HUGO_VERSION="0.170.0"

echo "Installing Hugo ${HUGO_VERSION}..."

curl -L \
  "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" \
  -o /tmp/hugo.tar.gz

tar -xzf /tmp/hugo.tar.gz -C /tmp hugo

sudo install /tmp/hugo /usr/local/bin/hugo

echo "Installed version:"
hugo version

echo "Building site..."
hugo --gc --minify
