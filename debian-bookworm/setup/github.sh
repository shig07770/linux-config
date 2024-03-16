# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source git.sh
  source grep.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

# Check for a bunch of variables
if [[ -z $LC_ROOT ]]; then
  echo "Variable LC_ROOT is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_HOSTNAME ]]; then
  echo "Variable LC_HOSTNAME is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_USER_NAME ]]; then
  echo "Variable LC_USER_NAME is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_USER_EMAIL ]]; then
  echo "Variable LC_USER_EMAIL is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_OS_USER_NAME ]]; then
  echo "Variable LC_OS_USER_NAME is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_GITHUB_GPG_KEY_PASSPHRASE ]]; then
  echo "Variable LC_GITHUB_GPG_KEY_PASSPHRASE is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_GITHUB_SSH_KEY_PASSPHRASE ]]; then
  echo "Variable LC_GITHUB_SSH_KEY_PASSPHRASE is not set. Exiting..."
  exit 1
fi

if [[ -z $LC_GITHUB_SSH_KEY_FILE ]]; then
  echo "Variable LC_GITHUB_SSH_KEY_FILE is not set. Exiting..."
  exit 1
fi

# Copy our .gitconfig
cp "$LC_ROOT/.gitconfig" "$HOME/.gitconfig" --force

# Go into a temporary directory
ts="$(date +%s)"
mkdir -p "/tmp/$ts" && cd "/tmp/$ts"

# Generate a SSH key for GitHub access
ssh-keygen -t ed25519 -f "$LC_GITHUB_SSH_KEY_FILE" -N "$LC_GITHUB_SSH_KEY_PASSPHRASE"

# Generate a GPG key to sign git commits
cat >gpg_key <<EOF
  Key-Type: RSA
  Expire-Date: 4w
  Key-Length: 4096
  Name-Real: $LC_USER_NAME
  Name-Email: $LC_USER_EMAIL
  Passphrase: $LC_GITHUB_GPG_KEY_PASSPHRASE
  Name-Comment: $LC_OS_USER_NAME@$LC_HOSTNAME, timestamp: $(date +%s)
  %commit
  %echo done
EOF

gpg --generate-key --batch gpg_key

# Set the GPG key ID + other infos for git
git config --global user.name "$LC_USER_NAME"
git config --global user.email "$LC_USER_EMAIL"
git config --global user.signingkey "$(gpg --list-keys --with-colons "$LC_USER_EMAIL" | grep '^fpr:*.*:*' | tr -d ':' | tr -d 'fpr')"
