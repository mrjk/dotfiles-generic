
_xsh__git_user=$(id -u -n)
_xsh__git_host=$(hostname)

# Set git environment variables
export GIT_COMMITTER_NAME="${_xsh__git_user}"
export GIT_AUTHOR_EMAIL="${_xsh__git_user}@${_xsh__git_host}"
export GIT_AUTHOR_NAME="${_xsh__git_user}"
export GIT_COMMITTER_EMAIL="${_xsh__git_user}@${_xsh__git_host}"

