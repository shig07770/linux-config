# debian/bookworm/presets/dev/cpp.sh - C/C++ development installation for Debian 12 (Bookworm)

cd "$(dirname $0)/../.."
source dirs.sh

bash presets/dotfile.sh

bash dev/cpp.sh

bash dev/git.sh
bash dev/vim.sh
bash dev/vscode.sh

bash game/cutentr.sh
bash game/discord.sh
bash game/ds4drv.sh
bash game/minecraft.sh
bash game/obs.sh

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
