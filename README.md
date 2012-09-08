DistanceMeasurer
================

Uses ultrasonic sensor + Arduino to record distance on iOS

iDeviceConsoleTest/folder is the code for iPhone serial monitor

Ultrasonic/folder is the code on Arduino


##FAQ
#####1. "Code Sign Error"

In **Info.plist** file, change the Bundle identifier to the same as your Apple developer identifier.

For me, it's *com.nanaimostudio.${PRODUCT_NAME:rfc1034identifier}*

In your Project's **Build Settings**, **Code Signing** section:

Change Code Signing Identity to your own developer account.

#####2. "Error launching remote program: No such file or directory"

In your Project's **Build Settings**, click **Validate Settings** button at the bottom.