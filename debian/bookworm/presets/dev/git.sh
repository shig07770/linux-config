# debian/bookworm/presets/dev/git.sh - Git installation for Debian 12 (Bookworm)

cd "$(dirname $0)/../.."
source vars.sh

bash presets/dotfile.sh

bash dev/git.sh
bash dev/vim.sh

bash util/sed.sh
bash util/grep.sh
bash util/gnupg.sh

SSH_PRIV_KEY_FILEPATH="$HOME/.ssh/git_$GIT_NAME"
SSH_PUB_KEY_FILEPATH="$SSH_PRIV_KEY_FILEPATH.pub"

ssh-keygen -t ed25519 -f "$SSH_PRIV_KEY_FILEPATH"

gpg --generate-key --batch <<EOF
    %ask-passphrase
    Key-Type: RSA
    Key-Length: 4096
    Name-Real: $GIT_NAME
    Name-Email: $GIT_EMAIL
    Name-Comment: $(date)
    Expire-Date: 4w
    %commit
EOF

GPG_KEY=$(gpg --export --armor "$GIT_EMAIL")
GPG_KEY_ID=$(gpg --list-keys --with-colons "$GIT_EMAIL" | grep fpr --max-count 1 | sed "s/://g" | sed "s/fpr//g")

echo "$GPG_KEY" >"$HOME/GPG_KEY"
cp "$SSH_PUB_KEY_FILEPATH" "$HOME/ssh_key"

git config --global --unset gpg.format
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global user.signingKey "$GPG_KEY_ID"
