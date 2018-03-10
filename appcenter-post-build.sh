#
# This script updates the Github status for commits based on whether or not
# a successful build occurred against that sha. It can be used in conjunction
# with the Azure Function to create a end to end PR check workflow or alone if
# you only wish to check branches preconfigured for continuous builds in App Center.
 
function parse_git_hash() {
  git rev-parse HEAD 
}

SHA=$(parse_git_hash)
github_notify_build_state() {
  STATE="\"success\""
  DESCRIPTION="\"App Center build successfully created!\""
  if [ "$1" != true ]; then 
    STATE="\"failure\""
    DESCRIPTION="\"Errors occurred during App Center build.\""
  fi
  curl -H "Content-Type: application/json" \
  -H "Authorization: token ${PR_GITHUB_TOKEN}" \
  -H "User-Agent: appcenter-ci" \
  -H "Content-Type: application/json" \
  --data "{
          \"state\": ${STATE},
          \"target_url\": \"https://appcenter.ms/${PR_APPCENTER_APP}/build/branches/${APPCENTER_BRANCH}/builds/${APPCENTER_BUILD_ID}\",
          \"description\": ${DESCRIPTION},
          \"context\": \"appcenter-ci/${PR_APPCENTER_APP#*/*/apps/}\"
        }" \
       https://api.github.com/repos/${PR_GITHUB_REPO}/statuses/${SHA}
}

if [ "$AGENT_JOBSTATUS" != "Succeeded" ]; then
    github_notify_build_state false
    exit 0
fi

github_notify_build_state true
