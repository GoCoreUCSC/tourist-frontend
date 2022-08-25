import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';


class ExploreTours extends StatefulWidget {
  const ExploreTours({Key? key}) : super(key: key);

  @override
  State<ExploreTours> createState() => _ExploreToursState();
}

class _ExploreToursState extends State<ExploreTours> {

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

      String url = "https://gocore.herokuapp.com/viewplans";
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

void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allTours;
      // print(_allUsers);
    } else {
      results = _allTours
          .where((user) =>
              user["place"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundTours = results;
    });
  } 
  var formatter = NumberFormat('###,###,###');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      loading? //printing the JSON recieved
                       Center(
                        child:SizedBox(
                          child:CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xffF67715))),             
                         height: 30.0,
                         width: 30.0),
                       ):
      ListView.builder(
        itemCount: _foundTours.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => 
        InkWell(
          onTap: () => null,
          child:Container(
          padding: EdgeInsets.only(left: 20.0, right: 20),
          child: Card(
            margin: EdgeInsets.only(bottom: 20),
            elevation: 10.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: 360,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: Offset(-10.0, 10.0),
                    blurRadius: 20.0,
                    spreadRadius: 4.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/' + _foundTours[index]['img']),
                          ),
                        ),
                        
                      ),
                      SizedBox(width: 20, height: 20,),
                      SingleChildScrollView(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: Text(
                                 _foundTours[index]['destination'],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              width: 200,
                              child: 
                              RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.star, size: 21,color: Colors.amber,),
                                  ),
                                  TextSpan(
                                    text: '' +  _foundTours[index]['rating'].toString() ,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                  ),
                                  ),
                                ],
                              ),
                            )    
                              ),
                              SizedBox(height: 10),
                            Container(
                              width: 200,
                              child: Text(
                                'LKR ${formatter.format(_foundTours[index]['price']).toString() }',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            ],
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
 }
}