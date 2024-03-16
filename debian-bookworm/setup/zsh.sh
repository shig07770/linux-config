if [[ -z $LC_ROOT ]]; then
  echo "Variable LC_ROOT is not set. Exiting..."
  exit 1
fi

cp "$LC_ROOT/.zshrc" "$HOME/.zshrc" --force

echo "# oh my zsh" >>~/.zshrc
echo "export ZSH=$LC_OH_MY_ZSH_INSTALLATION_DIR" >>~/.zshrc
echo "source \$ZSH/oh-my-zsh.sh" >>~/.zshrc
