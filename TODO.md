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
