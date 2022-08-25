import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:dio/dio.dart';




class ExploreHotels extends StatefulWidget {
  const ExploreHotels({Key? key}) : super(key: key);

  @override
  State<ExploreHotels> createState() => _ExploreHotelsState();
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

class _ExploreHotelsState extends State<ExploreHotels> {
  // List Hotels = [
  //   "Hikka Tranz Cinnamon",
  //   "Habarana Lodge",
  //   "Araliya Green Hills",
  //   "Jetwing Jaffna"
  // ];

  // List Descriptions = [
  //   "This vibrant hotel is a 2-minute walk from the white-domed Susilachara Temple and 5 km from the Tsunami Museum......",
  //   "Located amid green forests, the Cinnamon Lodge Habarana offers air-conditioned rooms with a private balcony......",
  //   "In an elegant manor on a leafy hillside property overlooking farmland, this hotel is a 5-minute walk from the gardens of Victoria Park......",
  //   "Set in the midst of the social city of Jaffna, North Gate by Jetwing is a contemporary, present day city lodging with luxury facilities.....",
  // ];

  // List images = [
  //   "HikkaTranz.jpg",
  //   "Habarana.jpg",
  //   "Araliya.jpg",
  //   "JetwingJ.jpg"
  // ];

late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data
  
  List<dynamic> _allHotels= [];
  List<dynamic> _foundHotels=[];

  getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });

      String url = "https://gocore.herokuapp.com/viewhotels";
      //don't use "http://localhost/" use local IP or actual live URL

      Response response = await dio.get(url); 
      _allHotels = response.data; //get JSON decoded data from response
      _foundHotels=_allHotels;// _allUsers= apidata;
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
      results = _allHotels;
      // print(_allUsers);
    } else {
      results = _allHotels
          .where((user) =>
              user["place"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundHotels = results;
    });
  } 

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
        itemCount: _foundHotels.length,
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
                            image: AssetImage('images/' +  _foundHotels[index]['img']),
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
                                 _foundHotels[index]['hotelName'],
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
                                    child: IconTheme(
                                    data: IconThemeData(
                                                  color: Colors.amber,
                                                  size: 15,
                                                ),
                                    child: StarDisplay(value: _foundHotels[index]['star']),
                                    ),
                                  ),
                                  //  TextSpan(
                                  //   text: _foundHotels[index]['star'].toString(),
                                  //   style: const TextStyle(
                                  //     color: Colors.black,
                                  //     fontSize: 14.0,
                                  // ),
                                  // ),
                                ],
                              ),
                            )    
                              ),
                              SizedBox(height: 10),
                            Container(
                              width: 200,
                              child: Text(
                                 _foundHotels[index]['location'],
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