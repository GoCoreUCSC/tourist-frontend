import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frontend/selectMoreDetails.dart';
import 'package:frontend/tours.dart';
//import 'package:date_time_picker/selectMoreDetails.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'customizeDay.dart';
import 'destinationSelection.dart';

class CustomizationEachData extends StatefulWidget {
  CustomizationEachData({Key? key}) : super(key: key);

  @override
  _CustomizationEachDataState createState() => _CustomizationEachDataState();
}

class _CustomizationEachDataState extends State<CustomizationEachData> {
  late String valueD;
  late String valueT;
  late String valueP;
  late String startDate;
  late String endDate;

  final List<String> payments = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  final List<String> Destinations = [
    'Sigiriya',
    'Ella',
    'Meemure',
    'Hanthana',
    'Hikkaduwa',
    'Haputhale'
  ];
  final List<String> Hotels = [
    'Hikka Tranz',
    'Araliya',
    'JetWing',
    'Habarana Lodge',
    'Cinnamon Red'
  ];
  final List<String> Transportation = ['Train', 'Bus', 'Car', 'Van', 'Caravan'];
  final List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "img": "sigiriya.jpg",
      "name": "Sigiriya",
      "age":
          "The proximity of the forest and the sea in this city has given a special beauty to this city ..."
    },
    {
      "id": 2,
      "img": "ella.jpg",
      "name": "Adam’s Peak",
      "age":
          "It is one of the most pleasant and airy parts of Iran with high mountains, forests and lush summers ..."
    },
    {
      "id": 3,
      "img": "sigiriya.jpg",
      "name": "Ella Rock",
      "age":
          "indescribable sense of freshness of this city are among the things that attract tourists ..."
    },
    {"id": 4, "img": "sigiriya.jpg", "name": "Hanthana", "age": "k"},
  ];
  List<String> images = [
    "sigiriya.jpg",
    "hanthana.jpg",
    "ella.jpg",
    "bathalegala.jpg",
    "meemure.jpg",
    "haputale.jpg",
    "kandy2.jpg"
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  get DatePicker => null;
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    dateInput2.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            '    Destination 1',
            style: TextStyle(color: Colors.white),
          ),
          //   actions: <Widget>[
          //     IconButton(
          //       icon: const Icon(Icons.support_agent_sharp, color: Colors.white,), onPressed: () {  },
          //     ),
          // ],

          //backgroundColor: const Color(0xFFF67715),
          // leading: GestureDetector(
          //   child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          //   onTap: () {
          //     Navigator.push(
          //                  context,
          //                  MaterialPageRoute(
          //                    builder: (context) =>  Selecttraveldestinations(selectActivity,name,token)));
          //   } ,
          // ) ,
          automaticallyImplyLeading: false),
      body: ListView.builder(
        itemCount: _allUsers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, _allUsers[index]['img'],
                  _allUsers[index]['name'], _allUsers[index]['age']);
            },
            // Card Which Holds Layout Of ListView Item
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff1554F6), width: 1),
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('images/' + _allUsers[index]['img']),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _allUsers[index]['name'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                          width: 10,
                        ),
                        Container(
                          width: 250,
                          child: Text(
                            _allUsers[index]['age'],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 500,
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    'images/' + img,
                    width: 100,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
