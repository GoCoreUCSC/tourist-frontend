import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/hiking.dart';
import 'package:frontend/explore_page.dart';
import 'package:frontend/profile_page.dart';
import 'package:frontend/touristHome.dart';
import 'package:frontend/tours.dart';

import 'activitySelection.dart';
import 'booking_page.dart';
import 'customizeDay.dart';


class MainPage extends StatefulWidget {
 String name,token;
  MainPage(this.name, this.token);

  @override
  State<MainPage> createState() {
    return _MainPageState(name,token);}
  
}

class _MainPageState extends State<MainPage> {
 String name,token;
 _MainPageState(this.name, this.token);
  
  //String name;
  //_MainPageState(this.name);
  // List pages = [
  //   // HomePage(),
  //   TouristHome(),
  //   ExplorePage(),
  //   BookingPage(),
  //   ProfilePage(),
  //   // Signin1(),
    

  //   // BookingPage(),
  //   // ProfilePage(),
  // ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      //pages[currentIndex],
      (currentIndex==0)?TouristHome(name,token) :(currentIndex==1)?ExplorePage():(currentIndex==2)?BookingPage(name,token) :ProfilePage(name,token),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xff1554F6),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        
        elevation: 10,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(label: 'Explore', icon: Icon(Icons.travel_explore_sharp)),
          BottomNavigationBarItem(label: 'Booking', icon: Icon(Icons.home_repair_service_rounded)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_sharp)),
        ],
      ),
    );
  }
}