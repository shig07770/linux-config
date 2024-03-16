# Install prerequisites
if [[ -n $LC_INSTALL ]]; then
  cd "$LC_INSTALL"
  source git.sh
else
  echo "Variable LC_INSTALL is not set. Exiting..."
  exit 1
fi

# Create some directory
if [[ -n $LC_SCRCPY_INSTALLATION_DIR ]]; then
  mkdir -p "$LC_SCRCPY_INSTALLATION_DIR"
else
  echo "Variable LC_SCRCPY_INSTALLATION_DIR is not set. Exiting..."
  exit 1
fi

# Install dependencies
sudo apt install ffmpeg libsdl2-2.0-0 adb wget \
  gcc git pkg-config meson ninja-build libsdl2-dev \
  libavcodec-dev libavdevice-dev libavformat-dev libavutil-dev \
  libswresample-dev libusb-1.0-0 libusb-1.0-0-dev

# Clone the scrcpy repo
cd "$LC_SCRCPY_INSTALLATION_DIR"
git clone https://github.com/Genymobile/scrcpy . --depth=1
./install_release.sh
