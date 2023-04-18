

xsh__install_taskfile_dist ()
{
  local dest_dir="$HOME/.local/bin"
  sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b "$dest_dir"
}

xsh__install_taskfile_dist

>&2 echo "Task has been installed"
