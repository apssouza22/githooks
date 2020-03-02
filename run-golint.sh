#!/usr/bin/env bash

# if any command inside script returns error, exit and return that error 
set -e

export GOLINTPATH=${GOPATH}/bin/golint

echo "Running Go lint"
cd "$1/../.."
errcount=$($GOLINTPATH ./... | wc -l)
if [ "$errcount" -gt "0" ]; then
  echo "Found $errcount lint issues." && exit 1
  echo "............................"
fi
exit 0
