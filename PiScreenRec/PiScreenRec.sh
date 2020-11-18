RESOLUTION=$(xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/')
RECOFF=''
if [ "$1" = extra ]
then
  echo XT: Enter the resolution '(like this 720x720)':
  read RESOLUTION
  echo XT: Enter the y offset '(enter 0 for no offset)':
  read RECOFFY
  echo XT: Enter the x offset '(enter 0 for no offset)'
  read RECOFFX
  RECOFF=+$RECOFFX,$RECOFFY
fi
echo Current resolution= $RESOLUTION
echo What FPS to record at '(the fps may vary depending on your pc)':
read RECFPS
echo Enter the path to save '(with a slash on the end)': 
read RECPATH
echo Enter the name of the file '(without the extension)':
read RECNAME
RECFULLNAME=$RECPATH$RECNAME.avi
ffmpeg -video_size $RESOLUTION -framerate $RECFPS -f x11grab -i :0.0$RECOFF $RECFULLNAME
echo Recording finished!
echo Your recording was saved at $RECPATH
echo With the name $RECNAME
echo '(Press enter to quit)'
read NULL
