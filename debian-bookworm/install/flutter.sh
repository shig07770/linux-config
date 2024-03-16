# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"

  source wget.sh
  source chromium.sh

  # Flutter requirements (https://docs.flutter.dev/get-started/install/linux)
  source git.sh
  source zip.sh
  source curl.sh
  source file.sh
  source cmake.sh
  source unzip.sh
  source which.sh
  source xz-utils.sh
  source android_studio.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

# Go into a temporary directory
ts="$(date +%s)"
mkdir -p "/tmp/$ts" && cd "/tmp/$ts"

# Create some directory
if [[ -n $LC_FLUTTER_SDK_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_FLUTTER_SDK_INSTALLATION_DIR"
else
  echo "Variable LC_FLUTTER_SDK_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

# All of the things needed for Flutter that I haven't made in a separate .sh file because I don't use them outside of Flutter.
sudo apt install clang ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev libglu1-mesa

# Download and extract Flutter SDK
wget -O flutter.tar.xz "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.9-stable.tar.xz"
tar xf flutter.tar.xz --strip=1 -C "$LC_FLUTTER_SDK_INSTALLATION_DIR"

# Configure Flutter
cd "$LC_FLUTTER_SDK_INSTALLATION_DIR"

bin/flutter config --android-studio-dir "$LC_ANDROID_STUDIO_INSTALLATION_DIR"
bin/flutter config --android-sdk "$LC_ANDROID_SDK_INSTALLATION_DIR"
bin/flutter doctor --android-licenses
bin/flutter config --no-analytics

bin/flutter upgrade --force
bin/flutter doctor --verbose
