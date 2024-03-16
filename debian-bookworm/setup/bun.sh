if [[ "$LC_USE_BASH" == "yes" ]]; then
  echo "# bun" >>~/.bashrc
  echo "export BUN_INSTALL=$LC_BUN_INSTALLATION_DIR" >>~/.bashrc
  echo "export PATH=\$PATH:\$BUN_INSTALL/bin" >>~/.bashrc
else
  echo "# bun" >>~/.zshrc
  echo "export BUN_INSTALL=$LC_BUN_INSTALLATION_DIR" >>~/.zshrc
  echo "export PATH=\$PATH:\$BUN_INSTALL/bin" >>~/.zshrc
fi
