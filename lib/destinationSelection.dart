import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/selectMoreDetails.dart';
import 'dart:collection';
import 'activitySelection.dart';
// import 'package:frontend/selectTravelDestination.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter/src/rendering/box.dart';
// import 'package:frontend/ui/pallete.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/rendering/box.dart';


class Selecttraveldestinations extends StatefulWidget {
  HashSet selectActivity;
  String name, token;
  Selecttraveldestinations(this.selectActivity, this.name,this.token,{Key? key}) : super(key: key);

  @override
  _SelecttraveldestinationsState createState(){
    return _SelecttraveldestinationsState(this.selectActivity,this.name,this.token);
  }
   
}



class _SelecttraveldestinationsState extends State<Selecttraveldestinations> {
  //final _formKey = GlobalKey<FormState>();
  late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data
  List<dynamic> _allUsers= [];
bool isSelected = false;
HashSet selectActivity;
String name, token;
_SelecttraveldestinationsState(this.selectActivity, this.name,this.token);

//List<String> items = [];

List<String> Cities = <String>['Sigiriya', 'Hanthana', 'Ella Rock', 'Bathalegala','Meemure','Haputhale', 'Kandy'];
List<String> images = ["sigiriya.jpg", "hanthana.jpg","ella.jpg", "bathalegala.jpg","meemure.jpg","haputale.jpg","kandy2.jpg"];
  
  HashSet selectItems = new HashSet();
  bool isMultiSelectionEnabled = true;

  getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });
      print(selectActivity);
      print(selectActivity.runtimeType);
      
      String url = "https://gocore.herokuapp.com/filterDestination/$selectActivity";
      //don't use "http://localhost/" use local IP or actual live URL

      Response response = await dio.get(url); 
      _allUsers = response.data; //get JSON decoded data from response
      print(_allUsers);
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

  // This function is called whenever the text field changes
  // void _runFilter(String enteredKeyword) {
  //   List<String> results = [];
  //   if (enteredKeyword.isEmpty) {
  //     // if the search field is empty or only contains white-space, we'll display all users
  //     results = items;
  //   } else {
  //     results = items
  //         .where((items) =>
  //             items.toLowerCase().contains(enteredKeyword.toLowerCase()))
  //         .toList();
  //     // we use the toLowerCase() method to make it case-insensitive
  //   }

  //   // Refresh the UI
  //   setState(() {
  //     items = results;
  //   });
  // }
  
  @override
  Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(
          // leading: GestureDetector(
          // child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          // onTap: () {
          //   Navigator.push(
          //                context,
          //                MaterialPageRoute(
          //                  builder: (context) => Selectactivities(name,token)));
          // } ,
          // ),
          //backgroundColor: const Color(0xFFF67715),
          title: Text('   Where do you like to go?',style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading:false
      ),

      
      body: WillPopScope(
        onWillPop: () async {
             Navigator.pop(context,selectActivity );
             return false;
          },
        child: Stack(
          children: [
      
           Container(  
            child: getChipSet()
           ),
      
            Positioned(
              top: 90,
              left: 12,
              right: 12,
              bottom: 0,
            child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      //mainAxisExtent: 264,
                      ), 
                    itemCount: _allUsers.length,
                  itemBuilder: (context, index) {
                    final img = _allUsers[index]['img'];
                    final acName = _allUsers[index]['destination'];
      
                      return getGridItem(img,acName);
                    }
                  ),
            ),
      
         //-- Start Button_Button--//
          Positioned(
            top: 670,
            left: 60,
            right: 60,
            bottom: 25,
            child: Container(
                margin: const EdgeInsets.all(5),
                
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                        //fixedSize: const Size(200,45), 
                        //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                        primary: Color(0xFF1554F6),
                                            
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            width: 2,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        ),
                       
                  onPressed: () async{
                    if (selectItems.isNotEmpty) {
                       print(selectActivity);
                       print(selectItems);
                       final boolData = await 
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Selectmoredetails(selectActivity,selectItems,name,token)));
                    }
                    else{
                      Fluttertoast.showToast(
                                    msg: 'Select a Destination',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.TOP,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor:Colors.white,
                                    fontSize:16.0);
                    }
                    },
                    child: const Text('Continue',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        )),
                ),
              ),)
              //-- End Button_Button--//
          ],
        ),
      )
        );   
}

 Positioned? getChipSet(){
 if (selectItems.isNotEmpty){
    return  Positioned(
            top: 0,
            left: 10,
            right: 10,
            bottom: 630,

      child:  Chip(
            label: 
            Flexible(
                  child: Text(
                    selectItems.join(', '),
                    maxLines: 4,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                ),
            
              padding: EdgeInsets.all(5.0),
              backgroundColor: Color(0xFFF67715),
               
          ),
      );
 } 
 else{
  return  Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(),);
 }
}


  
  
  void doMultiSelection(String img, String acName) {
    if (isMultiSelectionEnabled) {
      setState(() {
        if (selectItems.contains(acName)) {
          selectItems.remove(acName);
        } else {
          selectItems.add(acName);
        }
      });
    } else {
      //
    }
  }

  


   GridTile getGridItem(String img, String acName) {
    return GridTile(
      footer: Container(
        decoration: BoxDecoration(
                color: Color.fromARGB(115, 0, 0, 0),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(7),
          alignment: Alignment.center,
          
          child:  Text(
            acName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
            ),
          ),
        ),
      child: Container(
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
        child: InkWell(
          onTap: () {
            doMultiSelection(img,acName);
          },
          onLongPress: () {
            isMultiSelectionEnabled = true;
            doMultiSelection(img,acName);
          },
          child: Stack(
            children: [
              Container(
                        width: 200,
                        //height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "images/" + img,
                            ),
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(selectItems.contains(acName) ? 1 : 0), BlendMode.color),  

                          ),
                        ),
                      ),
              // Image.asset(
              //   "assets/" + item,
              //   color:
              //       Colors.black.withOpacity(selectItems.contains(item2) ? 1 : 0),
              //   colorBlendMode: BlendMode.color,
              // ),
              Visibility(
                  visible: selectItems.contains(acName),
                  // ignore: prefer_const_constructors
                  child: Align(
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.check,
                      color: Color(0xFFF67715),
                      size: 50,
                    ),
                  )
                  )
            ],
          ),
        ),
      ),
    );
  }
  
}