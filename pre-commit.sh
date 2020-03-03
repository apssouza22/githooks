#!/usr/bin/env bash

HOOK_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

### Getting the path for the symlink script
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  SYMLINK_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$SYMLINK_DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SYMLINK_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
### END - Getting the path for the symlink script

echo "Running pre-commit hook"

"$SYMLINK_DIR"/run-golint-file.sh "$HOOK_DIR"
# $? stores exit value of the last command
if [ $? -ne 0 ]; then
  echo "Golint must pass before commit!"
  exit 1
fi
