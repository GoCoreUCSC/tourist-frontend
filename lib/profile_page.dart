import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/edit_profile.dart';
import 'package:frontend/signin.dart';

class ProfilePage extends StatefulWidget {
  String name, token;
  ProfilePage(this.name, this.token);
  //const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() {
     return _ProfilePageState(this.name,this.token); 
  }
}


class _ProfilePageState extends State<ProfilePage> {
  String name, token;
   late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = "";
  _ProfilePageState(this.name,this.token);
  List<dynamic> _Users= [];

getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });

      String url = "https://gocore.herokuapp.com/user/$token";
      //don't use "http://localhost/" use local IP or actual live URL

      Response response = await dio.get(url); 
      _Users = response.data; //get JSON decoded data from response
       
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60, left: 30),
              child: Row(
                children: [
                  const Text(
                    "Profile",
                    style: TextStyle(
                      color: Color(0xFF1554F6),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: const Icon(
                      Icons.headphones_rounded,
                      size: 27,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.maxFinite,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(-10.0, 10.0),
                          blurRadius: 20.0,
                          spreadRadius: 4.0,
                        ),],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, bottom: 15),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // image: NetworkImage(_Users[0]['image']),
                        image: AssetImage("images/image.jpeg"),
                      ),
                      
                      borderRadius: BorderRadius.circular(100),
                      color: Color(0xFF1554F6),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1554F6),
                        ),
                      ),
                      Text(
                        token,
                        style: TextStyle(
                          // shadows: [
                          //   Shadow(
                          //     offset: Offset(2, 2),
                          //     blurRadius: 3.0,
                          //     color: Colors.grey,
                          //   ),
                          //],
                          fontSize: 15.0,
                          color: Color(0xFF1554F6),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                 EditProfile(name,token)));
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Color(0xFF1554F6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.maxFinite,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(-10.0, 10.0),
                    blurRadius: 20.0,
                    spreadRadius: 4.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 15, top: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.person_outline_sharp,
                            size: 40,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text(
                                "My Account",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Make changes to your account",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 70),
                        Container(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                       EditProfile(name,token)));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 15, top: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.currency_pound,
                            size: 40,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text(
                                "Payment",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            const Text(
                              "Manage your payments",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 118),
                        Container(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         const EditProfile()));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  
                  const SizedBox(height: 15),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 12, bottom: 15, top: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.logout_rounded,
                            size: 35,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: const Text(
                                "Log-out",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 2),
                            // const Text(
                            //   "Further secure your account for safety",
                            //   style: TextStyle(
                            //     fontSize: 15.0,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(width: 220),
                        Container(
                          padding: const EdgeInsets.only(bottom: 13),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                       Signin()));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                'More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.maxFinite,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    offset: const Offset(-10.0, 10.0),
                    blurRadius: 20.0,
                    spreadRadius: 4.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 15, top: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.question_mark,
                            size: 30,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text(
                                "Help             ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 195),
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         const EditProfile()));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 15, top: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.settings,
                            size: 30,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 220),
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         const EditProfile()));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, bottom: 15, top: 10),
                          width: 50,
                          height: 50,
                          child: const Icon(
                            Icons.report_outlined,
                            size: 30,
                            color: Color(0xFF1554F6),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: const Text(
                                "About App",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 205),
                        Container(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         const EditProfile()));
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
