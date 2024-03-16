if [[ -z $LC_RCLONE_REMOTE_NAME ]]; then
  echo "Variable LC_RCLONE_REMOTE_NAME is not set. Exiting..."
  exit 1
fi

echo "Name the remote '$LC_RCLONE_REMOTE_NAME'"
rclone config

rclone copy "$LC_RCLONE_REMOTE_NAME:/Music" ~/Music
rclone copy "$LC_RCLONE_REMOTE_NAME:/Videos" ~/Videos
rclone copy "$LC_RCLONE_REMOTE_NAME:/Public" ~/Public
rclone copy "$LC_RCLONE_REMOTE_NAME:/Pictures" ~/Pictures
rclone copy "$LC_RCLONE_REMOTE_NAME:/Documents" ~/Documents
rclone copy "$LC_RCLONE_REMOTE_NAME:/Templates" ~/Templates
