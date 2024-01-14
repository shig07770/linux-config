cd "$(dirname $0)"
source ../dirs.sh

bash ../util/wget.sh

cd /tmp/

wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"

sudo dpkg -i discord.deb
sudo apt install -f
