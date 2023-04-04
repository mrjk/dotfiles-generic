
git_clone_pull ()
{
  local dest=$1
  local repo=$2

  if [ -d "$dest/.git" ]; then
    git -C "$dest" pull --ff-only
  else
    git clone "$repo" "$dest"
  fi
}

create_symlink ()
{
  local src=$1
  local dest=$2

  if [ ! -e "$dest" ] || [ ! -s "$dest" ] ; then
    # CLean broken symlink, empty files
    rm "$dest"
  fi

  if [ ! -L "$dest" ]; then
    ln -r -s "$src" "$dest"
  fi
}


install_xsh_dev ()
{

  export XSH_LVL=$(( ${XSH_LVL:-0} + 1 ))
  if [[ "${XSH_LVL}" -eq 1 ]] ; then

    local repo="https://github.com/mrjk/xsh"
    local dest_git="$HOME/.local/lib/xsh"
    local dest_bin="$HOME/.config/xsh/xsh.sh"
    local dest_data="$HOME/.config/xsh/runcom"

    mkdir -p "$dest_git"
    git_clone_pull "$dest_git"  "$repo"
    mkdir -p "$HOME/.config/xsh"
    create_symlink "$dest_git/xsh.sh" "$dest_bin"
    create_symlink "$dest_git/runcom" "$dest_data"

    #. "${XSH_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/xsh}/xsh.sh"
    local shell=posix
    if command -v bash >&/dev/null; then
      shell=bash
    elif command -v zsh >&/dev/null; then
      shell=zsh
    fi

    # Bootstrap shell
    XSH_SHELLS=$shell
    . "$dest_git/xsh.sh"

    # Install local config
    xsh -s $shell bootstrap

    #env | grep -i xsh
    #for i in ${!XSH_*} ; do
    #  echo "$i=${!i}"
    #done
    #if [[ -z "${XSH_VERSION:-}" ]] ; then

    # This is here to avoid loop recursion
    xsh -s $shell runcom install
  fi
}


install_xsh_dev

>&2 echo "Xsh has been installed"
