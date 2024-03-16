# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source wget.sh
  source flatpak.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi
# Go into a temporary directory
ts="$(date +%s)"
mkdir -p "/tmp/$ts" && cd "/tmp/$ts"

# Download and install the .flatpak package
wget -O cutentr.flatpak "https://gitlab.com/BoltsJ/cuteNTR/uploads/da6b5bafbab68b45cc9bee0ae590a3ca/com.gitlab.BoltsJ.cuteNTR.flatpak"
flatpak install cutentr.flatpak
