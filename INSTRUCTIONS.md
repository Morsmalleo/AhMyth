# AhMyth installation instructions
## Prerequisites
    1. nodejs
    - sudo apt -y install nodejs
    
    2. Java 11 Development Kit
    - sudo apt -y install openjdk-11-jdk
    
    (If you want to install openjdk-8-jdk 
    then you'll need to run the autoinstaller)
    
    3. aapt
    - sudo apt -y install aapt
    
    4. android-framework-res
    - sudo apt -y install android-framework-res
## Linux
### Auto Installation
    1. git clone https://github.com/Morsmalleo/AhMyth
![Step 1](https://user-images.githubusercontent.com/64344168/135712404-a84e04e1-5799-4e98-b887-9e039b6da048.png)
    
    2. cd AhMyth/AhMyth-Server
![Step 2](https://user-images.githubusercontent.com/64344168/135712500-966e15a9-27d8-47eb-a1c8-52c528a600c3.png)

    3. chmod +x autoinstall
![step 3](https://user-images.githubusercontent.com/64344168/135712545-c8b8fee4-5c09-4a65-ad9f-e6b78ad2d63e.png)

    4. sudo ./autoinstall
![Step 4](https://user-images.githubusercontent.com/64344168/135712661-e45baf6a-2565-40f1-8e5b-607ca19af906.png)

    5. Type the number that corresponds to Java 11 or Java 8 when prompted
 ![Step 5](https://user-images.githubusercontent.com/64344168/135712665-5f5acd58-d23f-424f-8e02-b48161626e79.png)
   
    6. Type `ahmyth` anywhere in the terminal to auto-launch AhMyth
 ![Step 6](https://user-images.githubusercontent.com/64344168/135712666-7eb2dc2e-098a-4323-8680-b97e8e44abd5.png)
#
### Manual Installation
    1. git clone https://github.com/Morsmalleo/AhMyth
![Step 1](https://user-images.githubusercontent.com/64344168/135712703-a21c25bf-7c4a-409c-94d0-6e5d8942e4b8.png)

    2. cd AhMyth/AhMyth-Server
![Step 2](https://user-images.githubusercontent.com/64344168/135712705-1fa84f97-d0d5-4615-bff4-b79795fa0f9c.png)

    3. npm install
![Step 3](https://user-images.githubusercontent.com/64344168/135712709-e4b7d464-60e5-47b3-a13d-bf4d13939696.png)

    4. npm start
![Step 4](https://user-images.githubusercontent.com/64344168/135712713-c0689728-f934-4e4f-b2df-2fb5e014be42.png)
    
    To fix the warning pictured below just simply upgrade to node 14.x
![Warning fix](https://user-images.githubusercontent.com/64344168/135712747-8545bc2c-3ef9-4e5e-9890-f2d7f66e1534.png)    

#
# IMPORTANT RELEASE NOTES
## Windows CeaseDev Message
    As of v1.0-beta.3, AhMyth Android RAT is currently no longer being maintained for Windows Machines until 
    further notice, so don't bother trying to post issues or errors related to Windows because they will be 
    ignored and removed.
    
    The setup files for Windows AhMyth, have also been removed due to packaging errors with electron-packager, 
    so don't bother trying to look for them either, and don't bother posting issues related to this, AhMyth's 
    current and previous version are all source code ONLY for the time being! You can Download the source code 
    for AhMyth Windows from the releases section if you wish to test your luck with AhMyth on Windows, but remember 
    Development for Windows AhMyth has ceased until further notice, so DO NOT post errors relating to AhMyth 
    for Windows.
#
## AhMyth_Linux.deb setup packages removed
    As of v1.0-beta.3, The AhMyth_Linux.deb setup files for installing AhMyth for Linux have been removed due to 
    packaging errors with electron-packager, you can still however download the source code from the releases 
    section and follow either the Auto Installation or Manual Installation steps.
