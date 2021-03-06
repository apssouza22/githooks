#!/usr/bin/env bash

echo "Running pre-commit hook..."

if [ -x "$(command -v golangci-lint)" ] && [ -f "$PWD"/.golangci.yml  ]; then
  echo "Running Go static code analyzer at $PWD"
  golangci-lint cache clean
  golangci-lint run --new
fi
