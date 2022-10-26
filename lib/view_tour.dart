import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/main_page.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ViewPlans extends StatefulWidget {
  String name, token,plan, guide;
  ViewPlans(this.name, this.token, this.plan, this.guide);
  //const BookingPlans({Key? key}) : super(key: key);

  @override
  State<ViewPlans> createState() 
  {
    return _ViewPlans(this.name,this.token, this.plan, this.guide);
  }
 
}

class _ViewPlans extends State<ViewPlans> {
  String name, token, plan, guide;
  _ViewPlans(this.name, this.token, this.plan, this.guide);

  late Response response;
  Dio dio = Dio();
  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data

  // Map< dynamic> _Tour = [];
  List<dynamic> _plan= [];
  List<dynamic> _guide= [];
  List<String> days = ['Day 01','Day 02','Day 03','Day 04','Day 05',];
  
    getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });
 
      String url = "https://gocore.herokuapp.com/viewplan/$plan/$guide";
      //don't use "http://localhost/" use local IP or actual live URL
      print(plan);
      print(guide);
      Response response = await dio.get(url); 
      Map<String, dynamic> map = response.data;
      _plan = map["plan"];
      _guide = map["guide"];
       print(map);
      print(_plan);
      print(_plan[0]["img"]);
      print(_guide);
      // _Tour = response.data; //get JSON decoded data from response
     
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
      setState(() {}); //refresh UI v
  }

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }

  var formatter = NumberFormat('###,###,###');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 260,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:  AssetImage('images/' + _plan[0]['img']),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 15, top: 170),
                  child:  Text(
                   " ${_plan[0]['planName']} \n ${_plan[0]['duration']} Days" ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 540,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        height: 100,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image:  DecorationImage(
                                      image:
                                          // const AssetImage("images/dummy.png"),
                                          NetworkImage(_guide[0]['image']),
                                    ),
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _guide[0]['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      "Guide",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Row(
                                      children:  [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Color(0xFFF67715),
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          "4.8 [140+ Reviews]",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                width: 160,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.money_rounded, size: 25),
                                    SizedBox(width: 5),
                                    Text('LKR ${formatter.format(_plan[0]['price'])}'),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                width: 160,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.people_outlined, size: 25),
                                    SizedBox(width: 5),
                                    Text("${_plan[0]['max_travellers']} Passengers"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 270,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Container(
                                width: double.maxFinite,
                                height: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, top: 15),
                                      child: Text(
                                        days[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Card(
                                                child: Container(
                                                  width: 150,
                                                  height: 35,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .check_box_outlined,
                                                        color: Color(0xFF1554F6),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        "Transportation",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Icon(Icons
                                                          .emoji_transportation_sharp),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Card(
                                                child: Container(
                                                  width: 150,
                                                  height: 35,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .check_box_outlined,
                                                        color: Color(0xFF1554F6),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        "Accomodation",
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Icon(Icons.hotel,
                                                          size: 20),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Container(
                                          width: double.maxFinite,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                  "images/google_maps.jpeg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(3, (indexDots) {
                                        return Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 2, right: 5),
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: index == indexDots
                                                ? Colors.red
                                                : Color(0xFFF67715),
                                            boxShadow: [
                                              index == indexDots
                                                  ? BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      offset:
                                                          const Offset(0, 6),
                                                      blurRadius: 4.0,
                                                      spreadRadius: 2.0,
                                                    )
                                                  : BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      offset:
                                                          const Offset(0, 0),
                                                      blurRadius: 0,
                                                      spreadRadius: 0,
                                                    ),
                                            ],
                                          ),
                                        );
                                      }),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(height: 16),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
