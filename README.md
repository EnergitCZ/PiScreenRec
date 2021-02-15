# PiScreenRec

# !! This project is no longer maintained due to OBS working on the pi !!

## What is PiScreenRec
PiScreenRec is an opensource screen recorder written in Python and Linux Shell Script

It's using ffmpeg for recording

The version with no gui is **PiScreenRec**

The script gui version is **PiScreenRecGUI**

And finally the python gui version is **PiScreenRecGUIpython**


## How to install PiScreenRec
For the script versions wich are **PiScreenRec** and **PiScreenRecGUI** just download them

But for the python version download the **PiScreenRecGUIpython.sh** file, and type in the folder that you downloaded it `sh PiScreenRecGUIpython.sh`


## How to start PiScreenRec
For the no gui version it is `sh PiScreenRec.sh`

For the script gui version it is `sh PiScreenRecGUI.sh`

And for the python gui version it is `sh start.sh`

Also both script versions have an extra option wich you can select with `sh PiScreenRec.sh extra`


## How to use PiScreenRec
###### For both script versions version:

0.5: (Only for script gui version) select if you want to use the webcam sound)

1: Write the fps you want to record at

2: Select or write the path to record to (in the script gui version you select the file too)

3: Write the name of the file (in script gui version i recommend using .avi)

4: Record what you want to

5: End the recording with pressing 'q' in the console

###### For python gui version:

1: Click use sound if you want to use the webcam sound

2: Enter what fps to record at

3: Select the path with the file (i recommend using .avi)

4: Cilck record

4.4: Select the audio device to record the sound with (also don't use the number at the start but the '(hw:*,0)' the * represents the number)

4.8: There is also a bug so to start recording close the program window

5: Record what you want to

6: End the recording with pressing 'q' in the console

## Other Things

The project is licensed under Apache 2.0

Raspberry Forums post: https://www.raspberrypi.org/forums/viewtopic.php?f=38&t=291623

## Known issues

Python gui - if you want to record sound then you need to close the gui

Script nogui - there is no sound option
