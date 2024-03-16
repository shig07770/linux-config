# Do not edit.
export LC_ROOT="$(realpath ..)"
export LC_HOSTNAME="$(uname -n)"
export LC_OS_USER_NAME="$(whoami)"
export LC_MAIN="$(realpath main.sh)"
export LC_SETUP="$(realpath setup/)"
export LC_INSTALL="$(realpath install/)"

# This can be edited.
export LC_USE_BASH="no" # set to yes to you plan to keep using bash, otherwise, it will be assumed zsh is used

export LC_FLUTTER_SDK_INSTALLATION_DIR="" # ie HOME/Applications/flutter
export LC_ANDROID_SDK_INSTALLATION_DIR="" # ie $HOME/Applications/android-sdk
export LC_ANDROID_STUDIO_INSTALLATION_DIR="" # ie $HOME/Applications/android-studio
export LC_ANDROID_STUDIO_CLI_TOOLS_INSTALLATION_DIR="$LC_ANDROID_SDK_INSTALLATION_DIR/cmdline-tools/latest" # don't change unless you know how to make Android Studio find its location

export LC_RCLONE_REMOTE_NAME="" # ie rmt

export LC_USER_NAME="" # ie shig07770
export LC_USER_EMAIL="" # ie shig07770+dev@gmail.com

export LC_GITHUB_GPG_KEY_PASSPHRASE="" # ie foobar123+
export LC_GITHUB_SSH_KEY_PASSPHRASE="" # ie foobar123+
export LC_GITHUB_SSH_KEY_FILE="" # ie $HOME/.ssh/github

export LC_BUN_INSTALLATION_DIR="" # ie $HOME/Applications/bun
export LC_NVM_INSTALLATION_DIR="" # ie $HOME/Applications/nvm
export LC_SCRCPY_INSTALLATION_DIR="" # ie $HOME/Applications/scrcpy
export LC_OH_MY_ZSH_INSTALLATION_DIR="" # ie $HOME/Applications/oh-my-zsh

