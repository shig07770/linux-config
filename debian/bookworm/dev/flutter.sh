cd "$(dirname $0)"
source ../dirs.sh

bash ../util/tar.sh
bash ../util/wget.sh
bash ../util/unzip.sh
bash ../util/chromium.sh

pushd "$DEV_DIR"

FLUTTER_DIR="$DEV_DIR/.flutter"
FLUTTER_BIN_DIR="$FLUTTER_DIR/bin"

ANDROID_DIR="$DEV_DIR/.android"
ANDROID_SDK_DIR="$ANDROID_DIR/sdk"

ANDROID_STUDIO_DIR="$DEV_DIR/.android/studio"
ANDROID_CLI_TOOLS_DIR="$ANDROID_SDK_DIR/cmdline-tools/"

mkdir -p "$ANDROID_DIR" "$ANDROID_SDK_DIR"

# Android Studio prerequisites (https://developer.android.com/studio/install#64bit-libs)
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

# Android Studio (https://developer.android.com/studio/install#linux)
wget -O android-studio.tar.xz "https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2023.1.1.26/android-studio-2023.1.1.26-linux.tar.gz"
tar xf android-studio.tar.xz
mv android-studio "$ANDROID_STUDIO_DIR"

echo "Configurating the Android SDK..."
echo "Select a custom installation"
echo "Don't edit the list of components to install"
echo "Install in $ANDROID_SDK_DIR"
echo "Once the installation is done, close Android Studio..."

chmod +x "$ANDROID_STUDIO_DIR/bin/studio.sh"
"$ANDROID_STUDIO_DIR/bin/studio.sh" >/dev/null 2>&1

# Android Studio CLI tools (https://developer.android.com/tools/sdkmanager)
wget -O "$ANDROID_SDK_DIR/android-studio-cli-tools.zip" "https://dl.google.com/android/repository/commandlinetools-linux-10406996_latest.zip"
unzip "$ANDROID_SDK_DIR/android-studio-cli-tools.zip"

mv "cmdline-tools" "$ANDROID_SDK_DIR"

mkdir -p "$ANDROID_CLI_TOOLS_DIR/latest/"
mv "$ANDROID_CLI_TOOLS_DIR/bin/" "$ANDROID_CLI_TOOLS_DIR/latest/"
mv "$ANDROID_CLI_TOOLS_DIR/lib/" "$ANDROID_CLI_TOOLS_DIR/latest/"
mv "$ANDROID_CLI_TOOLS_DIR/NOTICE.txt" "$ANDROID_CLI_TOOLS_DIR/latest/"
mv "$ANDROID_CLI_TOOLS_DIR/source.properties" "$ANDROID_CLI_TOOLS_DIR/latest/"

"$ANDROID_CLI_TOOLS_DIR/latest/bin/sdkmanager" --install "cmdline-tools;latest"

# Flutter prerequisites (https://docs.flutter.dev/get-started/install/linux#linux-prerequisites)
sudo apt install clang ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev

# Flutter SDK (https://docs.flutter.dev/get-started/install/linux#method-2-manual-installation)
wget -O flutter.tar.xz "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.16.3-stable.tar.xz"
tar xf flutter.tar.xz
mv flutter "$FLUTTER_DIR"

# ~/.cfg/.flutter takes care of adding Flutter to the PATH and setting the CHROME_EXECUTABLE variable.

flutter config --no-analytics
flutter doctor --android-licenses
flutter config --android-sdk="$ANDROID_SDK_DIR"
flutter config --android-studio-dir="$ANDROID_STUDIO_DIR"

flutter doctor --verbose

# Cleaning up
rm android-studio.tar.xz flutter.tar.xz "$ANDROID_SDK_DIR/android-studio-cli-tools.zip"

popd
