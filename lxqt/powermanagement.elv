mkdir -p ~/.config/lxqt/

echo '[General]
__userfile__=true
backlightIdleness=15
backlightIdlenessOnBatteryDischarging=true
enableBatteryWatcher=true
enableExtMonLidClosedActions=false
enableIdlenessBacklightWatcher=true
enableIdlenessWatcher=true
enableLidWatcher=true
idlenessAction=4
idlenessTime=@Variant(\0\0\0\xf\0\r\xbb\xa0)
idlenessTimeSecs=3600
lidClosedAcAction=-2
lidClosedAction=4
lidClosedExtMonAcAction=-1
lidClosedExtMonAction=-1
powerLowAction=4
powerLowLevel=5
powerLowWarning=30
runCheckLevel=1
showIcon=true
useThemeIcons=true' > ~/.config/lxqt/lxqt-powermanagement.conf