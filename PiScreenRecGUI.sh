RESOLUTION=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
RECOFF=''
if [ "$1" = extra ]
then
  RESOLUTION=$(zenity --entry --title "PiScreenRec" --width 400 --text "XT: Enter the resolution (like this 720x720):")
  RECOFFY=$(zenity --entry --title "PiScreenRec" --width 400 --text "XT: Enter the Y offset (enter 0 for no offset):")
  RECOFFX=$(zenity --entry --title "PiScreenRec" --width 400 --text "XT: Enter the X offset (enter 0 for no offset):")
  RECOFF=+$RECOFFX,$RECOFFY
fi
zenity --question --title "Use sound" --text "Use sound?"
SOUND=$?
if [ "$SOUND" = 0 ]
then
  SOUNDDEV=$(zenity --entry --width 500 --title "What sound device to use" --text "Enter what sound device number to use?\nList of devices:\n$(arecord -l | grep card)")
fi
RECFPS=$(zenity --scale --title "Select FPS - PiScreenRec" --text "What FPS to record at (the fps may vary depending on your pc):" --min-value=1 --max-value=144 --value=1 --step=1)
RECFULLNAME=$(zenity --file-selection --title "Where to save - PiScreenRec" --save --confirm-overwrite)
if [ "$1" = extra ]
then
  zenity --question --title "PiScreenRec" --width 300 --text "are these settings right?\nResolution = $RESOLUTION\n Offset = $RECOFF\nFPS = $RECFPS\nPath to save = $RECFULLNAME\n(stop the recording using q)"
else
  zenity --question --title "PiScreenRec" --width 300 --text "are these settings right?\nFPS = $RECFPS\nPath to save = $RECFULLNAME\n(stop the recording using q)"
fi
PROCEED=$?
if [ "$PROCEED" = 0 ]
then
  if [ $SOUND = 0 ]
  then
    ffmpeg -f alsa -ac 1 -i hw:$SOUNDDEV -f x11grab -video_size $RESOLUTION -framerate $RECFPS -i :0.0$RECOFF $RECFULLNAME
  else
    ffmpeg -video_size $RESOLUTION -framerate $RECFPS -f x11grab -i :0.0$RECOFF $RECFULLNAME
  fi
  zenity --info --title "PiScreenRec" --width 250 --text "Recording finished!"
  zenity --info --title "PiScreenRec" --width 250 --text "Recording was saved at $RECFULLNAME"
fi
