cd "$(dirname $0)"
source ../dirs.sh

bash ../util/sed.sh
bash ../util/gnupg.sh

sudo apt install git

read -p "Enter your git name: " git_name
read -p "Enter your git email: " git_email

echo "The following name will be used for git: $git_name"
echo "The following email will be used for git: $git_email"

read -p "Is that correct? (yes/no) " confirm

if ["$confirm" != "yes"]; then
  echo "Received '$confirm' not 'yes', aborting."
  exit 1
fi

ssh_priv_key_filepath="$HOME/.ssh/git_$git_name"
ssh_pub_key_filepath="$ssh_priv_key_filepath.pub"

ssh-keygen -t ed25519 -f "$ssh_priv_key_filepath"

gpg --generate-key --batch <<EOF
    %ask-passphrase
    Key-Type: RSA
    Key-Length: 4096
    Name-Real: $git_name
    Name-Email: $git_email
    Name-Comment: $(date)
    Expire-Date: 4w
    %commit
EOF

gpg_key=$(gpg --export --armor "$git_email")
gpg_key_id=$(gpg --list-keys --with-colons "$git_email" | grep fpr --max-count 1 | sed "s/://g" | sed "s/fpr//g")

echo "$gpg_key" >"$HOME/gpg_key"
cp "$ssh_pub_key_filepath" "$HOME/ssh_key"

git config --global user.name "$git_name"
git config --global user.email "$git_email"

git config --global --unset gpg.format

git config --global user.signingKey "$gpg_key_id"
