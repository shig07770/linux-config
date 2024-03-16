# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source wget.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

# Create some directory
if [[ -n $LC_NVM_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_NVM_INSTALLATION_DIR"
else
  echo "Variable LC_NVM_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

# Run nvm installer
PROFILE=/dev/null NVM_DIR="$LC_NVM_INSTALLATION_DIR" bash -c 'wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh" | bash'
