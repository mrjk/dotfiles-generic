alias pacrank='rankmirrors /etc/pacman.d/mirrorlist.sorted > /etc/pacman.d/mirrorlist'

alias paclog=' cat /var/log/pacman.log'
alias paclogg=' cat /var/log/pacman.log | grep'
alias paclogi=' cat /var/log/pacman.log | grep installed'
alias paclogr=' cat /var/log/pacman.log | grep removed'
alias paclogu=' cat /var/log/pacman.log | grep upgraded'
alias paclogug=' cat /var/log/pacman.log | grep upgraded | grep'



# Pacman alias examples
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rnsi'	# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed


# Archlinux aliases

pacman-update() {
  
  local listing=$(pacman -Sl)

  echo "$listing" | awk '{print $2}' | xargs sudo pacman -Sy

}

pacman-lostfiles() {

>&2 echo "Executing: sudo lostfiles ${2:-relaxed} | grep '${1:-${PWD}}'"
  sudo lostfiles ${2:-relaxed} | grep "${1:-${PWD}}"

}

