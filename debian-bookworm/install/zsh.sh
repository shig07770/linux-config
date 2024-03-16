# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source git.sh
  source curl.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_OH_MY_ZSH_INSTALLATION_DIR ]]; then
  echo "Variable LC_OH_MY_ZSH_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

sudo apt install zsh fonts-powerline

rm -f ~/.bashrc ~/.profile ~/.bash_profile ~/.bash_logout ~/.bash_history

RUNZSH="no" KEEP_ZSHRC="yes" ZSH="$LC_OH_MY_ZSH_INSTALLATION_DIR" bash -c 'curl -fsSL "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh" | sh'
