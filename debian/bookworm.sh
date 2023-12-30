# shig07770/linux-config/debian/bookworm.sh - Linux configuration script for Debian 12 (Bookworm).
# --------------------------------------------------------------------------

# prevent running as root
if [ $UID -eq 0 ]; then
  echo "Script is running as root (UID is equal to 0) which is likely a mistake... Aborting."
  exit 1
fi

# --------------------------------------------------------------------------

export LINUX_CONFIG_ROOT="$(realpath $(dirname $0)/..)" # the root of the repo (edit if the file is moved)
source "$LINUX_CONFIG_ROOT/home/.config/user-dirs.dirs" # access $XDG_GAMES_DIR, $XDG_MUSIC_DIR, ect. (do not remove)

# --------------------------------------------------------------------------

export USER_NAME="shig07770"                # used in gnupg identity [inst_gnupg]
export USER_EMAIL="shig07770+dev@gmail.com" # used in gnupg identity [inst_gnupg]
export USER_GPG_KEY_ID=""                   # the generated GPG key's ID, this is empty as it's set later [inst_gnupg]

# --------------------------------------------------------------------------

export NVM_DIR="$XDG_PROGRAMMING_DIR/.nvm" # where nvm (Node Version Manager) is installed [inst_nvm]

# --------------------------------------------------------------------------

export FLUTTER_DIR="$XDG_PROGRAMMING_DIR/.flutter"               # where Flutter is installed (warning: if you edit this, you have to edit the one in .bashrc) [inst_flutter, inst_flutter_sdk]
export ANDROID_SDK_DIR="$XDG_PROGRAMMING_DIR/.android/sdk"       # where the Android SDK is installed [inst_flutter, inst_android_studio]
export ANDROID_CLI_TOOLS_DIR="$ANDROID_SDK_DIR/cmdline-tools"    # where the Android CLI tools are installed (do not edit) [inst_flutter, inst_android_studio]
export ANDROID_STUDIO_DIR="$XDG_PROGRAMMING_DIR/.android/studio" # where Android Studio is installed [inst_flutter, inst_android_studio]

# --------------------------------------------------------------------------

export USER_GITHUB_SSH_PRIV_KEY_FILEPATH="$HOME/.ssh/github_$USER_NAME"          # where the GitHub SSH private key should be saved [inst_github]
export USER_GITHUB_SSH_PUB_KEY_FILEPATH="$USER_GITHUB_SSH_PRIV_KEY_FILEPATH.pub" # where the GitHub public key should be saved (do not edit) [inst_github]

# --------------------------------------------------------------------------

export CITRA_DIR="$XDG_GAMES_DIR/.citra" # where Citra *should* be installed, this is NOT enforced, only advised before running the Citra setup executable [inst_citra]

# --------------------------------------------------------------------------

export RCLONE_REMOTE_NAME="rmt" # the name for the rclone remote, this is NOT enforced, only advised before running rclone config BUT copying the folders won't work if it's not named like that [inst_rclone]

# --------------------------------------------------------------------------

# Minimal setup: what I want (at least) on ALL of my computers
minimal() {
  user_dirs
  bash_setup
  groups_setup

  inst_tar
  inst_sed
  inst_wget
  inst_grep
  inst_curl
  inst_gnupg
  inst_unzip
  inst_openssh

  inst_rclone

  inst_vlc
  inst_chromium
  inst_keepassxc
}

# Gaming preset
preset_games() {
  minimal

  inst_flatpak # for cutentr
  inst_python  # for ds4drv

  inst_obs
  inst_wine
  inst_java
  inst_steam
  inst_citra
  inst_ds4drv
  inst_cutentr
  inst_discord
  inst_minecraft
}

# Development preset
preset_dev() {
  minimal

  # C/C++
  inst_gcc
  inst_g++
  inst_gdb
  inst_cmake

  # JS/TS
  inst_nvm

  # Tools
  inst_git
  inst_vim
  inst_code
  inst_bruno
  inst_github
  inst_mariadb

  # Python
  inst_python
  inst_notebook

  # Flutter
  inst_flutter
}

# Installs everything: this is the default preset (ran at the end)
preset_full() {
  minimal

  preset_dev
  preset_games
}

# --------------------------------------------------------------------------

