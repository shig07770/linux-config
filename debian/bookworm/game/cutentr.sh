cd "$(dirname $0)"
source ../vars.sh

bash ../util/wget.sh

cd /tmp/

wget -O cutentr.flatpak https://gitlab.com/BoltsJ/cuteNTR/uploads/da6b5bafbab68b45cc9bee0ae590a3ca/com.gitlab.BoltsJ.cuteNTR.flatpak
flatpak install ./cutentr.flatpak
