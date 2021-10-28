#!/system/bin/sh

module_path=/vendor/lib/modules

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

# Load all needed modules
insmod $module_path/sensors_class.ko
insmod $module_path/fpc1020_mmi.ko
insmod $module_path/utags.ko
insmod $module_path/exfat.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_info.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/qpnp-power-on-mmi.ko
insmod $module_path/qpnp_adaptive_charge.ko
insmod $module_path/ilitek_0flash_mmi.ko
insmod $module_path/nova_0flash_mmi.ko
insmod $module_path/chipone_tddi_mmi.ko
insmod $module_path/leds_aw99703.ko
insmod $module_path/ktd3136_bl.ko

cd $firmware_path
touch_product_string=$(ls $touch_class_path)
firmware_file="ilitek_fw.bin"

touch_path=/proc/ilitek/fw_upgrade
echo $firmware_file > $touch_path
sleep 5
echo "weeb says your firmware file is now wow"
echo -1 /proc/ilitek/debug_level

return 0

