# debian/bookworm/presets/minimal.sh - Minimal installation for Debian 12 (Bookworm)

cd "$(dirname $0)/.."
source vars.sh

bash presets/dotfile.sh

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
bash util/wine.sh

bash dev/vim.sh
