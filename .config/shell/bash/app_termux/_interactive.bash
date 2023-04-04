
# Important places
alias sdcard='cd /storage/emulated/0'
alias downloads='cd /storage/emulated/0/Download'
alias photos='cd /storage/emulated/0/DCIM/Camera'

# Interact with termux api
if command -v termux-open &>/dev/null; then
  alias open='termux-open '
  alias open-url='termux-open-url '
fi

# Other functions
serve_ssh_bg()
{
  sshd
}

serve_ssh()
{
  sshd -D
}

serve_ftp_public_read_only ()
{
  local bind="0.0.0.0,8021"
  echo "INFO: Anonymous RO service listening on: ${bind//,/:}"
  pure-ftpd \
    -d -d \
    --bind "$bind" \
    --anonymousonly \
    --anonymouscantupload \
    --prohibitdotfileswrite \
    --prohibitdotfilesread \
    --maxidletime 60

}

serve_ftp_localhost_rw ()
{
  set -x
  
  # To add user:
  # pure-pw useradd jez -f $cfg_dir/pureftpd.passwd -u $(id -un) -g $(id -gn) -d $HOME
  
  
  # Update db
  local cfg_dir="/data/data/com.termux/files/usr/etc"
  local bind="127.0.0.1,8021"
  
  pure-pw mkdb  $cfg_dir/pure-ftpd.pdb -f $cfg_dir/pureftpd.passwd
  
  echo "INFO: Login only ftp service listening on: ${bind//,/:}"
  pure-ftpd \
    -d -d \
    --login puredb:$cfg_dir/pure-ftpd.pdb \
    --bind "$bind" \
    --noanonymous \
    --allowdotfiles \
    --anonymouscancreatedirs \
    --maxidletime 60
    
       # --trustedip 127.0.0.1 \
  
}



adb_init ()
{
  #set -x 
  # Kill any ecisting ADB server
  adb kill-server

  # Set new connection
  echo "Info: Connecting to device: \$ANDROID_SERIAL=$ANDROID_SERIAL ..."
  export ANDROID_SERIAL=${1:-'127.0.0.1:5555'}
  adb connect $ANDROID_SERIAL

  # Test connection 
  sleep 1
  adb shell echo "Ok: ADB connection is successful!"
  local r=$?

  # Display
  if [ "$r" -eq 0 ] ; then
    echo "Ok: Run adb shell command to start shell: adb shell"
    echo
    adb devices
  else
    echo "Error: Something wrong hapenned while trying to connect to device ADB."
    echo "Error: Please ensure Wireless and then USB debugging is activated."
    
    # Show more info with nmap
    if command -v nmap >&/dev/null; then
      local host=${ANDROID_SERIAL%:*}
      local port=${ANDROID_SERIAL#*:}
      [ "$host" != "$port" ] || port=5555
      printf "Info: Destination port status: "
      nmap "$host" -p "$port" | grep --color=never "$port"
    fi
    
    echo "Error: Then try to run again this command."
  fi
  
  set +x
}



backup_home_tar ()
{
  local dst=/storage/emulated/0/termux-home-backup.tar.gz

 (
   cd /data/data/com.termux/files
   tar -zcvf $dst home

 )
 echo "Backup created in: $dst"
}

