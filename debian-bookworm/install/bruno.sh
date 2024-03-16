# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source wget.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

# Go into a temporary directory
ts="$(date +%s)"
mkdir -p "/tmp/$ts" && cd "/tmp/$ts"

# Download and install the .deb package
wget -O bruno.deb "https://github.com/usebruno/bruno/releases/download/v1.9.0/bruno_1.9.0_amd64_linux.deb"
sudo dpkg -i bruno.deb
sudo apt install -f
