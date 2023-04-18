

xsh__install_gitea_dist ()
{
  local dest_bin="$HOME/.local/bin"

  local version="0.9.2"
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
        "Go to https://gitea for alternate installation methods."
      ;;
  esac

  # https://dl.gitea.com/tea/$version/tea-$version-$kernel-$machine
  mkdir -p "$dest_bin"
  curl -o "$dest_bin/tea" -fL "https://dl.gitea.com/tea/$version/tea-$version-$kernel-$machine"
  chmod a+x "$dest_bin/tea"
}


xsh__install_gitea_dist

>&2 echo "Tea has been installed"
