#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


if [ ! -f $GOPATH/bin/golint ]; then
  echo "Downloading the Golint..."
  go get -u golang.org/x/lint/golint
fi

echo "Installing hooks..."
chmod +x "$SCRIPT_DIR"/pre-commit.sh
chmod +x "$SCRIPT_DIR"/pre-push.sh
chmod +x "$SCRIPT_DIR"/run-gotest.sh
chmod +x "$SCRIPT_DIR"/run-golint.sh
chmod +x "$SCRIPT_DIR"/run-git-lfs.sh

if [ -f "$GIT_DIR"/hooks/pre-push  ]; then
  echo "WARNING:: You already have a pre-commit hook in your project. You will need to update it manually."
fi
if [ -f "$GIT_DIR"/hooks/pre-push ]; then
  echo "WARNING:: You already have a pre-push hook in your project. You will need to update it manually."
fi

ln -s "$SCRIPT_DIR"/pre-commit.sh $GIT_DIR/hooks/pre-commit
ln -s "$SCRIPT_DIR"/pre-push.sh $GIT_DIR/hooks/pre-push

echo "Done!"
