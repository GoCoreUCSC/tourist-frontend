import 'package:flutter/material.dart';
import 'package:frontend/selectMoreDetails.dart';
//import 'package:date_time_picker/selectMoreDetails.dart';
import 'package:intl/intl.dart';
import 'dart:convert';


class CustomizeDaysScreen extends StatefulWidget {
  // String valueD;
  // String valueT;
  // String valueP;
  // CustomizeDaysScreen(this.valueD,this.valueP,this.valueT, {Key? key}) : super(key: key);

  @override
  _CustomizeDaysScreenState createState() => _CustomizeDaysScreenState();
}

class _CustomizeDaysScreenState extends State<CustomizeDaysScreen> {
// String valueD;
//   String valueT;
//   String valueP;
//   _CustomizeDaysScreenState(this.valueD,this.valueP,this.valueT);

final days = List<int>.generate(50, ((index) => index+1));
final travellers = List<int>.generate(50, ((index) => index+1)); 
final List<String> payments = ['A','B','C','D','E','F','G','H'];

String? selectedValue;

final _formKey = GlobalKey<FormState>();

  get DatePicker => null;
  TextEditingController dateInput = TextEditingController();
  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

    @override
    Widget build(BuildContext context){
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return Scaffold(
          appBar: AppBar(
        title: const Text(
          'Day 1',
          style: TextStyle(color: Colors.white),
          ),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.support_agent_sharp, color: Colors.white,), onPressed: () {  },
      //     ),
      // ],
        
        backgroundColor: const Color(0xFFF67715),
        leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          onTap: () {
            // Navigator.push(
            //              context,
            //              MaterialPageRoute(
            //                builder: (context) => const Selectmoredetails()));
          } ,
        ) ,
        // Container(
        //   alignment: Alignment.topCenter,
        //   margin: EdgeInsets.only(top: 20),
        //   child: CircularProgressIndicator(
        //     backgroundColor: Colors.grey,
        //     color: Colors.purple,
        //     value: 0.8,
        //   )
        // ) ,

      ),
    body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

        //     SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        // child: 
        // Stack(
        //     children:[

              const SizedBox(
                height: 8,
              ),
              const Text("Destintion 1", style: TextStyle(color: Colors.black,fontSize: 24)),
              
              Container(
                height: 80,
            child:TextFormField(
              enabled: false, 
              decoration: InputDecoration(
                prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on),
                      color: Color(0xFF1554F6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  //hintText: valueD,
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      onPressed: () {Navigator.of(context).pop();},
                      icon: Icon(Icons.edit),
                      color: Color(0xFF1554F6),
                  ),

                ),  
            ),),
            
            
              const Text("Destintion 2", style: TextStyle(color: Colors.black,fontSize: 24)),
              
              Container(
                height: 80,
            child: TextFormField(
              enabled: false, 
              decoration: InputDecoration(
                prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on),
                      color: Color(0xFF1554F6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  hintText: 'Isurumuniya',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      onPressed: () {Navigator.of(context).pop();},
                      icon: Icon(Icons.edit),
                      color: Color(0xFF1554F6),
                  ),

                ),  
            ),),
          
            
            const Text("Destintion 3", style: TextStyle(color: Colors.black,fontSize: 24)),
             Container( 
              height: 80,
            child: TextFormField(
              enabled: false, 
              decoration: InputDecoration(
                prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_on),
                      color: Color(0xFF1554F6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  hintText: 'Isurumuniya',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      onPressed: () {Navigator.of(context).pop();},
                      icon: Icon(Icons.edit),
                      color: Color(0xFF1554F6),
                  ),

                ),  
            ),
          ),

            // ],
            // ),),

          const Text("Accomadation", textAlign: TextAlign.left, style: TextStyle(color: Colors.black,fontSize: 24)),
             Container( 
              height: 80,
            child: TextFormField(
              enabled: false, 
              decoration: InputDecoration(
                prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.holiday_village),
                      color: Color(0xFF1554F6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  hintText: 'Isi Arana',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      onPressed: () {Navigator.of(context).pop();},
                      icon: Icon(Icons.edit),
                      color: Color(0xFF1554F6),
                  ),

                ),  
            ),
          ),

          const Text("Transportation", style: TextStyle(color: Colors.black,fontSize: 24)),
             Container( 
              height: 80,
            child: TextFormField(
              enabled: false, 
              decoration: InputDecoration(
                prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.emoji_transportation),
                      color: Color(0xFF1554F6),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1554F6), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: false,
                  //fillColor: Colors.blueAccent,
                  hintText: 'Get Vehicle',
                  hintStyle: const TextStyle(fontSize: 14),
                  suffixIcon: IconButton(
                      onPressed: () {Navigator.of(context).pop();},
                      icon: Icon(Icons.edit),
                      color: Color(0xFF1554F6),
                  ),
                ),  
            ),
          ),



      const SizedBox(height: 10),
      


const SizedBox(height: 15),
//-- Start Button_Button--//
      Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 306,
              height: 58,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200,45), 
                      //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      primary: Color(0xFF1554F6),
                                          
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          width: 0,
                          //color: Colors.transparent,
                        ),
                      ),
                      ),
                onPressed: () {
                    
                  },
                  child: const Text('Continue',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      )),
              ),
            ),
          )
//-- End Button_Button--//

          ],
        ),
      ),
    ),
        );
    }
}


