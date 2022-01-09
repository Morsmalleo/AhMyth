# Troubleshoot AhMyth errors
This is a Troubleshoot file that lists known errors With AhMyth, 
but also lists solutions as well as answers about why these 
errors occur.

## Broken AhMyth Interface + "libva error: vaGetDriverNameByIndex()" terminal error
Q. Why isn't the AhMyth interface working and why is the terminal giving me a `libva error: vaGetDriverNameByIndex()` error at the same time??

A. These two problems are solely because you are running the wrong version of electron.

Remove the `node-modules` folder from the `AhMyth/AhMyth-Server` directory, do not remove the `node-modules` folder from the `AhMyth/AhMyth-Server/app` directory, once you have done that go ahead and type the command `npm install -g electron@9.4.1`, this will fix the broken AhMyth interface as well as the `libva error: vaGetDriverNameByIndex()` error.
#
## Decompiling, Building & Signing Failed.
Q. Why do these processes fail all the time?

A. Because you are most likely running the wrong Java version, you need either Java 11.0.13 or Java 1.8.0 8u252 for Linux

Add the Debian Jessie software repository to your `sources.list` file, the run the command `sudo apt update && sudo apt install -t jessie openjdk-8-jdk* -y` this will install the correct version of java 8, or you cann run `sudo apt install openjdk-11-jdk*/kali-rolling -y` for Java 11
#
## Decompiling, Building, & Signing Failed with Java 11 & 8
Q. Why is are these processes failing with the correct java versions being used?

A. Most of the time this is a problem with the apktool.jar and sign.jar files,
running them manually on the APK you want to bind with, or the decompiled original APK 
containing the AhMyth files, usually determines the problem.

If it's not a problem with sign or Apktool, then you most likely have a broken Java 
installation.

Run `sudo update-alternatives --config java` and switch your current Java version to any other Java version you have installed, then run the command `java -version`, if the output gives you the version information for the Java version you were running before switching over with `update-alternatives` then you have a broken Java installation somewhere, you will need to either make a new VM or search for a solution to the problem. 

If your Java versions do switch back and forth normally then its most likely due to an error with apktool inside AhMyth, there is currently no workaround for this using AhMyth but there will be one integrated in the near future.
#
## Building Succeeded, but Signing Failed with building a regular AhMyth APK & Binding with an Original
Q. Why does the building process work but the signing process fails when Binding?

A. Because the APK you are trying to Sign after Binding has the following things wrong with it
- Malformation causing the zipalign process to fail with signing
- a Certain Signing Certificate is needed

AS for the Building error with the standalone payload,
you are running the wrong java version or you have a break
in your java installations 
