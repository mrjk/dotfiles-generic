
git_clone_pull ()
{
  local dest=$1
  local repo=$2
  local branch=${3-}

  if [ -d "$dest/.git" ]; then
    git -C "$dest" pull --ff-only
  else
    git clone "$repo" "$dest"
  fi

  if [[ -n "$branch" ]]; then
    git -C "$dest" checkout "$branch"
  fi
}

create_symlink ()
{
  local src=$1
  local dest=$2

  if [ -L "$dest" ] || [ ! -s "$dest" ] ; then
    # Clean broken symlink, empty files
    rm "$dest" &> /dev/null || true
  fi

  if [ ! -L "$dest" ]; then
    ln -r -s "$src" "$dest"
  fi
}

_xsh__idmgr_repo="https://github.com/mrjk/idmgr"
_xsh__idmgr_branch=

xsh_install_idmgr_git ()
{

  local dest_git="$HOME/.local/shell/idmgr"
  local dest_bin="$HOME/.local/bin"

  mkdir -p "$dest_git"
  git_clone_pull "$dest_git"  "$_xsh__idmgr_repo" $_xsh__idmgr_branch
  mkdir -p "$dest_bin"
  create_symlink "$dest_git/bin/idmgr" "$dest_bin/idmgr"

}


xsh_install_idmgr_git
>&2 echo "Idmgr has been installed"
