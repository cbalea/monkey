# monkey
Automated exploratory and stress testing of mobile apps.

#
This tool was designed to hunt for bugs and crashes in a mobile app. It also can exhert the app under test for a long period of time, serving as a stress testing tool.

Like a monkey, it clicks randomly through your app and stops when the app is not interactable anymore, or when it got "bored".

How it works:
- it uses [Appium](http://appium.io) to control the app under test
- it runs random actions through the app, for the amount of time defined in the `.feature` file
- the `rules` folder contains one file for each action, or "rule" that Monkey know to perform (new rules can be added at any time)
- in case of a crash or hang, the test will fail
- using the log file which Monkey creates you can trace back which action was performed on which screen and in what order.
