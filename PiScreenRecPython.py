import tkinter
import subprocess
import sounddevice

def screenres():
    resolution = subprocess.Popen('xrandr | grep "\*" | cut -d" " -f4',shell=True, stdout=subprocess.PIPE).communicate()[0]
    return(resolution.replace("\n", ""))

def showres():
    if not "shownres" in globals():
        global shownres
        shownres = False
    if shownres:
        ResolutionLabel.pack_forget()
        shownres = False
    else:
        ResolutionLabel.pack()
        shownres = True

def soundprepare():
    def OKbuttonCMD():
        entry = Entry.get()
        global entry
        sdPopup.destroy()
    FPSentryVar = FPSentry.get()
    FileEntryVar = FileEntry.get()
    global FPSentryVar
    global FileEntryVar
    sdPopup = tkinter.Tk()
    SDlabel = tkinter.Label(sdPopup, text="Enter a sound device number, here's a list of them:\n" + str(sounddevice.query_devices()))
    Entry = tkinter.Entry(sdPopup)
    OKbutton = tkinter.Button(sdPopup, text="ok", command=OKbuttonCMD)
    SDlabel.pack()
    Entry.pack()
    OKbutton.pack()
    sdPopup.mainloop()

def record():
    if sound.get() == 1:
        soundprepare()
        subprocess.call(["ffmpeg", "-f", "alsa", "-ac", "1", "-i", "hw:" + entry, "-f", "x11grab", "-video_size", screenres(), "-framerate", FPSentryVar, "-i", ":0.0", FileEntryVar])
    else:
        subprocess.call(["ffmpeg", "-f", "x11grab", "-video_size", screenres(), "-framerate", FPSentry.get(), "-i", ":0.0", FileEntry.get()])

tk = tkinter.Tk()
sound = tkinter.IntVar()
UseSound = tkinter.Checkbutton(tk, text="Use sound", variable=sound)
ResolutionLabel = tkinter.Label(tk, text="Resolution:\n" + screenres())
ShowResButton = tkinter.Button(tk, text="Show resolution", command=showres)
FPSlabel = tkinter.Label(tk, text="Enter what fps to record at:")
FPSentry = tkinter.Entry(tk)
FileLabel = tkinter.Label(tk, text="Path to output file:")
FileEntry = tkinter.Entry(tk)
RecordBTN = tkinter.Button(tk, text="Record", command=record)
EndRecordLabel = tkinter.Label(tk, text='To stop recording press "q" in console')


ShowResButton.pack()
UseSound.pack()
FPSlabel.pack()
FPSentry.pack()
FileLabel.pack()
FileEntry.pack()
RecordBTN.pack()
EndRecordLabel.pack()

tk.mainloop()