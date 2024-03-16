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
wget -O minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb"
sudo dpkg -i minecraft.deb
sudo apt install -f
