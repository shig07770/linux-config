cd "$(dirname $0)"
source ../vars.sh

bash ../util/wget.sh

cd /tmp/

wget -O steam.deb "https://cdn.akamai.steamstatic.com/client/installer/steam.deb"

sudo dpkg -i steam.deb
sudo apt install -f
