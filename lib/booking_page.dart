import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/explore_cabs.dart';
import 'package:frontend/explore_hotels.dart';
import 'package:frontend/explore_tours.dart';
import 'package:frontend/tours_booked.dart';
import 'package:frontend/tours_completed.dart';
import 'package:frontend/tours_ongoing.dart';


class BookingPage extends StatefulWidget {
  String name, token;
  BookingPage(this.name, this.token);
  //const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() 
  {
    return _BookingPageState(this.name,this.token);
  }
}


class _BookingPageState extends State<BookingPage>
    with TickerProviderStateMixin {
  String name, token;
  _BookingPageState(this.name, this.token);
  List Cities = ["Hikkaduwa", "Pasikuda", "Meemure", "Unawatuna"];

  List Descriptions = [
    "Colombo is the executive and judicial capital and largest city of Sri Lanka by population.....",
    "Sigiriya is an ancient rock fortress located in the Matale District near the town of Dambulla in the Central Province, Sri Lanka.....",
    "Kandy is a major city in Sri Lanka located in the Central Province. It was the last capital of the ancient kings' era of Sri Lanka.....",
    "Unawatuna main beach is one of the most famous beaches in the country and is popular with both tourists and locals alike.....",
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      // appBar: AppBar(
      //     // leading: GestureDetector(
      //     // //child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
      //     // onTap: () {} ,
      //     // ),
      //     //elevation: 0.0,
      //     //backgroundColor: Color.fromRGBO(246, 119, 21, 1),
      //     title: Text('Bookings',style: TextStyle(color: Colors.white),),
      // ),
        body: Column(
      children: [
        const SizedBox(
          height: 22,
        ),
       Container(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: Row(
                children: [
                   Text(
                    "Bookings",
                    style: TextStyle(
                      color: Color(0xFF1554F6),
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(
          height: 25,
        ),
        
        //tab bar
        Container(
          width: 350,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TabBar(
              labelPadding: const EdgeInsets.only(left: 30, right: 30),
              indicatorPadding: const EdgeInsets.all(7),
              indicator: BoxDecoration(
                  border: Border.all(color: Color(0xFF1554F6)),
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF1554F6)),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              controller: _tabController,
              tabs: const [
                Tab(text: "Ongoing"),
                Tab(text: "Booked"),
                Tab(text: "Completed"),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 543,
          width: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
            children: [
              OngoingTours(),
              BookedTours(name,token),
              CompletedTours(),
            ],
          ),
        ),
      ],
    ));
  }
}
