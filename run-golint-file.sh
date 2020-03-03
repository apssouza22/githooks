#!/usr/bin/env bash

# if any command inside script returns error, exit and return that error 
set -e

export GOLINTPATH=${GOPATH}/bin/golint

echo "Running Go lint..."
cd "$1/../.."

# This script does not handle file names that contain spaces.
gofiles=$(git diff --name-only --diff-filter=ACM | grep '\.go$' || echo "")

if [ -z "$gofiles" ]; then
  echo "No lint issue"
  exit 0
fi

# Run on one file at a time because a single invocation of golint
# with multiple files requires the files to all be in one package.
for gofile in $gofiles
do
	errcount=$($GOLINTPATH $gofile | wc -l)
	if [ "$errcount" -gt "0" ]; then
		errors=YES
		echo "$errcount lint suggestions in:"
		echo "golint $gofile"
	fi
done

[ -z "$errors" ] && exit 0
exit 1
