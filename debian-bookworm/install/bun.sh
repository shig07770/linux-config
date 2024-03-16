# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source curl.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_BUN_INSTALLATION_DIR ]]; then
  echo "Variable LC_BUN_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

BUN_INSTALL="$LC_BUN_INSTALLATION_DIR" bash -c 'curl -fsSL https://bun.sh/install | bash'
