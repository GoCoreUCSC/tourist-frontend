import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/signin.dart';


  
class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}
class _WelcomeState extends State<Welcome> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 4),
  //         ()=>Navigator.pushReplacement(context,
  //                                       MaterialPageRoute(builder:(context) => Signin())
  //                                      )
  //        );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
            padding: EdgeInsets.only(left: 20, top: 0,right: 20, bottom: 0,),
            child: Text(
                            "Welcome to GoCore",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 42,
                                color: Color.fromARGB(255, 4, 128, 185)),
                          ),
          ),
                        SizedBox(
                          height: 30,
                        ),

                        Padding(
                      padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                      
                          child: Text(
                            "Thank You for Signing Up with us",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          ),

          Container(
                color: Colors.white,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(20),
                child: Image.asset(
                'images/withSlogan.png',
                height: 300, width: 300,
                //fit: BoxFit.fitHeight,
                ),
              ),

        Container(
              margin: const EdgeInsets.all(5),
              width: 290,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 4, 128, 185),
                                          
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(
                          width: 2,
                          color: Color.fromARGB(255, 4, 128, 185),
                        ),
                      ),
                      ),
                onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Signin()));
                  
                  },
                  child: const Text('Proceed to Sign In',
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      )),
              ),
            ),
        ],
      ),
    );
  }
}