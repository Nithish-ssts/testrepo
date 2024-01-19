
adb_output=$(adb devices)

# Check if any devices are connected
if [[ $adb_output == *device* ]]; then
    echo "Connected devices:"
    # Print the connected devices
    echo "$adb_output" | awk '$2=="device"{print $1}'
    apk_path="/home/radmin/Downloads/zomat0(1).apk"
    # Install APK on all connected devices
    while read -r device; do
        echo "Installing APK on device $device"
        adb -s $device install -r $apk_path

        # Check the result of the installation
        if [ $? -eq 0 ]; then
            echo "Installation successful on device $device"
        else
            echo "Installation failed on device $device"
        fi
    done <<< "$(echo "$adb_output" | awk '$2=="device"{print $1}')"

else
    echo "No device is connected to the PC."
fi
