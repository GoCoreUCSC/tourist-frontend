import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/explore_cabs.dart';
import 'package:frontend/explore_hotels.dart';
import 'package:frontend/explore_tours.dart';


class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
    with TickerProviderStateMixin {
  List Cities = ["Colombo", "Sigiriya", "Kandy", "Unawatuna"];

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
        body: Column(
      children: [
        const SizedBox(
          height: 60,
        ),
        //searchbar
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Container(
            // ignore: sort_child_properties_last
            child: TextField(
              style: TextStyle(
                color: Color.fromARGB(255, 31, 30, 30),
                fontSize: 12,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  filled: true,
                  labelStyle: TextStyle(color: Color.fromARGB(255, 31, 30, 30)),
                  fillColor: Color(0xFFFDFDFD),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search.....',
                  suffixIcon: Icon(Icons.tune_rounded)),
            ),
            decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(95, 22, 22, 22),
                  blurRadius: 18,
                  offset: const Offset(1, 5),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //tab bar
        Container(
          width: 290,
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
                Tab(text: "Tours"),
                Tab(text: "Hotels"),
                Tab(text: "Cabs"),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 543,
          width: double.maxFinite,
          child: TabBarView(
            controller: _tabController,
            children: [
              ExploreTours(),
              ExploreHotels(),
              ExploreCabs(),
            ],
          ),
        ),
      ],
    ));
  }
}
