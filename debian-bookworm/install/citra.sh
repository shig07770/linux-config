# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source wget.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

if [[ -n $LC_CITRA_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_CITRA_INSTALLATION_DIR"
else
  echo "Variable LC_CITRA_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

# Go into a temporary directory
ts="$(date +%s)"
mkdir -p "/tmp/$ts" && cd "/tmp/$ts"

# Download and run Citra installer
wget -O citra "https://github.com/citra-emu/citra-web/releases/download/2.0/citra-setup-linux"
chmod +x citra

echo "Install Citra at $LC_CITRA_INSTALLATION_DIR"
./citra >/dev/null 2>&1
