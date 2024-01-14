cd "$(dirname $0)"
source ../vars.sh

sudo apt install python3 python3-pip pipx
pipx install notebook

# ~/.cfg/.pipx takes care of adding the ~/.local/bin directory to the PATH
# so running pipx ensurepath is not needed
