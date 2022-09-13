import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:frontend/edit_profile.dart';
//import 'package:gocore_frontend/pages/navpages/edit_profile.dart';

class ProfilePage2 extends StatefulWidget {
  const ProfilePage2({Key? key}) : super(key: key);

  @override
  State<ProfilePage2> createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: Container(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: height * 0.065,
                  left: height * 0.036,
                  right: height * 0.036),
              child: Row(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: width * 0.076,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.headphones_rounded,
                    size: width * 0.0689,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.024),
            Container(
              margin:
                  EdgeInsets.only(left: width * 0.0509, right: width * 0.0509),
              width: double.maxFinite,
              height: height * 0.16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.0509),
                color: const Color.fromARGB(255, 23, 2, 247),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: width * 0.0381,
                            bottom: width * 0.0381,
                            top: width * 0.0381),
                        width: height * 0.12,
                        height: height * 0.12,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("images/dummy.png"),
                          ),
                          borderRadius: BorderRadius.circular(height * 0.12),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: width * 0.0509),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Anjani Menikdiwela",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "anjanimenikdiwela@gmail.com",
                            style: TextStyle(
                              shadows: const [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 3.0,
                                  color: Colors.grey,
                                ),
                              ],
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: width * 0.0509, bottom: width * 0.0509),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (BuildContext context) =>
                        //          EditProfile()));
                      },
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: width * 0.055,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.0301),
            Container(
              margin:
                  EdgeInsets.only(left: width * 0.0509, right: width * 0.0509),
              width: double.maxFinite,
              height: height * 0.32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(height * 0.012),
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
                    height: height * 0.068,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.0254,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.person_outline_sharp,
                                size: height * 0.0482,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.012),
                                  child: Text(
                                    "My Account",
                                    style: TextStyle(
                                      fontSize: width * 0.0381,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.0024),
                                Text(
                                  "Make changes to your account",
                                  style: TextStyle(
                                    fontSize: width * 0.0365,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
                          child: GestureDetector(
                            onTap: () {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //       builder: (BuildContext context) =>
                            //           const EditProfile()));
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
                  SizedBox(height: height * 0.012),
                  Container(
                    width: double.maxFinite,
                    height: height * 0.068,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.0254,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.currency_pound,
                                size: height * 0.0482,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.012),
                                  child: Text(
                                    "Payment",
                                    style: TextStyle(
                                      fontSize: width * 0.0381,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.0024),
                                Text(
                                  "Manage your payments",
                                  style: TextStyle(
                                    fontSize: width * 0.0365,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
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
                  SizedBox(height: height * 0.012),
                  Container(
                    width: double.maxFinite,
                    height: height * 0.068,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.0254,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.system_security_update_good_outlined,
                                size: height * 0.0482,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.012),
                                  child: Text(
                                    "Two-Factor Authentication",
                                    style: TextStyle(
                                      fontSize: width * 0.0381,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: height * 0.0024),
                                Text(
                                  "Further secure your account for safety",
                                  style: TextStyle(
                                    fontSize: width * 0.0365,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
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
                  SizedBox(height: height * 0.012),
                  Container(
                    width: double.maxFinite,
                    height: height * 0.065,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.03,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.logout_rounded,
                                size: height * 0.0482,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: height * 0.012),
                                  child: Text(
                                    "Log-out",
                                    style: TextStyle(
                                      fontSize: width * 0.0381,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(
                              right: width * 0.02, bottom: width * 0.03),
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
            SizedBox(height: height * 0.024),
            Container(
              margin: EdgeInsets.only(left: width * 0.0509),
              child: Text(
                'More',
                style: TextStyle(
                  fontSize: width * 0.0509,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: height * 0.0180),
            Container(
              margin:
                  EdgeInsets.only(left: width * 0.0509, right: width * 0.0509),
              width: double.maxFinite,
              height: height * 0.18,
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
                    height: height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.0254,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.question_mark,
                                size: height * 0.043,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Container(
                              child: Text(
                                "My Account",
                                style: TextStyle(
                                  fontSize: width * 0.0381,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
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
                    height: height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.0254,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.settings,
                                size: height * 0.04,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Container(
                              child: Text(
                                "Settings",
                                style: TextStyle(
                                  fontSize: width * 0.0381,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
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
                    height: height * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: width * 0.0254,
                                  bottom: width * 0.0381,
                                  top: width * 0.0254),
                              width: height * 0.0602,
                              height: height * 0.0602,
                              child: Icon(
                                Icons.report_outlined,
                                size: height * 0.04,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                            SizedBox(width: width * 0.0178),
                            Container(
                              child: Text(
                                "About App",
                                style: TextStyle(
                                  fontSize: width * 0.0381,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(width: 70),
                        Container(
                          margin: EdgeInsets.only(right: width * 0.02),
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
