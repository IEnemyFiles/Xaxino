**Introducing Xaxino - Ultimate Casino Mobile Application, Elevate your predicting excitement to new heights! Get ready to immerse yourself in the thrill of winning with our cutting-edge casino platform, Xaxino.**

**Experience the convenience of multiple automated online payment gateways, making transactions smoother and more accessible across the globe. Rest assured, we are committed to continuously updating the app, introducing new features and security enhancements to ensure the best user experience for all our users.
Thank you for choosing Xaxino Mobile Application. Should you have any questions or need assistance not covered in this documentation, please don't hesitate to reach out to us via email. We aim to provide prompt assistance to all inquiries.**

**Thank you for your support. Happy predicting!**

**Requirements :
Follow the below requirements.**

**Unzip the downloaded project and navigate to the flutter/file section, and open the project to the preferred IDE (Android Studio / Visual Code)
Then complete the
main configuration section
On IDE go to the pubspecs.yaml file then clicks on the Pub Get button top of the IDE to install the libraries.
To run the project, connect an emulator or a real device.
Then press the Run button to run the project on the connected device**

**Feature :**

**Splash Screen
``Onboard Screen
Login and Registration Screen
Forget Password and Reset Password Screen
Email, Sms Screen
Smart Homepage
Head & Tail game
Rock paper scissors game
Spain wheel game
Number guessing game
Dice Rolling game
Card Finding game
Number Slot game
Pool Number game
Roulette game
Casino Dice game
Menu Screen
Profile Screen
Change Password Screen
And more...``**

**Main Configuration
Application Setup**

1. Flutter Setup
Follow the guidelines in the following link to install the Flutter environment

OFFICIAL DOC LINK: [OFFICIAL Flutter Website](https://docs.flutter.dev/get-started/install)

2. Firebase Setup
Go to [Firebase Website](https://firebase.google.com/) , Create an Account and than Navigate to Firebase Console
 Create a New Firebase Project:
Once you are logged in, click on the "Add Project" button

 Provide a name for your Firebase project. This name is for your reference and can be anything you like.



 Choose or Create a Google Analytics Account:
If you enabled Google Analytics, you'll need to choose an existing Google Analytics account or create a new one.




 Click on 'Create Project.'



 Wait for Project Creation:
Firebase will take a moment to create your project. Once it's done, you'll be redirected to the project dashboard.




 Click on 'Continue'



3. Google Auth Setup
 After Clicking All Products



 Click on Authentication



 Click on Get Started



 Click on Add New Provider




 Click on Google




 Enable And Slected an Email and click on Save Button


 Auth Setup Done
 Now You Need To Setup Keystore and SHA-1 KEYsetup



4. Flutter App Firebase setup with CLI

First go to you firebase project
 Click to Flutter Icon



Now Click to Install Firebase Cli




Now Click to Install Node JS




Download Nodejs LTS version and Install Node JS

  


Now Run npm install -g firebase-tools cmd in your terminal



Next, install the FlutterFire CLI by running the following command:

CMD> dart pub global activate flutterfire_cli




 Now Setup Folder Path to environment variable:


 Copy Following folder path

 C:\Users\Your PC name\AppData\Local\Pub\Cache\bin




 Now Open Edit the system environment variable:



 Click On Environment Variable button




 Click On Path and click Edit button




 Click on New button and paste your Folder Path here and click OK button




 Now Again Go to your Firebase tab and click Next




now go to your App Project Folder and run following Command

CMD 1 > dart pub global activate flutterfire_cli


CMD 2 > flutterfire configure --project=Your FirebaseProjec tName

Now complete Following 1 and 2 steps


When you run the second command, you will receive the data below. After that, you need to select your desired platform. Once the platform selection is complete, you have to press Enter.




 Congratulations you firebase setup in you app is successfully done



5. App Key Store Setup
How to generate a keystore in Android Studio
To generate a keystore in Android Studio, follow these steps:

Open your app code project in Android Studio.
Click On Tools > Flutter > Open Android Module in Android Studio

Now Wait For app Gradle Update
Click on the Build menu and select Generate Signed Bundle/APK.
In the Generate Signed Bundle or APK dialog, select Android App Bundle or APK and click Next.
Below the field for Key store path, click Create new.

Click NEXT Button:

On the New Key Store window, provide the following information for your keystore and key, as shown in the image below:
Key store path: Select the location where your keystore should be created. Also, a file name should be added to the end of the location path with the .jks extension.
Password: Create and confirm a secure password for your keystore.
Alias: Enter a name for your key.
Password: Create and confirm a secure password for your key.

Click Create New


Select you path and name

Click OK


Fillup all field


Click NEXT



You Will get a Release App bundle


Click OK to create the keystore and key.
Once you have created a keystore, you can use it to sign your Android apps for release.

Additional notes:

Choose a strong password for your keystore and key.
Store your keystore in a safe place.
Back up your keystore regularly.
If you lose your keystore, you will not be able to update your app on the Google Play Store.

Conclusion

Generating a keystore is an important step in preparing your Android app for release. By following the steps above, you can create a keystore and key that will help to protect your app and your users.

1. Change App Name

 For Android
 Open AndroidMainfest.xml to IDE from android/app/src/main
 Change the label name inside the application tag from this file

  For IOS
 Open Info.plist file to IDE from ios/Runner
 Change the app name inside the dict. Please follow the below instruction.

 App Icon Change
 For Android
 Go to /android/app/src/main/res and replace all mipmap folder with your generated icon android folder.

 For IOS
 Go to /ios/Runner and replace Assets.xcassets with your generated Assets.xcassets folder.

Note: For different type of device we need to add different size of icon. So that you should to need to resize them. You can use https://appicon.co/ platform to generate multiple size icons for android and ios. It will provide you the icon with a correct folder structure.

3. App Logo Change
 Go to the AppFolder/assets/images/logo and replace it with your logo image

4. Text Change
 Change App Text
 Go to the AppFolder/lib/core/utils/my_strings.dart and replace it with your Own TEXT.

5. API Base URL
 Open lib/core/utils/url_container.dart file and change base url string

6. Change App Color
 Open lib/core/utils/my_color.dart folder and Replace the value in the primary Color field with the prepared color code. From here, you can easily change the color of something else.

7. Change Package Name
 Right click on project folder and click on Replace in Files


 Search dev.vlab.xaxino in the first indicated box and your own package name in the second marked box. Then click Replace All button

8. Generate SHA-1 & SHA256 KEY
Open a Terminal:
Open a terminal or command prompt in your project's root directory where the gradlew script is located.

CMD: cd android

Run the Gradle Signing Report Task:
In the terminal, run the following command:
Generate key code
CMD: ./gradlew signingReport



To Generate Release SHA-1 KEY add keystore.properties in you app


Create the key.properties File:
First, create a new file named key.properties in the android directory of your Flutter project.

Edit key.properties File
Open the key.properties file in a text editor, and add the necessary configuration properties. A common use case for this file is to store the signing configuration for your Android app. Here's an example of what the key.properties file might look like for


storeFile=/path/to/your/keystore.jks
storePassword=your_keystore_password
keyAlias=your_key_alias
keyPassword=your_key_password

Demo

Now Put This Key in Firebase App
Before putting this key, make sure your Firebase is connected to your Flutter app, or read this Firebase setup with CLI Step.
Fingerprint SHA-1 and SHA-256 key add here
