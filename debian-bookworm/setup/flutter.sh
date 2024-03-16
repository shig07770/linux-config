if [[ "$LC_USE_BASH" == "yes" ]]; then
  echo "# flutter" >>~/.bashrc
  echo "export CHROME_EXECUTABLE=/usr/bin/chromium" >>~/.bashrc
  echo "export PATH=\$PATH:$LC_FLUTTER_SDK_INSTALLATION_DIR/bin" >>~/.bashrc
else
  echo "# flutter" >>~/.zshrc
  echo "export CHROME_EXECUTABLE=/usr/bin/chromium" >>~/.zshrc
  echo "export PATH=\$PATH:$LC_FLUTTER_SDK_INSTALLATION_DIR/bin" >>~/.zshrc
fi
