## <div align="center"><ins>Stability Updates</ins></div>

- [ ] 01: Merge Client & Server upgrades from [@HiddenPirates](https://github.com/HiddenPirates) and then integrate the Java code responisble for allowing the new hook function to work
#
- [ ] 02. Stabilise the SMS feature by adding the ability to view sent SMS's in an `Outbox SMS` sub-tab next to a separate `Inbox SMS` sub-tab when using the Victims Lab's SMS feature, a small example of this can be seen below.
```
|--| SMS |
|----| Send an SMS |
|------| Inbox || Outbox |
```
#
- [ ] 03: Implement the `REQUEST_IGNORE_BATTERY_OPTIMISATION` manifest permission in such a way where it wont be replaced when using the `Custom Permissions` feature.
