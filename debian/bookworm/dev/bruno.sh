cd "$(dirname $0)"
source ../vars.sh

bash ../util/wget.sh

cd /tmp/
wget -O bruno.deb "https://github.com/usebruno/bruno/releases/download/v1.5.1/bruno_1.5.1_amd64_linux.deb"

sudo dpkg -i bruno.deb
sudo apt install -f
