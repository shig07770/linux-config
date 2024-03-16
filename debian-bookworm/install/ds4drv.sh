# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source python.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

pipx install ds4drv --force
