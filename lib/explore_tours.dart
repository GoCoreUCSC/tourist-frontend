import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:frontend/view_tour.dart';
import 'package:intl/intl.dart';


class ExploreTours extends StatefulWidget {
  String name, token;
   ExploreTours(this.name, this.token);

  @override
  State<ExploreTours> createState() {
    return _ExploreToursState(this.name ,this.token);
  }
 
}
class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key? key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}

class _ExploreToursState extends State<ExploreTours> {
String name, token;
  _ExploreToursState(this.name, this.token);

late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data
  
  List<dynamic> _allTours= [];
  List<dynamic> _foundTours=[];

  getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });

      String url = "https://gocore.herokuapp.com/viewTourplan";
      //don't use "http://localhost/" use local IP or actual live URL

      Response response = await dio.get(url); 
      _allTours = response.data; //get JSON decoded data from response
      _foundTours=_allTours;// _allUsers= apidata;
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

// void _runFilter(String enteredKeyword) {
//     List<dynamic> results = [];
//     if (enteredKeyword.isEmpty) {
//       // if the search field is empty or only contains white-space, we'll display all users
//       results = _allTours;
//       // print(_allUsers);
//     } else {
//       results = _allTours
//           .where((user) =>
//               user["place"].toLowerCase().contains(enteredKeyword.toLowerCase()))
//           .toList();
//       // we use the toLowerCase() method to make it case-insensitive
//     }

//     // Refresh the UI
//     setState(() {
//       _foundTours = results;
//     });
//   } 
  var formatter = NumberFormat('###,###,###');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
       loading
          ? //printing the JSON recieved
          Center(
              child: SizedBox(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffF67715))),
                  height: 30.0,
                  width: 30.0),
            )
          : Container(
              // child: Padding(
              //   padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: _allTours.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: ListView.builder(
                              itemCount: _allTours.length,
                              itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // side: BorderSide(color: Color(0xff1554F6), width: 2),
                                ),
                                child: Container(
                                  padding: new EdgeInsets.all(12.0),
                                  height: 270,
                                  child: ListView(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Container(
                                              padding: new EdgeInsets.all(5.0),
                                              // margin: EdgeInsets.only(right: 10.0),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                _allTours[index]['planName'],
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w900,
                                                    color: Color(0xff1554F6)),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.topRight,
                                            child: IconTheme(
                                              data: IconThemeData(
                                                color: Colors.amber,
                                                size: 15,
                                              ),
                                              child: StarDisplay(
                                                  value: _allTours[index]
                                                          ['rating']
                                                      .round()),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: new EdgeInsets.all(5.0),
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                _allTours[index]['rating']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color.fromARGB(
                                                        255, 8, 8, 8)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //your 1st Row
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Container(
                                              width: 150,
                                              height: 115,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('images/' +
                                                      _allTours[index]['img']),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Expanded(
                                              child: Container(
                                                child: ListTile(
                                                  title: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10.0,
                                                            left: 20,
                                                            right: 5),
                                                    child: Text(
                                                        'LKR ${formatter.format(_allTours[index]['price']).toString()}',
                                                        style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    8,
                                                                    8,
                                                                    8)),
                                                        textAlign:
                                                            TextAlign.right),
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20.0,
                                                            left: 17),
                                                    child: TextButton(
                                                      child: Text("View Plan",
                                                          style: TextStyle(
                                                              fontSize: 12),
                                                          textAlign:
                                                              TextAlign.right),
                                                      style:
                                                          TextButton.styleFrom(
                                                        primary: Colors
                                                            .white, //Text Color
                                                        backgroundColor:
                                                            Color(0xff1554F6),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0)),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) =>
                                                                    ViewPlans(name, token,_allTours[index]['planId'], _allTours[index]['guideId'])));
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //your 2nd Row

                                    SizedBox(
                                      width: 20,
                    height: 20,
                  ),
                                      Row(
                                        
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Padding(
                                          //  padding: const EdgeInsets.only(top: 8.0),
                                          
                                          Column(
                                            children: [
                                              // width: 150,
                                              // height: 115,
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10.0,
                                                      left: 5,
                                                      right: 5),
                                                  child: Text(
                                                    '${formatter.format(_allTours[index]['duration']).toString()} days',
                                                    style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    8,
                                                                    8,
                                                                    8)),
                                                        textAlign:
                                                            TextAlign.center
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(179, 234, 242, 255),
                                                  // border: Border.all(
                                                  //   width: 1,
                                                  // ),
                                                  borderRadius: BorderRadius.circular(12),
                                              ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                    width: 20,
                  ),
                                          Column(
                                            children: [
                                              // width: 150,
                                              // height: 115,
                                              Container(
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10.0,
                                                            left: 5,
                                                            right: 5),
                                                    
                                                    child: Text(
                                                      'Max Travellers ${formatter.format(_allTours[index]['max_travellers']).toString()}',
                                                      style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    8,
                                                                    8,
                                                                    8)),
                                                        textAlign:
                                                            TextAlign.center
                                                    ),
                                                    ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(179, 234, 242, 255),
                                                  // border: Border.all(
                                                  //   width: 1,
                                                  // ),
                                                  borderRadius: BorderRadius.circular(12),
                                              ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                    width: 20,
                  ),
                                          Column(
                                            children: [
                                              // width: 150,
                                              // height: 115,
                                              Container(
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10,
                                                      bottom: 10.0,
                                                      left: 5,
                                                      right: 5),
                                                  child: Text(
                                                    _allTours[index]
                                                        ['payment_method'] + 'Payments',
                                                    style: TextStyle(
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    8,
                                                                    8,
                                                                    8)),
                                                        textAlign:
                                                            TextAlign.center
                                                  ),
                                                ),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(179, 234, 242, 255),
                                                  // border: Border.all(
                                                  //   width: 1,
                                                  // ),
                                                  borderRadius: BorderRadius.circular(12),
                                              ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ), //3rd row
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromARGB(96, 112, 112, 112),
                                          blurRadius: 10,
                                          offset: Offset(0, 5),
                                        ),
                                      ]),
                                ),
                              ),
                            ))
                        : const Text(
                            'No results found',
                            style: TextStyle(fontSize: 14),
                          ),
                  ),
                ],
              ),
            ),
    );
    }
}