groups_setup() {
  USER_USERNAME=$(whoami)

  sudo adduser "$USER_USERNAME" adm
  sudo adduser "$USER_USERNAME" audio
  sudo adduser "$USER_USERNAME" bluetooth
  sudo adduser "$USER_USERNAME" cdrom
  sudo adduser "$USER_USERNAME" fax
  sudo adduser "$USER_USERNAME" floppy
  sudo adduser "$USER_USERNAME" kvm
  sudo adduser "$USER_USERNAME" lp
  sudo adduser "$USER_USERNAME" lpadmin
  sudo adduser "$USER_USERNAME" netdev
  sudo adduser "$USER_USERNAME" plugdev
  sudo adduser "$USER_USERNAME" render
  sudo adduser "$USER_USERNAME" scanner
  sudo adduser "$USER_USERNAME" systemd-journal
  sudo adduser "$USER_USERNAME" tape
  sudo adduser "$USER_USERNAME" users
  sudo adduser "$USER_USERNAME" video
  sudo adduser "$USER_USERNAME" voice
}

user_dirs() {
  # Creates and sets up notable notable user directories (ie, "Music", "Videos")
  # so that other applications can use them.

  mkdir -p "$XDG_GAMES_DIR"
  mkdir -p "$XDG_MUSIC_DIR"
  mkdir -p "$XDG_VIDEOS_DIR"
  mkdir -p "$XDG_DESKTOP_DIR"
  mkdir -p "$XDG_PICTURES_DIR"
  mkdir -p "$XDG_DOWNLOAD_DIR"
  mkdir -p "$XDG_TEMPLATES_DIR"
  mkdir -p "$XDG_DOCUMENTS_DIR"
  mkdir -p "$XDG_PROGRAMMING_DIR"
  mkdir -p "$XDG_PUBLICSHARE_DIR"
  mkdir -p "$XDG_PROGRAMMING_PROJECTS_DIR"

  cp --force "$LINUX_CONFIG_ROOT/home/.config/user-dirs.dirs" ~/.config/user-dirs.dirs
  cp --force "$LINUX_CONFIG_ROOT/home/.config/user-dirs.locale" ~/.config/user-dirs.locale

  xdg-user-dirs-update
  xdg-user-dirs-gtk-update
}

bash_setup() {
  # Copies special bash files (ie, ~/.bashrc, ~/.bash_profile).
  cp --force "$LINUX_CONFIG_ROOT/home/.bashrc" ~/.bashrc
  cp --force "$LINUX_CONFIG_ROOT/home/.bash_logout" ~/.bash_logout
  cp --force "$LINUX_CONFIG_ROOT/home/.bash_aliases" ~/.bash_aliases
  cp --force "$LINUX_CONFIG_ROOT/home/.bash_profile" ~/.bash_profile
}

# --------------------------------------------------------------------------

inst_tar() {
  # Installs tar (an archiving utility).
  sudo apt install tar
}

inst_sed() {
  # Installs sed (stream editor for filtering and transforming text).
  sudo apt install sed
}

inst_wget() {
  # Installs wget (the non-interactive network downloader).
  sudo apt install wget
}

inst_grep() {
  # Installs grep (print lines that match patterns).
  sudo apt install grep

}

inst_curl() {
  # Installs curl (transfer a URL).
  sudo apt install curl
}

inst_unzip() {
  # Installs unzip (list, test and extract compressed files in a ZIP archive).
  sudo apt install unzip
}

inst_vim() {
  # Installs vim (Vi IMproved, a programmer's text editor).
  sudo apt install vim
  cp --force "$LINUX_CONFIG_ROOT/home/.vimrc" ~/.vimrc
}

inst_vlc() {
  # Installs vlc (the VLC media player).
  sudo apt install vlc
}

inst_chromium() {
  # Installs Chromium (the web browser from Google).
  sudo apt install chromium
}

inst_keepassxc() {
  # Installs KeepassXC (a modern open-source password manager).
  sudo apt install keepassxc
}

