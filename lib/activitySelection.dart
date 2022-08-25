import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:collection';
import 'package:frontend/touristHome.dart';
import 'destinationSelection.dart';
import 'main_page.dart';
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter/src/rendering/box.dart';
// import 'package:frontend/ui/pallete.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/rendering/box.dart';


class Selectactivities extends StatefulWidget {
  
  String name, token;
  //Selectactivities({Key? key}) : super(key: key);
  Selectactivities(this.name, this.token);
  @override
  _SelectactivitiesState createState(){
    return _SelectactivitiesState(this.name,this.token);
  }
}



class _SelectactivitiesState extends State<Selectactivities> {
String name, token;
// String name;
 _SelectactivitiesState(this.name,this.token);
List<String> Cities = ['Hiking', 'Surfing', 'Kayaking', 'Camping','Swimming', 'Beaching', 'Whale Watching', 'KiteSurfing', 'Wildlife Safari', 'Scuba Diving', 'Snorkelling'];

List<String> images = ["hiking.jpg", "ad1f6611-16d5-49ec-94da-98c1c7e0e186dc42015a-f16a-47ca-b3ad-330d5bee6557.jpg", "caption.jpg", "Camping-2-1024x513.jpg","poolside.jpg", "beaches-in-sri-lanka-14.jpg", "01-Measures.jpg", "1_Sri_Lanka_Kitesurf_Holiday_centre_view_800x533.jpg","image_0aac853a4d.jpg", "tourism-sri-lanka-diving-hikkaduwa-tourism-sri-lanka.jpg", "Snorkeling-in-kalpitiya-lagoon.jpg"];
  
  HashSet selectActivity = new HashSet();
  bool isMultiSelectionEnabled = true;
  


  @override

    

  Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(
          leading: GestureDetector(
          child: const Icon( Icons.arrow_back_ios, color: Colors.white,  ),
          onTap: () {
            Navigator.push(
                         context,
                         MaterialPageRoute(
                           builder: (context) =>  MainPage(name,token)));
          } ,
          ),
          //backgroundColor: const Color(0xFFF67715),
          title: Text('What do you like to do?',style: TextStyle(color: Colors.white),),
      ),

      
      body: Stack(
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
                  itemCount: Cities.length,
                  itemBuilder: (context, index) {
                    final item = images[index];
                    final item2 = Cities[index];

                    return getGridItem(item,item2);
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
                onPressed: () {
                  if (selectActivity.isNotEmpty) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  Selecttraveldestinations(selectActivity,name,token)));
                  }
                  else{
                    Fluttertoast.showToast(
                                  msg: 'Select an Activity',
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
      )     
        );
    
}


 Positioned? getChipSet(){
 if (selectActivity.isNotEmpty){
    return  Positioned(
            top: 0,
            left: 10,
            right: 10,
            bottom: 630,

      child:  Chip(
            label: 
            Flexible(
                  child: Text(
                    selectActivity.join(', '),
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
            
              padding: const EdgeInsets.all(5.0),
              backgroundColor: const Color(0xFFF67715),
               
          ),
      );
 } 
 else{
  return null;
 }
}


  String getSelectedItemCount() {
    return selectActivity.isNotEmpty
        ? selectActivity.length.toString() + " item selected"
        : "No item selected";
  }
  
  void doMultiSelection(String item, String item2) {
    if (isMultiSelectionEnabled) {
      setState(() {
        if (selectActivity.contains(item2)) {
          selectActivity.remove(item2);
        } else {
          selectActivity.add(item2);
        }
      });
    } else {
      //
    }
  }

   GridTile getGridItem(String item, String item2) {
    return GridTile(
      footer: Container(
          decoration: const BoxDecoration(
                color: Color.fromARGB(181, 255, 255, 255),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(7),
          alignment: Alignment.center,
          
          child:  Text(
            item2,
            style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 16,
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
            doMultiSelection(item,item2);
          },
          onLongPress: () {
            isMultiSelectionEnabled = true;
            doMultiSelection(item,item2);
          },
          child: Stack(
            children: [
              Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/" + item,
                              ),
                              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(selectActivity.contains(item2) ? 1 : 0), BlendMode.color), 
                          ),
                        ),
                      ),
              
              Visibility(
                  visible: selectActivity.contains(item2),
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