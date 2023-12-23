cd "$(dirname $0)"
source ../vars.sh

bash ../util/wget.sh

cd /tmp/
wget -O "vscode.deb" "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo dpkg -i vscode.deb
sudo apt install -f

code --install-extension Vue.volar --force
code --install-extension vscodevim.vim --force
code --install-extension ms-python.python --force
code --install-extension Dart-Code.flutter --force
code --install-extension ms-toolsai.jupyter --force
code --install-extension alexcvzz.vscode-sqlite --force
code --install-extension ms-vscode.makefile-tools --force
code --install-extension foxundermoon.shell-format --force
code --install-extension bradlc.vscode-tailwindcss --force
code --install-extension vscode-icons-team.vscode-icons --force
code --install-extension Vue.vscode-typescript-vue-plugin --force
code --install-extension ms-vscode.vscode-typescript-next --force
code --install-extension ms-vscode.cpptools-extension-pack --force
