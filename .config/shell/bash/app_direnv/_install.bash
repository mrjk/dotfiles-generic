

xsh__install_direnv_dist ()
{
  local dest_bin="$HOME/.local/bin/direnv"

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
        "Go to https://direnv for alternate installation methods."
      ;;
  esac

  if [[ -n "${version:-}" ]]; then
    release="tags/${version}"
  else
    release="latest"
  fi
  echo "release=$release"

  download_url=$(
    curl -fL "https://api.github.com/repos/direnv/direnv/releases/$release" \
    | grep browser_download_url \
    | cut -d '"' -f 4 \
    | grep "direnv.$kernel.$machine"
  )

  curl -o "$dest_bin" -fL "$download_url"
  chmod a+x "$dest_bin"
  set +x
}


xsh__install_direnv_dist

>&2 echo "Direnv has been installed"
