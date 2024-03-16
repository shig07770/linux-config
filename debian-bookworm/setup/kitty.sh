if [[ -z $LC_ROOT ]]; then
  echo "Variable LC_ROOT is not set. Exiting..."
  exit 1
fi

ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/

mkdir -p ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/

sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

cp "$LC_ROOT/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf" --force
cp "$LC_ROOT/.config/kitty/current-theme.conf" "$HOME/.config/kitty//current-theme.conf" --force
cp "$LC_ROOT/.config/kitty/445490b89fbceb7b740f7d9cb4baf936.png" "$HOME/.config/kitty/445490b89fbceb7b740f7d9cb4baf936.png" --force
