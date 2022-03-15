AhMyth Instructions Manual
--------------------------
This manual is a guide for those who are new to using
AhMyth, following this guide will help you obtain and setup
AhMyth with ease, there are also instructions on how to use AhMyth
once setup is finished.
#
# SETUP GUIDE
## Setup for Linux Machines
#
### From Source
### • Root
    $ git clone https://github.com/Morsmalleo/AhMyth
    $ npm install -g electron@9.4.4
    $ apt-get install python3* python3-pip* aapt* android-framework-res* zipalign* -y
    $ cd AhMyth/AhMyth-Server
    $ pip3 install -r requirements.txt
    $ npx electron ./app --no-sandbox start

### • User
    $ git clone https://github.com/Morsmalleo/AhMyth
    $ sudo npm install -g electron@9.4.4
    $ sudo apt-get install python3* python3-pip* aapt* android-framework-res* zipalign* -y
    $ cd AhMyth/AhMyth-Server
    $ pip3 install -r requirements.txt
    $ npm start
#
### From Source {Automatic} (kali/Parrot)
### • Root
    $ git clone https://github.com/Morsmalleo/AhMyth
    $ cd AhMyth/AhMyth-Server/
    $ ./autoinstall
    $ npx electron ./app --no-sandbox start

Alternatively edit the `ahmyth` script at `/use/local/sbin/`
and replace `npm start` with `npx electron ./app --no-sandbox start`
the type `ahmyth` anywhere in the terminal to launch AhMyth at will as root.

### • User
    $ git clone https://github.com/Morsmalleo/AhMyth
    $ cd AhMyth/AhMyth-Server/
    $ sudo ./autoinstall
    $ ahmyth (shortcut command to launch AhMyth anywhere in the terminal)
#
### From Binary
### • Root
1. Wait patiently, binaries for `Root` will be back soon!

### • User
1. Wait patiently, binaries for `User` will be back soon!
# 
## Setup for Windows Machines
#
• Windows Setup Instructions Coming Soon
#
# User Guide
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
    3. Copy the the download link to the server/fileshare site
    4. Paste the copied download link into the text box on the left of the UI
    5. Insert any link of your choice into the box on the right of the UI
    6. Click the `Generate Link` button, then copy the generated link from 
       the black UI terminal and send it to the victim

