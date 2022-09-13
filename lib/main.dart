import 'package:flutter/material.dart';
import 'package:frontend/explore_page.dart';
import 'package:frontend/profile2.dart';
import 'package:frontend/touristHome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activitySelection.dart';
import 'booking_page.dart';
import 'launchscreen.dart';
import 'main_page.dart';
//import 'package:frontend/welcomescreen1.dart';
//import 'package:frontend/selectactivitiesscreen3.dart';
//import 'package:frontend/signin.dart';



void main() {
  runApp(
     MaterialApp(

    // theme: ThemeData().copyWith(
    //     scaffoldBackgroundColor: Colors.white,
    //     colorScheme: ThemeData().colorScheme.copyWith(primary: Color(0xff1554F6)),
    //   ),
    theme: ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ThemeData().colorScheme.copyWith(primary: Color(0xff1554F6)),
    fontFamily: 'Roboto',
  ),
    
    debugShowCheckedModeBanner: false,
      //  home: Signup()
    // home: ProfilePage2() 
     home:MyHomePage()
    // home:Tours()
    // home:Home()
    // home:ExplorePage()
    // home:MainPage('abc','acbdfds')
    // home: TouristHome()
     //home: BookingPage()
  ));
}

