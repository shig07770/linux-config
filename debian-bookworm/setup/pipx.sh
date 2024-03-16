if [[ "$LC_USE_BASH" == "yes" ]]; then
  echo "# pipx" >>~/.bashrc
  echo "export PATH=\$PATH:\$HOME/.local/bin" >>~/.bashrc
else
  echo "# pipx" >>~/.zshrc
  echo "export PATH=\$PATH:\$HOME/.local/bin" >>~/.zshrc
fi
