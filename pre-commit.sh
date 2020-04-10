#!/usr/bin/env bash

echo "Running pre-commit hook..."
if [ -x "$(command -v golangci-lint)" ]; then
  echo "Running Go static code analyzer at $PWD"
  golangci-lint cache clean
  golangci-lint run --new
fi
