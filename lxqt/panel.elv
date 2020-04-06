mkdir -p ~/.config/lxqt/
echo '[General]
__userfile__=true
iconTheme=

[mainmenu]
alignment=Left
customFont=false
filterClear=true
showText=true
type=mainmenu

[mount]
alignment=Right
type=mount

[panel1]
alignment=-1
animation-duration=0
background-color=@Variant(\0\0\0\x43\0\xff\xff\0\0\0\0\0\0\0\0)
background-image=
desktop=0
font-color=@Variant(\0\0\0\x43\0\xff\xff\0\0\0\0\0\0\0\0)
hidable=false
iconSize=22
lineCount=1
lockPanel=false
opacity=100
panelSize=32
plugins=mainmenu, spacer, quicklaunch, spacer3, taskbar, spacer2, tray, statusnotifier, mount, volume, worldclock, showdesktop
position=Top
reserve-space=true
show-delay=0
visible-margin=true
width=100
width-percent=true

[quicklaunch]
alignment=Left
apps\1\desktop=/usr/share/applications/pcmanfm-qt.desktop
apps\2\desktop=/usr/share/applications/firefox.desktop
apps\3\desktop=/usr/share/applications/Alacritty.desktop
apps\size=3
type=quicklaunch

[showdesktop]
alignment=Right
type=showdesktop

[spacer]
alignment=Left
spaceType=dotted
type=spacer

[spacer2]
alignment=Left
expandable=false
size=8
spaceType=dotted
type=spacer

[spacer3]
alignment=Left
spaceType=dotted
type=spacer

[statusnotifier]
alignment=Right
type=statusnotifier

[taskbar]
alignment=Left
type=taskbar

[tray]
alignment=Right
type=tray

[volume]
alignment=Right
type=volume

[worldclock]
alignment=Right
autoRotate=true
customFormat="''<b>''HH:mm:ss''</b><br/><font size=\"-2\">''ddd, d MMM yyyy''<br/>''TT''</font>''"
dateFormatType=iso
dateLongNames=false
datePadDay=false
datePosition=below
dateShowDoW=false
dateShowYear=false
defaultTimeZone=
formatType=custom-timeonly
showDate=false
showTimezone=false
timeAMPM=true
timePadHour=true
timeShowSeconds=false
timeZones\size=0
timezoneFormatType=iana
timezonePosition=below
type=worldclock
useAdvancedManualFormat=false' > ~/.config/lxqt/panel.conf