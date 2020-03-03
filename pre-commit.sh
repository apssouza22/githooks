#!/usr/bin/env bash

HOOK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
GOLINTPATH=${GOPATH}/bin/golint

echo "Running pre-commit hook..."

echo "Running Go lint..."
cd "$HOOK_DIR/../.."

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

echo "Golint must pass before commit!"
exit 1
