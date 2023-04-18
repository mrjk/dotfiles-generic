
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


xsh__install_gh_dist ()
{
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
        "Go to https://gh for alternate installation methods."
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

  >&2 echo "Downloading gh..."
  
  temp_dir=$(mktemp -dt gh.XXXXXX)
  trap 'rm -rf "$temp_dir"' EXIT INT TERM
  #cd "$temp_dir"
  
  if ! fetch $temp_dir/gh.tar.gz "$download_url"; then
      >&2 echo "Could not download tarball"
      exit 1
  fi
  
  
  tar xzf $temp_dir/gh.tar.gz
  ls -ahl
  local binary=$(tar tf $temp_dir/gh.tar.gz | grep bin/gh)
  tar --extract --file=$temp_dir/gh.tar.gz --directory "$dest_dir" --strip-components=2 $binary
}


xsh__install_gh_dist

>&2 echo "GH has been installed"
