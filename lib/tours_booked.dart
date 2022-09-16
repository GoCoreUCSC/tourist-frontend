import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:frontend/plan.dart';
import 'package:frontend/tours.dart';
import 'package:frontend/tours_booking.dart';
import 'package:frontend/view_tour.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BookedTours extends StatefulWidget {
  String name, token;
  BookedTours(this.name, this.token);
  //const BookingPlans({Key? key}) : super(key: key);

  @override
  State<BookedTours> createState() {
    return _BookedToursState(this.name, this.token);
  }
}

class Booked {
  String cities;
  String image;
  double ratings;
  double price;
  String startdate;
  String enddate;

  Booked(
      {required this.cities,
      required this.image,
      required this.ratings,
      required this.price,
      required this.startdate,
      required this.enddate});
}

class _BookedToursState extends State<BookedTours> {
  String name, token;
  _BookedToursState(this.name, this.token);

//for error status
  late Response response;
  Dio dio = Dio();
  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data

  List<Booked> bookedTours = [
    Booked(
        cities: "Hiking Over the Hill",
        image: "ella.jpg",
        ratings: 4.2,
        price: 90000.00,
        startdate: "25-09-2022",
        enddate: "27-09-2022"),
    Booked(
        cities: "Kitesurfing Adventure",
        image: "kalpitiya.jpg",
        ratings: 4.9,
        price: 110000.00,
        startdate: "02-09-2022",
        enddate: "05-09-2022"),
    //  Booked(cities: "Sigiriya", image: "sigiriya.jpg", ratings: 3.8, price:90000.00),
    //  Booked(cities: "Meemure", image: "meemure.jpg", ratings: 4.8, price: 100000.00),
    //  Booked(cities: "Hikkaduwa", image: "hikkaduwa.jpg", ratings: 4.2, price:88000.00),
    //  Booked(cities: "Pasikuda", image: "pasikuda.jpg", ratings: 4.0, price:120000.00),
  ];
  List<dynamic> _plan = [];
  List<dynamic> _book = [];

  getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });

    String url = "https://gocore.herokuapp.com/bookedPlan/$token";
    //don't use "http://localhost/" use local IP or actual live URL

    Response response = await dio.get(url);
    Map<String, dynamic> map = response.data;
    _book = map["booked"];
    _plan = map["plans1"];
    print(map);
    print(_plan);

    // _Tour = response.data; //get JSON decoded data from response

    // _allUsers= apidata;
    if (response.statusCode == 200) {
      //fetch successful
      // if(apidata["error"]){ //Check if there is error given on JSON
      //     error = true;
      //     errmsg  = apidata["msg"]; //error message from JSON
      // }
    } else {
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

  var formatter = NumberFormat('###,###,###');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
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
                    child: bookedTours.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _plan.length,
                              itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // side: BorderSide(color: Color(0xff1554F6), width: 2),
                                ),
                                child: Container(
                                  padding: new EdgeInsets.all(15.0),
                                  height: 265,
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
                                                _plan[index]["planName"],
                                                style: GoogleFonts.openSans(
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
                                                  value: _plan[index]["rating"]
                                                      .round()),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: new EdgeInsets.all(5.0),
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                _plan[index]["rating"]
                                                    .toString(),
                                                style: GoogleFonts.openSans(
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
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              padding: new EdgeInsets.all(5.0),
                                              // margin: EdgeInsets.only(right: 10.0),
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                _book[index]["startDate"]
                                                    .toString()
                                                    .split('T')[0],
                                                style: GoogleFonts.openSans(
                                                    fontSize: 12.0,
                                                    //fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              padding: new EdgeInsets.all(5.0),
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                _book[index]["endDate"]
                                                    .toString()
                                                    .split('T')[0],
                                                style: GoogleFonts.openSans(
                                                    fontSize: 12.0,
                                                    //fontWeight: FontWeight.w900,
                                                    color: Color.fromARGB(
                                                        255, 0, 0, 0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //your 2nd Row
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
                                                      _plan[index]["img"]),
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
                                                            left: 10,
                                                            right: 5),
                                                    child: Text(
                                                        'LKR ${formatter.format(_plan[index]["price"]).toString()}',
                                                        style: GoogleFonts
                                                            .openSans(
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Color
                                                                    .fromARGB(
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
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (BuildContext
                                                                    context) =>
                                                                ViewPlans(
                                                                    name,
                                                                    token,
                                                                    _plan[index]
                                                                        [
                                                                        "planId"],
                                                                    _plan[index]
                                                                        [
                                                                        "guideId"])));
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ), //your 2nd Row
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
