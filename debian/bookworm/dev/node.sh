cd "$(dirname $0)"
source ../dirs.sh

bash ../util/wget.sh

mkdir -p "$DEV_DIR/.nvm"
export NVM_DIR="$DEV_DIR/.nvm" && wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh" | bash

export NVM_DIR="$DEV_DIR/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install --lts
