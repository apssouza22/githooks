#!/usr/bin/env bash

GIT_DIR=$(git rev-parse --git-dir)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ ! -x "$(command -v golangci-lint)" ]; then
  echo "Please install golangci-lint. Run brew install golangci/tap/golangci-lint"
  exit 1
fi

echo "Installing hooks..."
chmod +x "$SCRIPT_DIR"/pre-commit.sh
chmod +x "$SCRIPT_DIR"/pre-push.sh


if [ -f "$GIT_DIR"/hooks/pre-push  ]; then
  echo "WARNING:: You already have a pre-commit hook in your project. You will need to update it manually."
fi
if [ -f "$GIT_DIR"/hooks/pre-push ]; then
  echo "WARNING:: You already have a pre-push hook in your project. You will need to update it manually."
fi

cp "$SCRIPT_DIR"/pre-commit.sh $GIT_DIR/hooks/pre-commit
cp "$SCRIPT_DIR"/pre-push.sh $GIT_DIR/hooks/pre-push

echo "Done!"
