# debian/bookworm/presets/dev/all.sh - Development installation for Debian 12 (Bookworm)

cd "$(dirname $0)/../.."
source vars.sh

bash presets/dotfile.sh

bash dev/bruno.sh
bash dev/cpp.sh
bash dev/flutter.sh
bash dev/mariadb.sh
bash dev/node.sh
bash dev/py.sh

bash git.sh
bash dev/vim.sh
bash dev/vscode.sh

bash util/chromium.sh
bash util/curl.sh
bash util/flatpak.sh
bash util/gnupg.sh
bash util/grep.sh
bash util/keepassxc.sh
bash util/rclone.sh
bash util/sed.sh
bash util/tar.sh
bash util/unzip.sh
bash util/vlc.sh
bash util/wget.sh
