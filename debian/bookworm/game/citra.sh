cd "$(dirname $0)"
source ../vars.sh

bash ../util/wget.sh

cd /tmp/

wget -O citra "https://github.com/citra-emu/citra-web/releases/download/2.0/citra-setup-linux"
chmod +x citra

echo "Install in $GAMES_DIR/.citra"
echo "Install Citra Nightly"

./citra
