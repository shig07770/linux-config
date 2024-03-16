# This should be a default, smh
set -e

# Load configuration variables
cd "$(dirname $0)"
source config.sh

# Run preset
source preset/dev.sh
