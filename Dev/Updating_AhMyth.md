Updating AhMyth
===============

This section will further describe how AhMyth should operate
in terms of Binding with an Original APK when using the "On Launch" method.

I needed a complex APK for this so I used Telegram, which was obtained from
apkpure.com

DISSECTING TELEGRAM
====================

Decompiling
-----------
Decompiling the Telegram.apk was easy, by using a copy of the modified "apktool.jar" file that AhMyth uses, all I had to do was run a simple CLI (Command Line Interface) command;

    $ java -jar apktool d Telegram.apk -f

Running this command Decompiled the Telegram APK into a readable state, once this was done I was able to access the APK file's "AndroidManifest.xml" file.



Finding Launcher Activity from the AndroidManifest
==================================================
So the next thing I did after accessing the "AndroidManifest.xml" file, was search for the launcher activity. the way this was done was by first searching for `<application` attribute in the Manifest file.

Once the `<application` attribute was found, all I had to do was search for the class name attribute, which is usually 1 of the following;

- `android:name"`
- `android:targetActivity="`

Upon locating the `android:name="` attribute, which is 1 of the 2 class name attributes mentioned above, the path to the Hookable launcher activity was sectioned next to it wrapped in Quotes.

A an example of what I mean is below;

    <application android:name="org.telegram.messenger.ApplicationLoader"


Fetching the Launcher Activity
==============================
Next all I had to do was;

- Copy the "org.telegram.messenger.ApplicationLauncher" text from the Manifest file

- cd into the Decompiled Telegram APK folder

- Paste the copied text into a terminal

- Change the `.` symbols to `/` symbols

- Add the `.smali` attribute to the end of "ApplicationLoader". 

Once I had done that quickly, I then added the `find -name` syntax command, and ran it to locate the Hookable Launcher Activity smali file.

The full command used to locate the Hookable Launcher Activity smali file.
    
    find -name "org/telegram/messenger/ApplicationLoader.smali"


Injecting the payload hook
==========================
Once the Hookable Launcher Activity smali file was located, I then copied the text output printed in the terminal from running the command above, and used VSCode to open by using the command;

    code ./smali/org/telegram/messenger/ApplicationLoader.smali

Once opened, I then used the VSCode's "find" tool to locate two types of Launcher methods, the methods I was looking for are the following below;

1. `;->onCreate(Landroid/is/Bundle;)V`
2. `;->OnCreate()V`

Upon locating the 2nd method mention above, all I had to do from there was inject AhMyth's payload hook.

Below you will see two pieces of coding, the 1st piece is the AhMyth payload hook BEFORE it's injected into the Telegram.apk Launcher Activity smali file, and the 2nd one is the AhMyth payload hook AFTER it was injected into the telegram.apk Launcher Activity smali file.

BEFORE
------


AFTER
------
