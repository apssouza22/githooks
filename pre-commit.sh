#!/usr/bin/env bash

echo "Running pre-commit hook..."

echo "Running Go static code analyzer at "
echo "$PWD"

golangci-lint run --new
