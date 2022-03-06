# INSTRUCTIONS
#
# Source Installation - Linux
### Root Install
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. npm install -g electron@9.4.1
    3. apt-get install python3* python3-pip*
    4. cd AhMyth/AhMyth-Server
    5. pip3 install -r requirements.txt
    6. npx electron ./app --no-sandbox start

### User Install 
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. sudo npm install -g electron@9.4.1
    3. sudo apt-get install python3* python3-pip*
    4. cd AhMyth/AhMyth-Server
    5. pip3 install -r requirements.txt
    6. npm start
#
# Binary Installation - Linux - COMING SOON!
### Root Install
1. Download one of the AhMyth .deb packages from [the release section](https://github.com/Morsmalleo/AhMyth/releases)
2. `apt-get install /path/to/./AhMyth_1.0-beta.4.deb`
3. Click the Applications menu and find AhMyth's Launcher
4. Right click the launcher and click `Edit Launcher`
5. In the `Launcher Command` box add the following line
   `/opt/AhMyth/ahmyth --no-sandbox %U`
6. Run AhMyth with root account

### User Install
1. Download one of the AhMyth .deb packages from [the release section](https://github.com/Morsmalleo/AhMyth/releases)
2. `sudo apt-get install /path/to/./AhMyth_1.0-beta.4.deb`
3. Click the Applications menu and find AhMyth's Launcher
4. Right click the launcher and click `Edit Launcher`
5. In the `Launcher Command` box add the following line `sudo /opt/AhMyth/ahmyth %U` 
   then click the `Run in terminal` checkbox

6. Run AhMyth from the terminal with `sudo ahmyth --no-sandbox`

Alternatively you can add AhMyth to your Linux's trusted apps group
#
# AhMyth User Guide
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

