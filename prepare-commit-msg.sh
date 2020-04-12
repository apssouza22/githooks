#!/usr/bin/env bash

echo "Running prepare-commit-msg hook..."
echo "Running the commit message formater"

# This way you can customize which branches should be skipped when
# prepending commit message.
if [ -z "$BRANCHES_TO_SKIP" ]; then
  BRANCHES_TO_SKIP=(master develop test)
fi
#
BRANCH_NAME=$(git symbolic-ref --short HEAD) # Get current branch name
JIRA_TICKET=$(echo ${BRANCH_NAME} | perl -wlne 'print "$1$2" if /(HOTMOD-|DEVOPS-)([^-]+)/') # extract the Jira ticket

BRANCH_EXCLUDED=$(printf "%s\n" "${BRANCHES_TO_SKIP[@]}" | grep -c "^$BRANCH_NAME$")
BRANCH_IN_COMMIT=$(grep -c "$JIRA_TICKET" $1)

if [ -n "$BRANCH_NAME" ] && ! [[ $BRANCH_EXCLUDED -eq 1 ]] && ! [[ $BRANCH_IN_COMMIT -ge 1 ]]; then
  sed -i.bak -e "1s/^/$JIRA_TICKET /" "$1"
fi
