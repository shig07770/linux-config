if [[ -z $LC_MAIN ]]; then
  echo "Variable LC_MAIN is not set. Exiting..."
  exit 1
fi

cd "$LC_MAIN"

come_back() {
  cd "$LC_MAIN"
}

install/zsh.sh && come_back
setup/zsh.sh && combe_back

setup/dirs.sh && come_back
setup/keyboard.sh && come_back

install/git.sh && come_back
install/vim.sh && come_back

install/bun.sh && come_back
install/code.sh && come_back
install/bruno.sh && come_back
install/cmake.sh && come_back
install/kitty.sh && come_back

install/nvm.sh && come_back
install/gcc.sh && come_back
install/gdb.sh && come_back
install/g++.sh && come_back
install/python.sh && come_back
install/flutter.sh && come_back

setup/bun.sh && come_back
setup/code.sh && come_back
setup/dirs.sh && come_back
setup/flutter.sh && come_back
setup/github.sh && come_back
setup/kitty.sh && come_back
setup/nvm.sh && come_back
setup/pipx.sh && come_back
setup/vim.sh && come_back
