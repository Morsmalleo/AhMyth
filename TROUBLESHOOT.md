# Troubleshoot AhMyth errors
This is a Troubleshoot file that lists known errors With AhMyth, 
but also lists solutions as well as answers about why these 
errors occur.

## Broken AhMyth Interface
Q. Why isn't the AhMyth interface working?

A. Because you are running the wrong version of electron.

Remove the `node-modules` folder from the `AhMyth/AhMyth-Server` directory, do not remove the `node-modules` folder from the `AhMyth/AhMyth-Server/app` directory, once you have done that go ahead and type the command `npm install -g electron@9.4.1`, this will fix the broken AhMyth interface.
#
## Building, Binding & Signing Failed.
Q. Why do these processes fail all the time?

A. Because you are most likely running the wrong Java version, you need either Java 11.0.13 or Java 1.8.0 8u252 for Linux

Add the Debian Jessie software repository to your `sources.list` file, the run the command `sudo apt update && sudo apt install openjdk-8-jdk*/jessie -y` this will install the correct version of java 8, or you cann run `sudo apt install openjdk-11-jdk*/kali-rolling -y` for Java 11
#
## Building, Binding & Signing Failed with Java 11 & 8
Q. Why is are these processes failing with the correct java versions being used?

A. This is likely due to 1 or more broken Java installations somewhere in your system.

Run `sudo update-alternatives --config java` and switch your current Java version to any other Java version you have installed, then run the command `java -version`, if the output gives you the version information for the Java version you were running before switching over with `update-alternatives` then you have a broken Java installation somewhere, you will need to either make a new VM or search for a solution to the problem.
#
## Building Succeeded, but Signing Failed with building a regular AhMyth APK & Binding with an Original
Q. Why does the building process work but the signing process fails when Binding?

A. Because the APK you are trying to Sign after Binding has protected files with encryption or obfuscation or you are running the wrong Java version

There is currently no way that I know of around the protection of APK files, you will need to choose a different APK to bind with in the meantime. 

As for the error with building regular AhMyth APK's you are most likely running the wrong Java version or you have a broken Java installation.
