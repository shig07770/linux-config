cd "$(dirname $0)"
source ../vars.sh

bash wget.sh

cd /tmp/

wget -O rclone-current-linux-amd64.zip "https://downloads.rclone.org/rclone-current-linux-amd64.zip"
unzip rclone-current-linux-amd64.zip

cd rclone-*-linux-amd64

sudo cp rclone /usr/bin/
sudo chown root:root /usr/bin/rclone
sudo chmod 755 /usr/bin/rclone

sudo mkdir -p /usr/local/share/man/man1
sudo cp rclone.1 /usr/local/share/man/man1/
sudo mandb

echo "Configurating rclone..."
echo "Name the remote 'rmt'"

rclone config

rclone copy rmt:/Music/ "$MUSIC_DIR"
rclone copy rmt:/Videos/ "$VIDEOS_DIR"
rclone copy rmt:/Pictures/ "$PICTURES_DIR"
rclone copy rmt:/Documents/ "$DOCUMENTS_DIR"
rclone copy rmt:/Templates/ "$TEMPLATES_DIR"

ln -s "$DOCUMENTS_DIR/KeepassXC/passwords.kdbx" "$DESKTOP_DIR/passwords.kdbx"
