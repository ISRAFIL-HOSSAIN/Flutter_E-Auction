# flutter_eauction

## Getting Started
---------------------------
I am new in Flutter.I am quick learner. I learn most of the New Things for flutter related. I fetched most of the Problem working in this Task and Solve Many of issue related my Task. Which Problem I faced and how to solve this issue everythin descrive under below . 
-----------------------------------------------------------------------------------------------------------------------

Challenges Step - 1: 
--------------------
Problem : 
----------
This step user can Signin with their gmail account. I faced some problem like firebase authentication, firebase cloud storage etc . This type of problem occour because  I worked new in firebase and New User cannot Sign in directly in Our Application. 

Solve :
---------
Then I everythin read and know how to work firebase . how to user authentication work . how to Cloud storage worked and 
Then I make Signup page and New user can Registration Our application and Signin their gmail account. 

Challenges Step - 2 : 
-----------------------
Problem : 
----------
Step - 2 is more complex for me. Because I am new in Flutter . I faced problem How to fetch data to firebase Cloud storage . I successful fetch data to firebase Cloud storage but Images not fetches. This is so challanging . That case many error occur like Null safety error etc .In Create User form I faced Imaged picking in local storage. 

Solve : 
---------
I read everything how to store data in Cloud Storage. In my case I store many of data in firebase cloud storage . Then I understand The data fetches by json format . After I used Json format and all of data fetching to Firebase Cloud storage . 
Then I used Image picker dependencis for image picker from Local Storage . Then I Successfully Solved Every Problem because of hard working . 

Challange Step -3 : 
------------------
Problem : 
--------
first challange  : In Step - 3 I faced problem how to interact only one product for bid. and User select item and navigate this 
				   product details page.
second Challange : User can place bids on items posted by others within the Auction End DateTime .
Third Challange  : The User can edit their bid before the auction end . 

Solve : 
-------
in First challange Solve : I create in Cloud Storage Collection name Bid List. In Bid List Which user is authenticated they can put bid by Used their Email. The email putting in Document.And this Document I create another Collection name is items . In items User bid store. And Coding I create a Constructor. This Constructor through A user can bid  different product . 

In Second Challange : I can not solve this issu . because limit of time . 

Third Challange : I create Delete option but Update Option I don't created . 

Challange Step - 4 : 
---------------------
The auction will end at Auction End Date Time , If user enter the auction item page for any item , it will show the bid winner for that item . 

I cann't solve this problem . 

Challange Step-5,Step - 6, Step - 7 : 
----------------------------------------
Complete This Step without any Issue. 

Challange Step - 8: 
-----------------------
I make a dashboard view.Place at entrypoint of the dashboard in the bottom navigation bar . 
other task I did't comlete because limit of time. 

I Used This Packages All of My Task :
------------------------------------------

firebase_auth: ^3.3.0
------------------------
A Flutter plugin to use the Firebase Authentication API.
Firebase Auth provides many methods and utilities for enabling  to integrate secure authentication into my new or existing Flutter application. In many cases, I will need to know about the authentication state of My user, such as whether they're logged in or logged out.

firebase_core: ^1.10.1
-------------------------
Firebase Core is a set of Flutter plugins which connect My Flutter application to Firebase.

cloud_firestore: ^3.1.1
-------------------------
Flutter plugin Used for Cloud Firestore, a cloud-hosted, noSQL database with live synchronization and offline support on Android and iOS Application. 

flutter_screenutil: ^5.0.1
---------------------------
I used this flutter-screenutil because It is adapting screen and font size . Guaranteed to look good on different models . 

fluttertoast: ^8.0.8
-----------------------
This is for Easily create toast messages in single line of Code. 

carousel_slider: ^4.0.0
-------------------------
This is used for Home page Picture Slider . 

dots_indicator: ^2.0.0 
-------------------------
This is used for Widget to display dots indicator to show a position . 

image_picker: ^0.8.4+4
----------------------
This is used for Pick a Image for my phone Image gallery . 

firebase_storage: ^10.2.0
----------------------------
This is used for store and serve user-generated content, such as photos or videos.

cupertino_icons: ^1.0.2
-------------------------
This is an asset repo containing the default set of icon assets used by Flutter's Cupertino widgets.
