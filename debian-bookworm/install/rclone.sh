# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source curl.sh
  source unzip.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

curl https://rclone.org/install.sh | sudo bash
