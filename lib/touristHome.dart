import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/hiking.dart';
import 'package:frontend/kayaking.dart';
import 'package:frontend/surfing.dart';
import 'package:frontend/plan_for_booking.dart';
import 'package:google_fonts/google_fonts.dart';

import 'activitySelection.dart';
import 'balloning.dart';

class TouristHome extends StatefulWidget {
  String name, token;
  TouristHome(this.name, this.token);
  //TouristHome( {Key? key}) : super(key: key);

  @override
  State<TouristHome> createState() {
     return _TouristHomeState(this.name,this.token);
    
  }
}


class _TouristHomeState extends State<TouristHome> {
  String name, token;
  // String name;
    late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data
   _TouristHomeState(this.name,this.token);
  List activities = [
    "air-balloon.png",
    "hiking.png",
    "kayak.png",
    "surfing.png",
    "diving.png",
    
    // "Colombo.jpg",
    // "Colombo.jpg",
    // "Colombo.jpg",
    // "Colombo.jpg",
    // "Colombo.jpg"
  ];

  List tours = ["Colombo.jpg", "Kandy.jpg", "Unawatuna.jpg", "sigiriya.jpg" ];

  List tour_names = ["Colombo", "Kandy",  "Unawatuna","Sigiriya"];

  List stays = [
    "Araliya.jpg",
    "Habarana.jpg",
    "HikkaTranz.jpg",
    "JetwingJ.jpg"

  ];

  List hotel_names = [
    "Araliya Resort",
    "Habarana",
    "Hikka Tranz",
    "Jetwing Jaffna"
  ];

  List names = ["Ballooning", "Hiking", "Kayaking","Surfing", "Snorkeling"];
  List names1 = [Ballooning(), Hiking(), Kayaking(), Surfing(), Hiking()];

  // late Response response;
  // Dio dio = Dio();

  // bool error = false; //for error status
  // bool loading = false; //for data featching status
  // String errmsg = ""; //to assing any error message from API/runtime
  // // var apidata; //for decoded JSON data
  
  // List<dynamic> _allHotels= [];
  // List<dynamic> _foundHotels=[];

  // getData() async { 
  //     setState(() {
  //        loading = true;  //make loading true to show progressindicator
  //     });

  //     String url = "https://gocore.herokuapp.com/viewhotels";
  //     //don't use "http://localhost/" use local IP or actual live URL

  //     Response response = await dio.get(url); 
  //     _allHotels = response.data; //get JSON decoded data from response
  //     _foundHotels=_allHotels;// _allUsers= apidata;
  //     if(response.statusCode == 200){
  //         //fetch successful
  //         // if(apidata["error"]){ //Check if there is error given on JSON
  //         //     error = true; 
  //         //     errmsg  = apidata["msg"]; //error message from JSON
  //         // }
  //     }else{ 
  //         error = true;
  //         errmsg = "Error while fetching data.";
  //     }

  //     loading = false;
  //     setState(() {}); //refresh UI 
  // }

  // @override
  // void initState() {
  //   getData(); //fetching data
  //   super.initState();
  // }

   List<dynamic> _allUsers= [];
    getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });

      String url = "https://gocore.herokuapp.com/viewplans";
      //don't use "http://localhost/" use local IP or actual live URL

      Response response = await dio.get(url); 
      _allUsers = response.data; //get JSON decoded data from response
      // _allUsers= apidata;
      if(response.statusCode == 200){
          //fetch successful
          // if(apidata["error"]){ //Check if there is error given on JSON
          //     error = true; 
          //     errmsg  = apidata["msg"]; //error message from JSON
          // }
      }else{ 
          error = true;
          errmsg = "Error while fetching data.";
      }

      loading = false;
      setState(() {}); //refresh UI 
  }

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("images/dummy.png"),
                        ),
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                     Text(
                      "Hello\n"+name+" !!",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.notifications_on,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF1554F6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Know where you\nwanna go?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Selectactivities(name,token)));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        Color(0xFFF67715),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15.0),
                                    textStyle: const TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold)),
                                child: const Text('Select a trip'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 80),
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/Unawatuna.jpg"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Activities",
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 100,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                    itemCount: activities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            InkWell(
                              child: Container(
                                height: 70,
                                width: 70,
                                alignment: Alignment.center,// use aligment
                                child: Image.asset(
                                  "images/" + activities[index],
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),
                              
                             
                                decoration: BoxDecoration(
                                  

                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.white,
                                
                                boxShadow: [
                                           BoxShadow(
                                            color: Color.fromARGB(96, 112, 112, 112),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),]
                                ),
                                //child: Image.asset("images/" + activities[index],height: 10, width:10,scale: 0.1,),
                              //   child: Container(
                  
                              //   padding: EdgeInsets.all(5),
                              //   decoration: BoxDecoration(
                                  
                              //     //color: Colors.white,
                              //     borderRadius: BorderRadius.circular(100),
                              //     image: DecorationImage(
                              //       //scale: 0.1,
                              //         image: AssetImage(
                              //             "images/" + activities[index]),
                              //         //fit: BoxFit.cover
                              //         ),
                              //   ),
                              //  ),
                                 
                             ),
                             onTap: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => names1[index])
                                    );
                             },
                            ),
                            const SizedBox(height: 10),
                            Container(
                              child: Text(
                                names[index],
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Text(
                  "Trending Tours",
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: _allUsers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final img = _allUsers[index]['img'];
                      final pName = _allUsers[index]['planName'];
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BookingPlans(name,token)));
                                
                              },
                              child: Container(
                                width: 135,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                           BoxShadow(
                                            color: Color.fromARGB(96, 112, 112, 112),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),],
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/" + img),
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            
                            Container(
                              child: Positioned(
                                top: 80,
                                left: 0,
                                right: 0,
                                bottom:30,

                                child: Container(
                                width: 100,
                                height: 20,
                                decoration: const BoxDecoration(
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                ),
                                padding: const EdgeInsets.all(7),
                                alignment: Alignment.center,
                                child: Text(
                                  pName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),

              const SizedBox(height: 3),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Stays",
                  // textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: tours.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('Clicked!');
                              },
                              child: Container(
                                width: 135,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                           BoxShadow(
                                            color: Color.fromARGB(96, 112, 112, 112),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),],
                                  image: DecorationImage(
                                      image:
                                          AssetImage("images/" + stays[index]),
                                      fit: BoxFit.cover),
                                ),
                                
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              child: Positioned(
                                top: 80,
                                left: 0,
                                right: 0,
                                bottom:30,

                                child: Container(
                                width: 100,
                                height: 20,
                                decoration: const BoxDecoration(
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                                ),
                                padding: const EdgeInsets.all(7),
                                alignment: Alignment.center,
                                child: Text(
                                  hotel_names[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            ),
                          ],
                        ),
                      );
                    }),
                    
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}