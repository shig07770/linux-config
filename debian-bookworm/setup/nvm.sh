if [[ "$LC_USE_BASH" == "yes" ]]; then
  echo "# nvm" >>~/.bashrc
  echo "export NVM_DIR=$LC_NVM_INSTALLATION_DIR" >>~/.bashrc
  echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"" >>~/.bashrc
  echo "[ -s \"\$NVM_DIR/bash_completion.sh\" ] && \. \"\$NVM_DIR/bash_completion.sh\"" >>~/.bashrc
else
  echo "# nvm" >>~/.zshrc
  echo "export NVM_DIR=$LC_NVM_INSTALLATION_DIR" >>~/.zshrc
  echo "[ -s \"\$NVM_DIR/nvm.sh\" ] && \. \"\$NVM_DIR/nvm.sh\"" >>~/.zshrc
fi
