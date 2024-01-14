# debian/bookworm/presets/gaming.sh - Gaming installation for Debian 12 (Bookworm)

cd "$(dirname $0)/.."
source dirs.sh

bash presets/dotfile.sh

bash game/cutentr.sh
bash game/discord.sh
bash game/ds4drv.sh
bash game/minecraft.sh
bash game/obs.sh
