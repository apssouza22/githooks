#!/usr/bin/env bash

HOOK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Running pre-push hook..."

echo "Running go test ./... "
cd "$HOOK_DIR/../.."
go test ./...
