import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/signin.dart';

  
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
          ()=>Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                          Signin()
                                                         )
                                       )
         );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(40),
          child: Image.asset(
          
          "images/withSlogan.png",
          height: 50,
          width: 50,
          //fit: BoxFit.fitHeight,
          ),
          

        );
  }
}