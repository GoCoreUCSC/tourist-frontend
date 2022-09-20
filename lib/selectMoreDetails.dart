import 'dart:collection';
//import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:frontend/tours.dart';
//import 'package:date_time_picker/selectMoreDetails.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'customizeDay.dart';
import 'destinationSelection.dart';


class Selectmoredetails extends StatefulWidget {
  String name, token;
  HashSet selectActivity;
  HashSet selectItems;
  Selectmoredetails( this.selectActivity, this.selectItems, this.name, this.token,{Key? key}) : super(key: key);

  @override
  _SelectmoredetailsState createState() 
  {
    return _SelectmoredetailsState(this.selectActivity,this.selectItems,this.name,this.token);
  }
  }

class _SelectmoredetailsState extends State<Selectmoredetails> {
String name, token;
  late String valueD;
  late String valueT;
  late String valueP;
  late String startDate;
  late String endDate;
  HashSet selectActivity;
  HashSet selectItems;
  _SelectmoredetailsState(this.selectActivity,this.selectItems,this.name,this.token);

final days = List<int>.generate(50, ((index) => index+1));
final travellers = List<int>.generate(50, ((index) => index+1)); 
final List<String> payments = ['Cash Payment','Card Payment', 'Both'];

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
        title: const Text('   More Details',style: TextStyle(color: Colors.white),),
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
    WillPopScope(
        onWillPop: () async {
             Navigator.pop(context,selectActivity );
             return false;
          },
         child: Form(
      key: _formKey,
      
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [


            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 90, 0),
              child: Text("Duration", style: TextStyle(color: Colors.black,fontSize: 19)),
              
            ),
           
           Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 220, 10),
             child: DropdownButtonFormField(
               
              //itemHeight: 50,
              decoration: InputDecoration(
                //labelText: "Days",
                // prefixIcon: const Icon(
                //   Icons.confirmation_number,
                //   color: Color(0xFF1554F6),
                // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                ),
              isExpanded: true,
              hint: const Text(
                'Days',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              iconSize: 30,
              dropdownColor: Color(0xFFD5E2F8),
              //  buttonHeight: 60,
              //  buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              //decoration: BoxDecoration(
              //    borderRadius: BorderRadius.circular(15),
              //  ),
              items: days
                      .map((item) =>
                      DropdownMenuItem<int>(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ))
                      .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select days.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
                 valueD = value.toString();
                
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
           
           ),

            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 90, 0),
              child: Text("No.of Travellers", style: TextStyle(color: Colors.black,fontSize: 19)),
              
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 220, 0),
              
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                // labelText: "Travellers",
                // prefixIcon: const Icon(
                //   Icons.confirmation_number,
                //   color: Color(0xFF1554F6),
                // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                ),
              isExpanded: true,
              hint: const Text(
                'Travellers',
                style: TextStyle(fontSize: 16, color:Colors.black),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              ),
              iconSize: 30,
              dropdownColor: const Color(0xFFD5E2F8),
              
              //buttonHeight: 60,
              //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              //dropdownDecoration: BoxDecoration(
                 //borderRadius: BorderRadius.circular(15),
               //),
              items: travellers
                      .map((item) =>
                      DropdownMenuItem<int>(
                        value: item,
                        child: Text(
                          item.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ))
                      .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select number of travellers.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
                valueT = value.toString();
              },
              onSaved: (value) {
                selectedValue = value.toString();
              },
            ),
 
            ),

      const SizedBox(height: 10),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 90, 0),
              child: Text("Start Date", style: TextStyle(color: Colors.black,fontSize: 19)),
              
        ),
        Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(10, 20, 120, 0),
              child: Text("End Date", style: TextStyle(color: Colors.black,fontSize: 19)),
              
        ),
        
      ],
),



      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        new Flexible(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
          child: new TextField(
            
              controller: dateInput,
              //editing controller of this TextField
              decoration: InputDecoration(
                 
                  // labelText: "YYYY-MM-DD",
                  // labelStyle: TextStyle(
                  //   fontSize: 16,
                  //   color: Colors.black,
                  // ),
                  suffixIcon:  Icon(Icons.calendar_month_sharp,color: Colors.black,),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                ),
                
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate1 = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
 
                if (pickedDate1 != null) {
                  print(
                      pickedDate1); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate1 =
                      DateFormat('yyyy-MM-dd').format(pickedDate1);
                  print(
                      formattedDate1); 
                  startDate = formattedDate1;//formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput.text =
                        formattedDate1; //set output date to TextField value.
                  });
                } else {}
              },
          ),
          ),
        ),
        new Flexible(
          
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 20, 0),
          child: new TextField(
              controller: dateInput2,
              //editing controller of this TextField
              
              decoration: InputDecoration(
                
                  // labelText: "YYYY-MM-DD",
                  // labelStyle: TextStyle(
                  //   fontSize: 16,
                  //   color: Colors.black,
                  // ),
                  suffixIcon: Icon(Icons.calendar_month_sharp,size: 25,color: Colors.black,), //icon of text field
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2100));
 
                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate);
                  endDate = formattedDate; //formatted date output using intl package =>  2021-03-16
                  setState(() {
                    dateInput2.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
          ),
          )
        ),
        
      ],
),

            

            const SizedBox(height: 10),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 20, 90, 0),
              child: Text("Payment Method", style: TextStyle(color: Colors.black,fontSize: 19)),
              
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: DropdownButtonFormField(
              decoration: InputDecoration(
                // labelText: "Payment Method",
                // prefixIcon: Icon(
                //   Icons.payments,
                //   color: Color(0xFF1554F6),
                // ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffF67715), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                ),
              isExpanded: true,
              hint: const Text(
                'Payments',
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
              items: payments
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
            

const SizedBox(height: 100),

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
                  
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Tours(valueD, valueT, valueP,selectActivity,selectItems,startDate, endDate,name,token)));
                  
                  },
                  child: const Text('View Tour',
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
      
    ),),
        );
    }
}


