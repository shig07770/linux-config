# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source tar.sh
  source wget.sh
  source unzip.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

# Create a bunch of directories
if [[ -n $LC_ANDROID_STUDIO_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_ANDROID_STUDIO_INSTALLATION_DIR"
else
  echo "Variable LC_ANDROID_STUDIO_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

if [[ -n $LC_ANDROID_SDK_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_ANDROID_SDK_INSTALLATION_DIR"
else
  echo "Variable LC_ANDROID_SDK_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

if [[ -n $LC_ANDROID_STUDIO_CLI_TOOLS_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_ANDROID_STUDIO_CLI_TOOLS_INSTALLATION_DIR"
else
  echo "Variable LC_ANDROID_STUDIO_CLI_TOOLS_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

# Go into a temporary directory
ts="$(date +%s)"
mkdir -p "/tmp/$ts" && cd "/tmp/$ts"

# I try to install some required librairies (https://developer.android.com/studio/install#64bit-libs)
# Some of these librairies are not found but I don't want to change that command in case it might break
# something with Android Studio. So I simply disable the "exit on error" flag just for this one.
set +e
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
set -e

# Download and extract Android Studio
wget -O studio.tar.gz "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.28/android-studio-2023.1.1.28-linux.tar.gz"
tar xf studio.tar.gz --strip=1 -C "$LC_ANDROID_STUDIO_INSTALLATION_DIR"

# Run Android Studio
cd "$LC_ANDROID_STUDIO_INSTALLATION_DIR"

chmod +x "bin/studio.sh"

echo "Install the Android SDK at $LC_ANDROID_SDK_INSTALLATION_DIR"
bin/studio.sh >/dev/null 2>&1

# For some reason, Android Studio will not install the command line tools directly so I have to do it myself
# or else Flutter whines about it.
wget -O cli.zip "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
unzip cli.zip -d "$LC_ANDROID_STUDIO_CLI_TOOLS_INSTALLATION_DIR"

cd "$LC_ANDROID_STUDIO_CLI_TOOLS_INSTALLATION_DIR"
mv cmdline-tools/* .
rmdir cmdline-tools
