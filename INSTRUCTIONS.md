# AhMyth installation instructions
## Prerequisites
    1. nodejs
    - sudo apt -y install nodejs
    
    2. Java 8/java 11 Development Kit
    - sudo apt -y install openjdk-11-jdk
    
    3. aapt
    - sudo apt -y install aapt
    
    4. android-framework-res
    - sudo apt -y install android-framework-res
    
    5. electron-packager - to build binaries for Linux & OSX
    - npm install -g electron-packager
## Linux
### Auto Installation
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. cd AhMyth/AhMyth-Server
    3. chmod +x autoinstall
    4. sudo ./autoinstall
    5. Type the number that corresponds to Java 11 or Java 8 when prompted
    6. Type `ahmyth` anywhere in the terminal to auto-launch AhMyth
### Manual Installation
    1. git clone https://github.com/Morsmalleo/AhMyth
    2. cd AhMyth/AhMyth-Server
    3. npm install - NOTE: DO NOT 'npm install' ANYTHING ELSE LIKE ELECTRON-NIGHTLY, JUST RUN 'npm install'
    4. npm start
#
# IMPORTANT RELEASE NOTES
## Windows CeaseDev Message
    AhMyth Android RAT is currently no longer being maintained for Windows Machines until further notice,
    so don't bother trying to post issues or errors related to Windows because they will be ignored and removed.
    
    The setup files for Windows AhMyth, have also been removed due to packaging errors, so don't bother trying 
    to look for them or bother posting issues related to this, AhMyth's current and previous version are all
    source code ONLY for the time being! You can Download the source code for AhMyth Windows from the releases
    section if you wish to test your luck with AhMyth on Windows, but remember Development for Windows AhMyth 
    has ceased until further notice, so DO NOT post errors relating to AhMyth for Windows.
#
## AhMyth_Linux.deb setup packages removed
    The AhMyth_Linux.deb setup file for AhMyth on Linux have been removed due to packaging errors with electron,
    you can still however download the source code from the releases section and follow either the Auto Installation
    or Manual Installation steps.
