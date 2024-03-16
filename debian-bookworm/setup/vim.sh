if [[ -z $LC_ROOT ]]; then
  echo "Variable LC_ROOT is not set. Exiting..."
  exit 1
fi

cp "$LC_ROOT/.vimrc" "$HOME/.vimrc" --force
