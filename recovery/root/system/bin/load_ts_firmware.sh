#!/system/bin/sh

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=
device=$(getprop ro.boot.device)

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}
insmod /vendor/lib/modules/1.1/ilitek_0flash_mmi.ko
cd $firmware_path
touch_product_string=$(ls $touch_class_path)
if [[ -d /sys/class/touchscreen/ilitek ]]; then
       echo "ilitek"
       firmware_file="ilitek_fw.bin"
       flash_path=/sys/class/touchscreen/ilitek/ioctl
       echo $firmware_file > $flash_path
elif [[ -d /sys/class/touchscreen/ft8006s_aa ]]; then
        echo "focaltech"
       firmware_file="focaltech-dsbj-ft8006s_aa-05-0000-cebu.bin"
       touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
       wait_for_poweron
       echo $firmware_file > $touch_path/doreflash
       echo 1 > $touch_path/forcereflash
       sleep 5
       echo 1 > $touch_path/reset
fi

return 0
