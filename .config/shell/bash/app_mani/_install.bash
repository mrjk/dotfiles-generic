
fetch() {
    if which curl > /dev/null; then
        if [ "$#" -eq 2 ]; then curl -L -o "$1" "$2"; else curl -sSL "$1"; fi
    elif which wget > /dev/null; then
        if [ "$#" -eq 2 ]; then wget -O "$1" "$2"; else wget -nv -O - "$1"; fi
    else
        echo "Can't find curl or wget, can't download package"
        exit 1
    fi
}

xsh__install_mani_dist ()
{
  local dest_dir="$HOME/.local/bin"

  local target 

  if [ "$(uname -s)" = "Darwin" ] && [ "$(uname -m)" = "x86_64" ]; then
      target="darwin_amd64"
  elif [ "$(uname -s)" = "Linux" ] && [ "$(uname -m)" = "x86_64" ]; then
      target="linux_amd64"
  elif [ "$(uname -s)" = "Linux" ] && ( uname -m | grep -q -e '^arm' -e '^aarch' ); then
      target="linux_arm64"
  else
      >&2 echo "Unsupported OS or architecture"
      return 1
  fi
  
  >&2 echo "Detected target: $target"
  
  url=$(
      fetch https://api.github.com/repos/alajmo/mani/releases/latest |
      tac | tac | grep -wo -m1 "https://.*$target.tar.gz" || true
  )
  
  if ! test "$url"; then
      >&2 echo "Could not find release info"
      exit 1
  fi
  
  >&2 echo "Downloading mani..."
  
  temp_dir=$(mktemp -dt mani.XXXXXX)
  trap 'rm -rf "$temp_dir"' EXIT INT TERM
  cd "$temp_dir"
  
  if ! fetch mani.tar.gz "$url"; then
      >&2 echo "Could not download tarball"
      exit 1
  fi
  
  bindir=${bindir:-$default_bin}
  
  tar xzf mani.tar.gz
  mkdir -p $dest_dir
  mv mani "$dest_dir/"
  
}

xsh__install_mani_dist

>&2 echo "Direnv has been installed"
