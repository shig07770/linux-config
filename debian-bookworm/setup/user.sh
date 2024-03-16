if [[ -z $LC_OS_USER_NAMENAME ]]; then
  echo "Variable LC_OS_USER_NAMENAME is not set. Exiting..."
  exit 1
fi

sudo adduser $LC_OS_USER_NAME adm
sudo adduser $LC_OS_USER_NAME audio
sudo adduser $LC_OS_USER_NAME bluetooth
sudo adduser $LC_OS_USER_NAME cdrom
sudo adduser $LC_OS_USER_NAME fax
sudo adduser $LC_OS_USER_NAME floppy
sudo adduser $LC_OS_USER_NAME kvm
sudo adduser $LC_OS_USER_NAME lp
sudo adduser $LC_OS_USER_NAME lpadmin
sudo adduser $LC_OS_USER_NAME netdev
sudo adduser $LC_OS_USER_NAME plugdev
sudo adduser $LC_OS_USER_NAME render
sudo adduser $LC_OS_USER_NAME scanner
sudo adduser $LC_OS_USER_NAME systemd-journal
sudo adduser $LC_OS_USER_NAME tape
sudo adduser $LC_OS_USER_NAME users
sudo adduser $LC_OS_USER_NAME video
sudo adduser $LC_OS_USER_NAME voice
