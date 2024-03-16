if [[ -z $LC_ROOT ]]; then
  echo "Variable LC_ROOT is not set. Exiting..."
  exit 1
fi

cp "$LC_ROOT/.config/user-dirs.dirs" "$HOME/.config/" --force
cp "$LC_ROOT/.config/user-dirs.locale" "$HOME/.config/" --force

source "$HOME/.config/user-dirs.dirs"

mkdir -p "$XDG_MUSIC_DIR"
mkdir -p "$XDG_VIDEOS_DIR"
mkdir -p "$XDG_DESKTOP_DIR"
mkdir -p "$XDG_DOWNLOAD_DIR"
mkdir -p "$XDG_PICTURES_DIR"
mkdir -p "$XDG_DOCUMENTS_DIR"
mkdir -p "$XDG_TEMPLATES_DIR"
mkdir -p "$XDG_PROGRAMMING_DIR"
mkdir -p "$XDG_PUBLICSHARE_DIR"
