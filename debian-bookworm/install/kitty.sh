# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source sed.sh
  source curl.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

curl -L "https://sw.kovidgoyal.net/kitty/installer.sh" | sh /dev/stdin

ln -sf "$HOME/.local/kitty.app/bin/kitty" "$HOME/.local/kitty.app/bin/kitten" "$HOME/.local/bin/"

cp "$HOME/.local/kitty.app/share/applications/kitty.desktop" "$HOME/.local/share/applications" --force
cp "$HOME/.local/kitty.app/share/applications/kitty-open.desktop" "$HOME/.local/share/applications" --force
 
