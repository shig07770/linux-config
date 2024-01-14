cd "$(dirname $0)"
source ../dirs.sh

bash ../util/wget.sh

sudo apt install java-common

cd /tmp/

wget -O minecraft.deb "https://launcher.mojang.com/download/Minecraft.deb"
wget -O fabric.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.11.2/fabric-installer-0.11.2.jar

sudo dpkg -i minecraft.deb
sudo apt install -f

java -jar fabric.jar
