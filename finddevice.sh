
adb_output=$(adb devices)

# Check if any devices are connected
if [[ $adb_output == *device* ]]; then
    echo "Connected devices:"
    # Print the connected devices
    echo "$adb_output" | awk '$2=="device"{print $1}'
else
    echo "No device is connected to the PC."
fi
