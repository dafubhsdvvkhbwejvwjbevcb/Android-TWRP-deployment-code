@echo off
echo hello! this is a file designed to be used with the following devices:
echo ======================================================================
echo          * Moto G(9) play
echo ======================================================================
echo if you wish to proceed, press enter
pause
cd C:\Users\LucaMachado\Downloads\platform-tools
adb devices
pause
fastboot devices
pause
echo step done. If your device is shown in any of the lists above, please proceed by pressing enter
pause
adb reboot bootloader
fastboot flash recovery twrp.img
echo step done. To proceed, press enter
echo now up to this point the process can be automated
set /p opcao=would you like to go with manual mode(1), auto mode(2) or none(3)? 
goto opcao%opcao%

:opcao1
echo You chose 'manual'
pause
fastboot reboot recovery
echo  now, you will be redirected to the twrp main screen. Click install, then choose 'Micro SD' inside the 'storage' category and then choose the following
echo  §
echo  -boot.img
echo  -dtbo.img
echo  -vbmeta.img
echo  -recovery.img (not recommended if pretending to change the rom later)
pause
goto fim

:opcao2
echo You chose 'auto'
goto fim

:opcao3
echo You chose none of the above
pause
set /p way=Thank you for using this tool. Would you like to rate this tool on GitHub? (1-yes, 2-no) 
goto way%way% 

:fim
echo now its up to you
pause
exit

:way1
start https://google.com

:way2
goto fim
