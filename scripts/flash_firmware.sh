#!/usr/bin/env bash
# Flash the Edge Impulse firmware onto the TI LAUNCHXL-CC1352P1.
#
# 1. Download either
#      - the default Edge Impulse firmware for the CC1352P (data collection), or
#      - the binary built from your project's Deployment tab (trained model)
#    and unzip it next to this script.
# 2. Run this script; it calls the OS-specific flasher shipped in the zip
#    (requires TI UniFlash / DSLite, bundled by Edge Impulse).
set -euo pipefail
cd "$(dirname "$0")"

case "$(uname -s)" in
  Darwin) ./flash_mac.command ;;
  Linux)  ./flash_linux.sh ;;
  *)      echo "On Windows run flash_windows.bat" ; exit 1 ;;
esac

echo "Done. Now run:  edge-impulse-daemon --clean   (data collection)"
echo "           or:  edge-impulse-run-impulse      (on-device inference)"
