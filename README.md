# MCVE

The issue is related to AppCheck and reCAPTCHA v3 in Flutter Web App.
The MCVE includes minimal Flutter application, which tries to get some test data from Firebase Firestore. It fails to receive this data as AppCheck denies the permission. With unenforced AppCheck everything is OK, moreover, as I have experienced on my other project, enforced AppCheck with SafetyNet provider works fine for Android applications. But in case of web app and reCAPTCHA provider, the "permission-denied" error is permanent, as you can see here: https://appcheckweb.web.app.  
The Platform-specific configs for Firebase initialization were generated automatically when I added Flutter app from Firebase console. They are availible in lib/firebase_options.dart. The minimal app source code is in lib/main.dart. Both secret and public reCAPTCHA keys seem to be provided correctly (one can recheck it, a screenshot from reCAPTCHA console is stored in "demo" folder). Also, screenshots of how app screen looks like with enabled/disabled AppCheck are stored in "demo" folder as well.
If you need some further info, don't hesitate to contact me. Thanks in advance!
[![Gmail](https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:egor.chukanov@gmail.com) 



