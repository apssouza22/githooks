#!/usr/bin/env bash

# if any command inside script returns error, exit and return that error
set -e

echo "Running go test ./... -tags=all,unit,integration"
cd "$1/../.."
go test ./... -tags=all,unit,integration
