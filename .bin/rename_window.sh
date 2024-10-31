REPO_NAME=$(basename $(git rev-parse --show-toplevel 2>/dev/null) || echo "")
BRANCH_NAME=$(git symbolic-ref --short HEAD 2>/dev/null || echo "")

if [ -z "${REPO_NAME}" ]; then
  OUTPUT_STRING="DIR: $(echo ${pane_current_path} | sed 's-'${HOME}'-~-g')"
else
  OUTPUT_STRING="REPO: ${REPO_NAME}:${BRANCH_NAME}"
fi

if [ "x${pane_current_command}" != "xssh" ]; then
  tmux rename-window "${OUTPUT_STRING}"
fi
