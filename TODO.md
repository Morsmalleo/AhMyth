## Stability Updates:

- [x] 01: Figure out why AhMyth is so unstable on 
Windows machines!

Done, was due to outdated coding and an old electron version.
# 
- [ ] 02: Fully stabilise `On Launch` binding method by effectively 
allowing AhMyth to search for the `->onCreate()V` method if the `->onCreate(Landroid/os/Bundle;)V` 
method is not found in the **Launcher Activity**.
#
- [x] 03: Figure out how to allow AhMyth to search `smali_classes` directories, if the launcher activity is not present anywhere in the `smali` directory

Done For Windows, Linux & macOS FINALLY!!
#
- [ ] 04. Stabilise the SMS feature by adding the ability to view sent SMS's as well as inbox SMS's, and possibly Conversation lists.
#
- [ ] 05: Update *socket.io-client java 0.8.3* to *socket.io-client java 2.0.1* and test the client with the Server's Socket.io v4.x.x
#
- [ ] 06: Convert the AhMyth Client from *Java* to *Kotlin* and test to see if
it performs better with *Kotlin* instead of *Java* 
#
- [ ] 07: Implement battery ignorance as well as proper background activity for longer connections while the client is in sleep mode.
