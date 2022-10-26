import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:frontend/selectMoreDetails.dart';
import 'package:frontend/tours.dart';
//import 'package:date_time_picker/selectMoreDetails.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

import 'customizeData.dart';
import 'customizeDay.dart';
import 'destinationSelection.dart';


class Customization extends StatefulWidget {
  Customization({Key? key}) : super(key: key);

  @override
  _CustomizationState createState() => _CustomizationState();}

class _CustomizationState extends State<Customization> {

  late String valueD;
  late String valueT;
  late String valueP;
  late String startDate;
  late String endDate;



final List<String> payments = ['A','B','C','D','E','F','G','H'];
final List<String> Destinations = ['Sigiriya','Ella','Meemure','Hanthana','Hikkaduwa','Haputhale'];
final List<String> Hotels = ['Hikka Tranz','Araliya','JetWing','Habarana Lodge','Cinnamon Red'];
final List<String> Transportation = ['Train','Bus','Car','Van','Caravan'];

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
    Widget build(BuildContext context){
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return Scaffold(
          appBar: AppBar(
        title: const Text('    Day 1',style: TextStyle(color: Colors.white),),
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
        automaticallyImplyLeading:false
        
      ),
    body: 
    // WillPopScope(
    //     // onWillPop: () async {
    //     //     //  Navigator.pop(context,selectActivity );
    //     //     //  return false;
    //     //   },
    //      child: 
         Form(
      key: _formKey,
      
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.all(5),
              width: 350,
              height: 360,
              
                child: ListView.builder(
        itemCount: Destinations.length,
        itemBuilder: (context, index) {
          int Number = index+1; 
          return SingleChildScrollView(
          child: Column(
              children: [
                Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 10, 90, 0),
              child: Text('Destination $Number', style: TextStyle(color: Colors.black,fontSize: 19)),
              
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
              readOnly: true,
              decoration: InputDecoration(
                hintText: Destinations[index],
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  prefixIcon: Icon(Icons.location_on_outlined, color: Colors.black,),
                  icon: Icon(
                  Icons.edit,
                  color: Color(0xFF1554F6),
                ),
                ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                      CustomizationEachData()));
              },
              
            ),
 
            ),
              ]
          )
          );
        },
      ),
            

   

        ),

            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 10, 90, 0),
              child: Text("Accomadation", style: TextStyle(color: Colors.black,fontSize: 19)),
              
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DropdownButtonFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  prefixIcon: Icon(Icons.hotel_outlined, color: Colors.black,),
                ),
              isExpanded: true,
              hint: const Text(
                'Accomadation',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              icon: const Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              iconSize: 30,
              dropdownColor: Color(0xFFD5E2F8),

              items: Hotels
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ))
                      .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select Payment Method.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
                valueP = value.toString();
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
 
            ),
            




            //const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 10, 90, 0),
              child: Text("Transportation", style: TextStyle(color: Colors.black,fontSize: 19)),
              
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DropdownButtonFormField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  prefixIcon: Icon(Icons.local_taxi_outlined, color: Colors.black,),
                ),
              isExpanded: true,
              hint: const Text(
                'Transportation',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              icon: const Icon(
                Icons.arrow_right,
                color: Colors.black,
              ),
              iconSize: 30,
              dropdownColor: Color(0xFFD5E2F8),
              // buttonHeight: 60,
              // buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              // dropdownDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              // ),
              items: Transportation
                      .map((item) =>
                      DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ))
                      .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select Payment Method.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
                valueP = value.toString();
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
 
            ),
            
      
            

const SizedBox(height: 10),

//-- Start Button_Button--//
        Positioned(
          top: 640,
          left: 50,
          right: 50,
          bottom: 15,
          child: Container(
              margin: const EdgeInsets.all(5),
              width: 290,
              height: 50,
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
                      // Fluttertoast.showToast(
                      //             msg: 'Select a Destination',
                      //             toastLength: Toast.LENGTH_SHORT,
                      //             gravity: ToastGravity.BOTTOM,
                      //             timeInSecForIosWeb: 1,
                      //             backgroundColor: Colors.red,
                      //             textColor:Colors.white,
                      //             fontSize:16.0);
                onPressed: () {
                  // if(valueD.isEmpty){
                  //   Fluttertoast.showToast(
                  //                 msg: 'Provide Duration',
                  //                 toastLength: Toast.LENGTH_SHORT,
                  //                 gravity: ToastGravity.CENTER,
                  //                 timeInSecForIosWeb: 1,
                  //                 backgroundColor: Colors.red,
                  //                 textColor:Colors.white,
                  //                 fontSize:16.0);
                  // }
                  // else if(valueT.isEmpty)
                  // {
                  //   Fluttertoast.showToast(
                  //                 msg: 'Provide Number of Travellers',
                  //                 toastLength: Toast.LENGTH_SHORT,
                  //                 gravity: ToastGravity.CENTER,
                  //                 timeInSecForIosWeb: 1,
                  //                 backgroundColor: Colors.red,
                  //                 textColor:Colors.white,
                  //                 fontSize:16.0);
                  // }
                  // else if(valueP.isEmpty)
                  // {
                  //   Fluttertoast.showToast(
                  //                 msg: 'Provide Payments Methods',
                  //                 toastLength: Toast.LENGTH_SHORT,
                  //                 gravity: ToastGravity.CENTER,
                  //                 timeInSecForIosWeb: 1,
                  //                 backgroundColor: Colors.red,
                  //                 textColor:Colors.white,
                  //                 fontSize:16.0);
                  // }
                  // else if(startDate.isEmpty)
                  // {
                  //   Fluttertoast.showToast(
                  //                 msg: 'Provide Start Date',
                  //                 toastLength: Toast.LENGTH_SHORT,
                  //                 gravity: ToastGravity.CENTER,
                  //                 timeInSecForIosWeb: 1,
                  //                 backgroundColor: Colors.red,
                  //                 textColor:Colors.white,
                  //                 fontSize:16.0);
                  // }
                  // else if(endDate.isEmpty)
                  // {
                  //   Fluttertoast.showToast(
                  //                 msg: 'Provide End Date',
                  //                 toastLength: Toast.LENGTH_SHORT,
                  //                 gravity: ToastGravity.CENTER,
                  //                 timeInSecForIosWeb: 1,
                  //                 backgroundColor: Colors.red,
                  //                 textColor:Colors.white,
                  //                 fontSize:16.0);
                  // }
                  // else if(valueD.isEmpty && valueT.isEmpty && valueP.isEmpty && startDate.isEmpty && endDate.isEmpty)
                  // {
                  //   Fluttertoast.showToast(
                  //                 msg: 'Provide Details',
                  //                 toastLength: Toast.LENGTH_SHORT,
                  //                 gravity: ToastGravity.CENTER,
                  //                 timeInSecForIosWeb: 1,
                  //                 backgroundColor: Colors.red,
                  //                 textColor:Colors.white,
                  //                 fontSize:16.0);
                  // }
                  
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => Tours(valueD, valueT, valueP,selectActivity,selectItems,startDate, endDate,name,token)));
                  
                  },
                  child: const Text('Next',
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
      
    ),
    //),
        );
    }
}


