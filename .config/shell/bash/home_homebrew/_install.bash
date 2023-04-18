
xsh__install_homebrew_dist ()
{

  local install_dst=$HOME/.local/shell/homebrew
  mkdir $install_dst && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C $install_dst
  return


  local dest_dir="$HOME/.local/bin"

  local version= #latest
  local kernel= machine= release= download_url=

  kernel=$(uname -s | tr "[:upper:]" "[:lower:]")
  case "${kernel}" in
    mingw*)
      kernel=windows
      ;;
  esac
  case "$(uname -m)" in
    x86_64)
      machine=amd64
      ;;
    i686 | i386)
      machine=386
      ;;
    aarch64 | arm64)
      machine=arm64
      ;;
    *)
      die "Machine $(uname -m) not supported by the installer.\n" \
        "Go to https://homebrew for alternate installation methods."
      ;;
  esac

  if [[ -n "${version:-}" ]]; then
    release="tags/${version}"
  else
    release="latest"
  fi
  echo "release=$release"

  download_url=$(
    curl -fL "https://api.github.com/repos/cli/cli/releases/$release" \
    | grep browser_download_url \
    | cut -d '"' -f 4 \
    | grep "${kernel}_${machine}.tar.gz"
  )

  >&2 echo "Downloading homebrew..."
  
  temp_dir=$(mktemp -dt homebrew.XXXXXX)
  trap 'rm -rf "$temp_dir"' EXIT INT TERM
  cd "$temp_dir"
  
  if ! fetch $temp_dir/homebrew.tar.gz "$download_url"; then
      >&2 echo "Could not download tarball"
      exit 1
  fi
  
  
  tar xzf $temp_dir/homebrew.tar.gz
  ls -ahl
  return

  mkdir -p $dest_dir
  mv homebrew "$dest_dir/"



  mkdir -p "$dest_dir"
  echo curl -o "$dest_dir/homebrew" -fL "$download_url"
  echo chmod a+x "$dest_dir/homebrew"
  set +x
}


xsh__install_homebrew_dist

>&2 echo "Homebrew has been installed"
