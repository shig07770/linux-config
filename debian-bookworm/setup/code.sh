if [[ -z $LC_ROOT ]]; then
  echo "Variable LC_ROOT is not set. Exiting..."
  exit 1
fi

cp "$LC_ROOT/.config/Code/User/settings.json" "$HOME/.config/Code/User/settings.json" --force
cp "$LC_ROOT/.config/Code/User/d81d24145f5b50b57f71d6239e9c52dc.png" "$HOME/.config/Code/User/d81d24145f5b50b57f71d6239e9c52dc.png" --force

code --install-extension Vue.volar --force
code --install-extension teabyii.ayu --force
code --install-extension vscodevim.vim --force
code --install-extension ms-python.python --force
code --install-extension Dart-Code.flutter --force
code --install-extension ms-toolsai.jupyter --force
code --install-extension qwtel.sqlite-viewer --force
code --install-extension shalldie.background --force
code --install-extension ritwickdey.LiveServer --force
code --install-extension tamasfe.even-better-toml --force
code --install-extension ms-vscode.makefile-tools --force
code --install-extension foxundermoon.shell-format --force
code --install-extension bradlc.vscode-tailwindcss --force
code --install-extension yzhang.markdown-all-in-one --force
code --install-extension slevesque.vscode-zipexplorer --force
code --install-extension vscode-icons-team.vscode-icons --force
code --install-extension ms-vscode.vscode-typescript-next --force
code --install-extension ms-vscode.cpptools-extension-pack --force
code --install-extension bierner.markdown-preview-github-styles --force


