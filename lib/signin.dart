import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/main_page.dart';
import 'package:frontend/services/authservice.dart';
import 'package:frontend/signup.dart';
import 'package:frontend/touristHome.dart';
import 'package:frontend/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/rendering/flex.dart';
//import 'activities.dart';
// import 'package:frontend/signup.dart';
// import 'package:frontend/dashboard.dart';
// import 'package:frontend/user.dart';


class Signin extends StatefulWidget {
Signin({Key? key}) : super(key: key);
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();

// Future save() async {
//     var res = await http.post("http://localhost:3000/signin",
//         headers: <String, String>{
//           'Context-Type': 'application/json;charSet=UTF-8'
//         },
//         body: <String, String>{
//           'username': user.username,
//           'password': user.password
//         });
//     print(res.body);
//     Navigator.push(
//         context, new MaterialPageRoute(builder: (context) => Dashboard()));
//   }

  // User user = User('', '');
  var email, password, token;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 30,
            child: SvgPicture.asset('images/top.svg',width:350, height:150 ,)),
            Positioned(
            bottom: 0,
            child: SvgPicture.asset('images/top1.svg',width:350, height:100 ,)),
            Container(
              // alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(
                        height: 40,
                      ),  
                      Container(
                      padding: EdgeInsets.only(right:200.0),
                      child: Image.asset('images/withoutSlogan.png',
                          height: 159, width: 208, ),
                    ),
                    SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sign In",
                        style: GoogleFonts.radioCanada(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Color(0xff1554F6)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: email),
                          onChanged: (value){
                            email= value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter something';
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Enter valid Username';
                            }
                          }, 
                          decoration: InputDecoration(
                            hintText: 'Username',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xff1554F6)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xff1554F6)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                      ),
              Padding( 
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: password),
                          obscureText: true,
                          onChanged: (value){
                            password= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter something';
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xff1554F6)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color(0xff1554F6)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                      ),
                      Padding(
                    padding: const EdgeInsets.fromLTRB(232, 3, 0, 15),
                    child: Row(
                      children: [
                        Text(
                          "Forgot your password ? ",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                      Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  // child: Container(
                  //   height: 50,
                  //   width: 400,
                  //   child: TextButton(
                  //       backgroundColor: Colors.blue,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16.0)),
                  //       onPressed: () {
                  //         if (_formKey.currentState.validate()) {
                  //           save();
                  //         } else {
                  //           print("not ok");
                  //         }
                  //       },
                  //       child: Text(
                  //         "Signin",
                  //         style: TextStyle(color: Colors.white, fontSize: 20),
                  //       )),
                  // ),
                    child:Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: TextButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   print("ok");
                            //   // save();
                            //  } else {
                            //     print("not ok");
                            //   }
                            // print(res.body);
                            // Navigator.push(
                            //     context, new MaterialPageRoute(builder: (context) => Signin1()));
                            {
                            AuthService().login(email, password).then((val) {
                              if (val.data['success']) {
                                token = val.data['token'];
                                // Fluttertoast.showToast(
                                  // msg: 'Authenticated',
                                  // toastLength: Toast.LENGTH_SHORT,
                                  // gravity: ToastGravity.BOTTOM,
                                  // timeInSecForIosWeb: 1,
                                  // backgroundColor: Colors.green,
                                  // textColor:Colors.white,
                                  // fontSize:16.0);
                                  AuthService().getinfo(token).then((val) {
                                  if (val.data['success']) {
                                    // print(val.data['msg']);
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) =>
                                            MainPage(val.data['msg'],email)));
                                            // TouristHome(val.data['msg'],token)));
                                            
                                  }
                                  else{print("error");}
                                }
                                );
                                }
                                }
                                );
                              } 
                            },
                            child: Text("Login", style: TextStyle(fontSize: 20),),
                            style: TextButton.styleFrom(
                              primary: Colors.white,  //Text Color
                              backgroundColor: Color(0xff1554F6),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                            ),
                          ),
                      ),
                    ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(115, 10, 115, 0),
                    child: Row(
                      children: [
                        Text(
                          "New to GoCore ? ",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Signup())
                                    );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 16,
                                color: Color(0xff1554F6),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                //     Padding(
                //   padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                //   // child: Container(
                //   //   height: 50,
                //   //   width: 400,
                //   //   child: TextButton(
                //   //       backgroundColor: Colors.blue,
                //   //       shape: RoundedRectangleBorder(
                //   //           borderRadius: BorderRadius.circular(16.0)),
                //   //       onPressed: () {
                //   //         if (_formKey.currentState.validate()) {
                //   //           save();
                //   //         } else {
                //   //           print("not ok");
                //   //         }
                //   //       },
                //   //       child: Text(
                //   //         "Signin",
                //   //         style: TextStyle(color: Colors.white, fontSize: 20),
                //   //       )),
                //   // ),
                //     child:Align(
                //       alignment: Alignment.center,
                //       child: SizedBox(
                //         height: 50,
                //         width: 300,
                //         child: TextButton(
                //           onPressed: () {
                //             // if (_formKey.currentState!.validate()) {
                //             //   print("ok");
                //             //   // save();
                //             //  } else {
                //             //     print("not ok");
                //             //   }
                //             {
                //             AuthService().addUser(name, password).then((val) {
                //                 Fluttertoast.showToast(
                //                   msg: val.data['msg'],
                //                   toastLength: Toast.LENGTH_SHORT,
                //                   gravity: ToastGravity.BOTTOM,
                //                   timeInSecForIosWeb: 1,
                //                   backgroundColor: Colors.green,
                //                   textColor:Colors.white,
                //                   fontSize:16.0
                //       );
                //                 });
                //               } 
                //             },
                //             child: Text("Add User", style: TextStyle(fontSize: 20),),
                //             style: TextButton.styleFrom(
                //               primary: Colors.white,  //Text Color
                //               backgroundColor: Color.fromARGB(255, 255, 131, 59),
                //               shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(16.0)),
                //             ),
                //           ),
                //       ),
                //     ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                //   // child: Container(
                //   //   height: 50,
                //   //   width: 400,
                //   //   child: TextButton(
                //   //       backgroundColor: Colors.blue,
                //   //       shape: RoundedRectangleBorder(
                //   //           borderRadius: BorderRadius.circular(16.0)),
                //   //       onPressed: () {
                //   //         if (_formKey.currentState.validate()) {
                //   //           save();
                //   //         } else {
                //   //           print("not ok");
                //   //         }
                //   //       },
                //   //       child: Text(
                //   //         "Signin",
                //   //         style: TextStyle(color: Colors.white, fontSize: 20),
                //   //       )),
                //   // ),
                //     child:Align(
                //       alignment: Alignment.center,
                //       child: SizedBox(
                //         height: 50,
                //         width: 300,
                //         child: TextButton(
                //           onPressed: () {
                //             // if (_formKey.currentState!.validate()) {
                //             //   print("ok");
                //             //   // save();
                //             //  } else {
                //             //     print("not ok");
                //             //   }
                //             {
                      //       AuthService().getinfo(token).then((val) {
                      //           Fluttertoast.showToast(
                      //             msg: val.data['msg'],
                      //             toastLength: Toast.LENGTH_SHORT,
                      //             gravity: ToastGravity.BOTTOM,
                      //             timeInSecForIosWeb: 1,
                      //             backgroundColor: Colors.green,
                      //             textColor:Colors.white,
                      //             fontSize:16.0
                      // );
                //                 });
                //               } 
                //             },
                //             child: Text("Get Info", style: TextStyle(fontSize: 20),),
                //             style: TextButton.styleFrom(
                //               primary: Colors.white,  //Text Color
                //               backgroundColor: Color.fromARGB(255, 255, 131, 59),
                //               shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(16.0)),
                //             ),
                //           ),
                //       ),
                //     ),
                // ),
        ],
                  ),
                ))
    ]));
  }
}

