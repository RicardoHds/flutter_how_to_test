#!/usr/bin/env bash
echo $ANDROID_HOME
# Install AVD files
echo "y" | $ANDROID_HOME/tools/bin/sdkmanager --install 'system-images;android-27;google_apis;x86'
# Create emulator
echo "no" | $ANDROID_HOME/tools/bin/avdmanager create avd -n devsecops_android_emulator -k 'system-images;android-27;google_apis;x86' --force
$ANDROID_HOME/emulator/emulator -list-avds
echo "Starting emulator"
# Start emulator in background
nohup $ANDROID_HOME/emulator/emulator -avd devsecops_android_emulator -no-snapshot > /dev/null 2>&1 &
$ANDROID_HOME/platform-tools/adb wait-for-device shell 'while [[ -z $(getprop sys.boot_completed | tr -d '\r') ]]; do sleep 1; done; input keyevent 82'
$ANDROID_HOME/platform-tools/adb devices
echo "Emulator started"