# debian/bookworm/presets/dotfile.sh - Dotfiles installation for Debian 12 (Bookworm)

rm "$HOME/.profile"
rm "$HOME/.bash_aliases"
rm "$HOME/.bash_logout"
rm "$HOME/.bash_profile"
rm "$HOME/.bashrc"

cp --recursive ../../dotfile/.cfg ~/.cfg

cp ../../dotfile/.bashrc ~/.bashrc
cp ../../dotfile/.bash_logout ~/.bash_logout
cp ../../dotfile/.bash_aliases ~/.bash_aliases
cp ../../dotfile/.bash_profile ~/.bash_profile

cp ../../dotfile/.vimrc ~/.vimrc

cp ../../dotfile/.gitconfig ~/.gitconfig

mkdir -p "$HOME/.config/Code/User"
cp ../../dotfile/.vscode.json ~/.vscode.json
ln -s "$HOME/.vscode.json" "$HOME/.config/Code/User/settings.json" --force
