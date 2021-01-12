#---------------------------------------------------------------------
# Function: PreInstallCheck
#	Do some pre-install checks
#---------------------------------------------------------------------
PreInstallCheck() {
	echo -n "Preparing to install... "
	# Check source.list
  rel=$(lsb_release -cs)
  backports="${rel}-backports"
  allrepos=$(grep "${backports} main restricted universe multiverse" /etc/apt/sources.list)
  if [ -z "$allrepos" ]; then
    if grep "${backports}" /etc/apt/sources.list; then
      sed -i 's/main/main restricted universe multiverse/' /etc/apt/sources.list;
    else
      echo "deb http://archive.ubuntu.com/ubuntu ${backports} main restricted universe multiverse" >> /etc/apt/sources.list;
    fi
  fi
  echo -e "[${green}DONE${NC}]\n"
}