inst_rclone() {
  # Installs rclone (syncs your files to cloud storage).
  # Also runs rclone setup to add a first remote storage.
  # Depends on wget, unzip.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O rclone-current-linux-amd64.zip "https://downloads.rclone.org/rclone-current-linux-amd64.zip"
  unzip rclone-current-linux-amd64.zip

  pushd rclone-*-linux-amd64

  sudo cp rclone /usr/bin/
  sudo chown root:root /usr/bin/rclone
  sudo chmod 755 /usr/bin/rclone

  sudo mkdir -p /usr/local/share/man/man1
  sudo cp rclone.1 /usr/local/share/man/man1/
  sudo mandb

  popd # pushd rclone-*-linux-amd64

  echo "Configurating rclone..."
  echo "Name the remote '$RCLONE_REMOTE_NAME'"

  rclone config

  rclone copy "$RCLONE_REMOTE_NAME:/Music/" "$XDG_MUSIC_DIR"
  rclone copy "$RCLONE_REMOTE_NAME:/Videos/" "$XDG_VIDEOS_DIR"
  rclone copy "$RCLONE_REMOTE_NAME:/Pictures/" "$XDG_PICTURES_DIR"
  rclone copy "$RCLONE_REMOTE_NAME:/Documents/" "$XDG_DOCUMENTS_DIR"
  rclone copy "$RCLONE_REMOTE_NAME:/Templates/ ""$XDG_TEMPLATES_DIR"

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_flatpak() {
  # Installs flatpak (Build, install and run applications and runtimes).
  sudo apt install flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
}

inst_openssh() {
  # Installs openssh-client (secure shell (SSH) client, for secure access to remote machines).
  sudo apt install openssh-client
}

inst_gnupg() {
  # Installs gnupg (the GNU Privacy Guard suite of programs) and generates
  # a GPG key.

  # warning: This removes your entire ~/.gnupg directory.
  rm -rf ~/.gnupg
  sudo apt install gnupg

  # The generated key uses the specified $USER_NAME and $USER_EMAIL and its ID
  # is saved in $USER_GPG_KEY_ID.
  gpg --generate-key --batch <<EOF
    %ask-passphrase
    Key-Type: RSA
    Key-Length: 4096
    Name-Real: $USER_NAME
    Name-Email: $USER_EMAIL
    Name-Comment: $(date)
    Expire-Date: 4w
    %commit
EOF

  USER_GPG_KEY_ID="$(gpg --list-keys --with-colons "$USER_EMAIL" | grep fpr --max-count 1 | sed "s/://g" | sed "s/fpr//g")"
}

inst_git() {
  # Installs git (the stupid content tracker).

  # The base .gitconfig enforces commit and tag signature.

  # Either disable it, or, run inst_gnupg before this so that $USER_GPG_KEY_ID
  # is correctly set.

  sudo apt install git

  cp --force "$LINUX_CONFIG_ROOT/home/.gitconfig" ~/.gitconfig

  git config --global user.email "$USER_EMAIL"
  git config --global user.name "$USER_NAME"

  git config --global --unset gpg.format
  git config --global user.signingkey "$USER_GPG_KEY_ID"
}

inst_github() {
  # Generates a SSH key for GitHub.
  # Depends on openssh-client (ssh-keygen).

  # warning: This removes your entire ~/.ssh directory.
  rm -rf ~/.ssh

  ssh-keygen -t ed25519 -f "$USER_GITHUB_SSH_PRIV_KEY_FILEPATH"

  # Running only this is not enough: you need to add the SSH key to
  # your account. The following line will save the key you need to add
  # into ~/github_ssh_key.
  cp "$USER_GITHUB_SSH_PUB_KEY_FILEPATH" ~/github_ssh_key

  # If you've generated a GPG key, you also need to add it to your GitHub
  # account. The following lines will save the key you need to add into
  # ~/github_gpg_key, if you've generated one.
  if [ -n "$USER_GPG_KEY_ID" ]; then
    gpg --export --armor "$USER_EMAIL" >~/github_gpg_key
  fi
}

inst_python() {
  # Installs Python 3 (an interpreted, interactive, object-oriented programming language)
  # and the pip (A tool for installing and managing Python packages).

  # pipx (Install and execute apps from Python packages) is also installed.
  sudo apt install python3 python3-pip pipx
}

inst_notebook() {
  # Installs Jupyter Notebook (A web-based notebook environment for interactive computing).
  # Depends on pipx.
  pipx install notebook
}

inst_bruno() {
  # Installs Bruno (Open-source IDE for exploring and testing APIs).
  # Depends on wget.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O bruno.deb https://github.com/usebruno/bruno/releases/download/v1.5.1/bruno_1.5.1_amd64_linux.deb

  sudo dpkg -i bruno.deb
  sudo apt install -f

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_gcc() {
  # Installs gcc (GNU project C compiler).
  sudo apt install gcc
}

inst_g++() {
  # Installs g++ (GNU project C++ compiler).
  sudo apt install g++
}

inst_gdb() {
  # Installs gdb (The GNU Debugger).
  sudo apt install gdb
}

inst_cmake() {
  # Installs cmake (build simple and very complicated software systems with a single set of input files).
  sudo apt install cmake
}

inst_mariadb() {
  # Installs mariadb (MariaDB Database System).
  sudo apt install mariadb-server
}

inst_nvm() {
  # Installs nvm (Node Version Manager) in $NVM_DIR.
  # Depends on wget.
  mkdir -p "$NVM_DIR"
  wget -qO- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh" | bash

  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

  nvm install --lts
}

inst_code() {
  # Installs code (Visual Studio Code).
  # Depends on wget.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

  sudo dpkg -i vscode.deb
  sudo apt install -f

  code --install-extension Vue.volar --force
  code --install-extension vscodevim.vim --force
  code --install-extension ms-python.python --force
  code --install-extension Dart-Code.flutter --force
  code --install-extension ms-toolsai.jupyter --force
  code --install-extension alexcvzz.vscode-sqlite --force
  code --install-extension ms-vscode.makefile-tools --force
  code --install-extension foxundermoon.shell-format --force
  code --install-extension bradlc.vscode-tailwindcss --force
  code --install-extension vscode-icons-team.vscode-icons --force
  code --install-extension Vue.vscode-typescript-vue-plugin --force
  code --install-extension ms-vscode.vscode-typescript-next --force
  code --install-extension ms-vscode.cpptools-extension-pack --force

  mkdir -p ~/.config/Code/User/
  cp --force "$LINUX_CONFIG_ROOT/home/.config/Code/User/settings.json" ~/.config/Code/User/settings.json

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_android_studio() {
  # Installs the Android SDK in $ANDROID_SDK_DIR.
  # Installs the Android CLI tools in $ANDROID_CLI_TOOLS_DIR.
  # Installs Android Studio (the official IDE for Android app development) in $ANDROID_STUDIO_DIR.
  # Depends on wget, tar, unzip.
  mkdir -p "$ANDROID_SDK_DIR"

  sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 # prerequisites

  pushd "$XDG_DOWNLOAD_DIR"

  wget -O android-studio.tar.gz "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.26/android-studio-2023.1.1.26-linux.tar.gz"
  tar xf android-studio.tar.gz
  mv android-studio/* "$ANDROID_STUDIO_DIR"

  echo "Configurating the Android SDK..."
  echo "Select a custom installation"
  echo "Don't edit the list of components to install"
  echo "Install in $ANDROID_SDK_DIR"
  echo "Once the installation is done, close Android Studio..."

  chmod +x "$ANDROID_STUDIO_DIR/bin/studio.sh"
  "$ANDROID_STUDIO_DIR/bin/studio.sh" >/dev/null 2>&1

  wget -O android-studio-cli-tools.zip "https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip"
  unzip android-studio-cli-tools.zip

  mv cmdline-tools "$ANDROID_SDK_DIR"

  mkdir -p "$ANDROID_CLI_TOOLS_DIR/latest/"
  mv "$ANDROID_CLI_TOOLS_DIR/bin/" "$ANDROID_CLI_TOOLS_DIR/latest/"
  mv "$ANDROID_CLI_TOOLS_DIR/lib/" "$ANDROID_CLI_TOOLS_DIR/latest/"
  mv "$ANDROID_CLI_TOOLS_DIR/NOTICE.txt" "$ANDROID_CLI_TOOLS_DIR/latest/"
  mv "$ANDROID_CLI_TOOLS_DIR/source.properties" "$ANDROID_CLI_TOOLS_DIR/latest/"

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_flutter_sdk() {
  # Installs the Flutter SDK (Build apps for any screen) in $FLUTTER_DIR.

  # The Flutter SDK alone can't do much,
  # you need to install the Android SDK which comes bundled with Android Studio.
  # Either run inst_flutter or run inst_android_studio and configure Flutter yourself.

  # Depends on wget, tar.
  pushd "$XDG_DOWNLOAD_DIR"

  sudo apt install clang ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev # prerequisites

  wget -O flutter.tar.xz "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.3-stable.tar.xz"
  tar xf flutter.tar.xz
  mv flutter "$FLUTTER_DIR"

  rm flutter.tar.xz

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_flutter() {
  # Installs the Android SDK (through Android Studio) and the Flutter SDK.
  # Configures Flutter.

  # Depends on chromium.
  inst_android_studio
  inst_flutter_sdk

  export PATH="$PATH:$FLUTTER_DIR/bin"         # done also in .bashrc
  export CHROME_EXECUTABLE="/usr/bin/chromium" # done also in .bashrc

  flutter config --no-analytics
  flutter doctor --android-licenses
  flutter config --android-sdk="$ANDROID_SDK_DIR"
  flutter config --android-studio-dir="$ANDROID_STUDIO_DIR"

  # Now, you may run flutter doctor --verbose and it should succeed.
}

inst_cutentr() {
  # Installs CuteNTR (a cross platform debugger and streaming client for NTR CFW for 3DS).
  # Depends on wget, flatpak.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O cutentr.flatpak https://gitlab.com/BoltsJ/cuteNTR/uploads/da6b5bafbab68b45cc9bee0ae590a3ca/com.gitlab.BoltsJ.cuteNTR.flatpak
  flatpak install ./cutentr.flatpak

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_discord() {
  # Installs Discord (social media for chronically online people).
  # Depends on wget.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O discord.deb "https://discord.com/api/download?platform=linux&format=deb"

  sudo dpkg -i discord.deb
  sudo apt install -f

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_steam() {
  # Installs Steam (the ultimate online game platform).
  # Depends on wget.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O steam.deb https://cdn.akamai.steamstatic.com/client/installer/steam.deb

  sudo dpkg -i steam.deb
  sudo apt install -f

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_java() {
  # Installs java (launch a Java application).
  sudo apt install java-common
}

inst_wine() {
  # Installs wine (run Windows programs on Unix).
  # Depends on wget.
  sudo dpkg --add-architecture i386

  sudo mkdir -pm755 "/etc/apt/keyrings"
  sudo wget -O "/etc/apt/keyrings/winehq-archive.key" "https://dl.winehq.org/wine-builds/winehq.key"
  sudo wget -NP "/etc/apt/sources.list.d/" "https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources"

  sudo apt update
  sudo apt install --install-recommends winehq-stable

  WINEPREFIX="$HOME/.wine" wineboot --update # prompts you to install Wine Mono
}

inst_minecraft() {
  # Installs Minecraft (stupid block game written in Java).
  # Downloads the Fabric Loader installer.
  # Depends on wget, java-common.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O minecraft.deb https://launcher.mojang.com/download/Minecraft.deb
  wget -O "$XDG_DOWNLOAD_DIR/fabric-loader.jar" https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.11.2/fabric-installer-0.11.2.jar

  # The Fabric Loader installer can be ran with java -jar fabric-loader.jar.

  sudo dpkg -i minecraft.deb
  sudo apt install -f

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_obs() {
  # Installs OBS Studio (efficient recording and streaming of live video content).
  sudo apt install obs-studio
}

inst_citra() {
  # Installs citra (Nintendo 3DS emulator) by running the Citra setup executable.
  # Depends on wget.
  pushd "$XDG_DOWNLOAD_DIR"

  wget -O citra https://github.com/citra-emu/citra-web/releases/download/2.0/citra-setup-linux
  chmod +x citra

  echo "Configurating Citra..."
  echo "Install Citra (Citra Nightly) in $CITRA_DIR"

  ./citra >/dev/null 2>&1

  popd # pushd "$XDG_DOWNLOAD_DIR"
}

inst_ds4drv() {
  # Installs ds4drv (Sony DualShock 4 userspace driver for Linux).
  # Depends on pipx.
  pipx install ds4drv
}

preset_full
