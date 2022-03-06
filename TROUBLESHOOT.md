# Troubleshoot AhMyth errors
This is a Troubleshoot file that lists known errors With AhMyth, 
but also lists solutions as well as answers about why these 
errors occur.
    
    Legend: 
    Q = Question
    A = Answer
    S = Solution

## Broken AhMyth Interface + "libva error: vaGetDriverNameByIndex()" terminal error
Q. Why isn't the AhMyth interface working and why is the terminal giving me a `libva error: vaGetDriverNameByIndex()` error at the same time??

A. These two problems are solely because you are running the wrong version of electron.

S. Run the following commands to fix both the `libva` error and the broken interface.
    
    $ rm -rf AhMyth/AhMyth-Server/node_modules 
    $ npm uninstall -g electron && npm install -g electron @9.4.4
#
## Decompiling, Building & Signing Failed | Standalone Payload + Binding Payload
Q. Why do these processes fail all the time?

A. Because you are most likely running the wrong Java version, you need a minimum of `Java Development Kit v11.0.13`

S. Run the commands below to fix the problem

    $ sudo apt-get install openjdk-11-jdk* openjdk-11-jre*    
    
Change/check the current java version being used

    $ sudo update-alternatives --config java

Type the number that corresponds to Java 11 openjdk to switch to Java 11
#
## Decompiling, Building, & Signing Failed with Java 11 | Standalone Payload + Binding Payload
Q. Why are these processes failing with the correct java versions being used?

A. Most of the time this is a problem with the apktool.jar and sign.jar files,
running them manually on the APK you want to bind with, or the decompiled original APK 
containing the AhMyth files, usually determines the problem.

If it's not a problem with sign or Apktool, then you most likely have a broken Java 
installation.

Run `sudo update-alternatives --config java` and switch your current Java version to any other Java version you have installed, then run the command `java -version`, if the output gives you the version information for the Java version you were running before switching over with `update-alternatives` then you have a broken Java installation somewhere, you will need to either make a new VM or search for a solution to the problem. 

If your Java versions do switch back and forth normally then its most likely due to an error with `apktool` & `uber-apk-signer` inside AhMyth, there is currently no workaround for this using AhMyth but there will be one integrated in the near future.
#
## Cannot find the launcher activity | Binding Payload

Q. Why can't AhMyth find the Launcher Activity when Binding On Launch?

A. Because with some APK's the actual launcher activity is not located in the "Smali" folder of the decompiled APK, it's actually located in one of the "smali_classes" folders, AhMyth is currently only able to search the "Smali" directory of a decompiled APK, this will be fixed in the future.

S. Wait patiently until I fix the bug, or use the `On Boot` method instead for the time being.
