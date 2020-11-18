echo Starting install of sounddevice module
pip install sounddevice
cd ~
mkdir PiScreenRecGUIpython
cd PiScreenRecGUIpython
echo Downloading project files
wget https://raw.githubusercontent.com/EnergitCZ/PiScreenRec/main/PiScreenRecGUIpython/PiScreenRecPython.py
wget https://raw.githubusercontent.com/EnergitCZ/PiScreenRec/main/PiScreenRecGUIpython/start.sh
echo Installing done
echo 'Run with "cd PiScreenRecGUIpython | sh start.sh"'
