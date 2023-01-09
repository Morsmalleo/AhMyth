## <div align="center"><ins>Stability Updates</ins></div>

- [ ] 01: Merge Client & Server upgrades from [@HiddenPirates](https://github.com/HiddenPirates) and then integrate the Java code responisble for allowing the new hook function to work
#
- [ ] 02: Fix the App List feature in [@HiddenPirates](https://github.com/HiddenPirates) client work so that AhMyth users are successfully able to view a list of the Victims installed apps from the victims lab
#
- [ ] 03. Stabilise the SMS feature by adding the ability to view sent SMS's in an `Outbox SMS` sub-tab next to a separate `Inbox SMS` sub-tab when using the Victims Lab's SMS feature, a small example of this can be seen below.
```
|--| SMS | <== Main Tab
|----| Send an SMS || SMS List | <== Sub Tab
|---------------------| Inbox || Outbox | <== two seperate sub-tabs for inbox and outbox messages once the sms list sub-tab is clicked 
```
#
- [ ] 04: Implement the `REQUEST_IGNORE_BATTERY_OPTIMISATION` manifest permission in such a way where it wont be replaced when using the `Custom Permissions` feature.
#
- [ ] 05: Add *Zipalign* for 32bit linux based operating systems as well as the JavaScript code to execute it before signing.
#
- [ ] 06: write a JavaScript function with `fs.readdir` so AhMyth is able to read an Apk folder and determine how many `"smali_classes**"` folders we have present. 

> So basically, if the `"smali"` folder returns as the last subfolder inside the decompiled APK folder, then the  function should always create a `"smali_classes2"` folder in this case, see Example 1 below...

> However if we have multiple `"smali_classes**"` folders present, this wont be the case, the function would then have to find the last `"smali_classes**"` subfolder, and then create a new `"smali_classes**"` subfolder next to it following the number pattern from the previous `"smali_classes**"` subfolder, see Example 2 below.

- Example 1
```
<apkFolder>
 | AndroidManifest.xml
 | apktool.yml
 | original
 | res
 | build
 | smali <= If this returns as the last smali folder..
 | [smali_classes2] <= Then this exact folder should always be created.
```
- Example 2
```
<apkFolder>
 | AndroidManifest.xml
 | apktool.yml
 | original
 | res
 | build
 | smali
 | smali_classes2
 | smali_classes3
 | smali_classes4 <= If this returns as the last smali folder..
 | [smali_classes5] <= then this folder is created following the number pattern in the previous folder's title.
```
