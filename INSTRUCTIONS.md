# INSTRUCTIONS
#
# Pre-install Notes
## AhMyth Windows Development Ceased!
    As of v1.0-beta.3, AhMyth Android RAT is no longer being maintained for Windows 
    Machines, so don't bother trying to post issues or errors related to AhMyth for 
    Windows because they will be ignored and removed.
    
#
## Binary Setup Packages (BSP's) removed
    As of v1.0-beta.3, the BSP's have been removed
    due to a requirement that is no longer available,
    this requirement is 'libappindicator3-1', without
    this, AhMyth binaries for windows and Linux, won't 
    install, and if they do, they will not operate properly.

    You can still however download the source code from the releases section and 
    follow either the Auto Installation or Manual Installation steps.
#
#
# Installation - Linux
### Auto Install | Kali + Parrot OS
    1. git clone https://github.com/Morsmalleo/AhMyth    
    2. cd AhMyth/AhMyth-Server
    3. sudo ./autoinstall
    4. Choose the version of java you want installed - (type 11 or 8)
    5. Select Java 8 or Java 11 when prompted to change to the correct java version  
    6. Type `ahmyth` anywhere in the terminal to auto-launch AhMyth
    ------------------------------------------------------------------------------
    The autoinstall script has been coded to install all prerequisits for AhMyth
    including aapt and android-framework-res, the script FINALLY works for both
    Kali and Parrot.
#
### Manual Install | All Linux platforms
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. npm install -g electron@9.4.1
    3. sudo apt install python3* python3-pip*
    4. cd AhMyth/AhMyth-Server
    5. npm start    
#
# How to use AhMyth 
## APK Builder
Navigate to the APK builder by clicking on its 
name at the top of the GUI.

once you have done this you have two options,
you can build a Standalone AhMyth payload, or
you can Bind with an Original APK.

### Standalone Payload 
To build a Standalone AhMyth payload just simply
type your IP address into the "Server IP" box, you 
can acquire your IP address by typing `ifconfig` 
in a terminal. 

Once that's done, enter the port number you want to use
into the "Server Port" box, once you've done that,
You can go ahead and click the Red `Build` button. 

Alternatively you can leave the "Server Port" box empty, 
and AhMyth will build a Standalone payload using the default AhMyth 
port, 42474. 

If you face any errors with Building 
or Signing, then refer to the TROUBLESHOOT.md

### Binding
To Bind with an original APK, or in other terms,
Backdoor an original APK, just simply click the 
checkbox with the label "Bind with an original APK"
in the APK Builder tab.

Once you have done that, you can go ahead and click
the black "Browse APK" button, once you have done this
a file browser will open, select the original APK
you want to bind with by double clicking it.

Once you have your Original APK selected, you can go 
ahead and select a Binding method. 

There are two binding methods available to choose from, 

    1. The Boot method 
       - This allows the payload to activate when the victims 
         phone restarts or shuts down and reboots. 

    2. The Launcher Activity method
       - This allows the payload to activate when the infected 
         APK is opened by the Victim, the Launcher Method is currently 
         still a bit unstable, it won't work with all APK's, 
         this will be updated though.

Once you have selected a Binding method, you can
go ahead and click the Green `Bind` button.

if you experience any problems with Decompiling, then
Building and/or Signing, please refer to the TROUBLESHOOT.md file.
#
## Listening
Once you have your choice of payload type built, signed
And installed on the target Android device, whether it
be a Bound payload or a Standalone payload, you are ready
to listen for a Victim Connection.

Click on the "Victims" tab to access the Listener,
once you have done this you can go ahead and type in
the port number to be listened on. 

You must use the same port number that was used to Build 
the APK payload in the APK Builder, otherwise it won't work.

Once you are listening on the correct port, and the 
payload becomes active, you will receive a Victims Connection
with information about the device you've targeted, such
as the make, model, country and android version.

Receiving a Victims Connection will then allow you 
to access the Victims Lab.
#
## Payload URL Masker
This is a newer feature in AhMyth used to assist with installing
the payload APK on the victim device remotely. You can 
follow the steps below to learn how to use it.
      
    1. Build an AhMyth payload
    2. Upload the payload to a download server or fileshare website
    3. Copy the link to the part of the server/website that will start the download
    4. Paste the copied download link into the text box on the left of the UI
    5. Insert any link of your choice into the box on the right of the UI
    6. Click the `Generate Link` button, then copy the generated link from 
       the black UI terminal and send it to the victim

