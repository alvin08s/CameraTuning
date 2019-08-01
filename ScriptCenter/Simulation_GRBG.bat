:: #########################################################################
:: # File Name: simulation.sh
:: # Author: Alvin
:: # mail: shiyunfeng@huaqin.com
:: # Created Time: Tue 20 Jun 2017 03:46:02 PM CST
:: #########################################################################

REM TCP Connections
adb wait-for-device
adb root
adb wait-for-device
adb remount

adb shell setprop persist.camera.mobicat 2
adb shell setprop persist.camera.global.debug 1
adb shell setprop persist.camera.stats.debug 4294901760
adb shell setprop persist.camera.stats.debugexif 4294901760

adb shell setprop persist.camera.raw_yuv 1
adb shell setprop persist.camera.zsl_raw 1
adb shell chmod 777 /data/

::10Bits : GBRG -- 28,GRBG -- 29,RGGB -- 30,BGGR -- 31
adb shell setprop persist.camera.raw.format 29

:: Dump jgp,raw,yuv , 00110000B = 0x30 = 48
adb shell setprop persist.camera.dumpimg 48

adb shell setprop persist.camera.dumpmetadata 1

adb shell sync
adb shell sync
adb shell sync

pause