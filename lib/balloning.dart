import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:google_fonts/google_fonts.dart';



class Ballooning extends  StatefulWidget {
  @override
  State<Ballooning> createState() => _BallooningState();
}

class _BallooningState extends State<Ballooning> {
  late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data
  
  List<dynamic> _allUsers= [];

  List<dynamic> _foundUsers=[];

  getData() async { 
      setState(() {
         loading = true;  //make loading true to show progressindicator
      });

      String url = "https://gocore.herokuapp.com/getactivities2";
      //don't use "http://localhost/" use local IP or actual live URL

      Response response = await dio.get(url); 
      _allUsers = response.data; //get JSON decoded data from response
       _foundUsers=_allUsers;
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


  void _runFilter(String enteredKeyword) {
    List<dynamic> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
      // print(_allUsers);
    } else {
      results = _allUsers
          .where((user) =>
              user["place"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  } 
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
          appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0), // here the desired height
          child:(AppBar(
        backgroundColor: Colors.transparent,
        // backgroundColor: Color(0xffF67715),
        elevation: 0.0,
      )),),
      body: 
      Container(
        // child: Padding(
        //   padding: const EdgeInsets.all(10),
          child: Column(
            children: [
               Positioned(
              top: 0,
              child: Image.asset('images/ballooningsl.jpg',fit: BoxFit.fill,height: 210, width:455,)),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Container(
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    style: TextStyle(color: Color.fromARGB(255, 31, 30, 30), fontSize: 14, ), 
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      filled: true,
                      labelStyle: TextStyle(color: Color.fromARGB(255, 31, 30, 30)),
                      fillColor: Color(0xFFFDFDFD),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                        labelText: 'Search your ballooning destinations.....', suffixIcon: Icon(Icons.search)),
                  ),
                   decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(96, 112, 112, 112),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _foundUsers.isNotEmpty
                    ? Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                       child: loading? //printing the JSON recieved
                       Center(
                        child:SizedBox(
                          child:CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Color(0xffF67715))),             
                         height: 3000.0,
                         width: 3000.0),
                       ):
                         ListView.builder(
                            itemCount: _foundUsers.length,
                            itemBuilder: (context, index) => 
                            InkWell(
                             onTap: () => null,
                            child:Card(
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              // side: BorderSide(color: Color(0xff1554F6), width: 2),
                              ),
                               child: Container(
                                //  padding: new EdgeInsets.all(15.0),
                                height:150,
                                    child: Row(
                                      children: [
                                        // Center(
                                        //   child: Expanded(
                                        //     child:ClipRRect(borderRadius: BorderRadius.circular(20.0),child: Image.asset('images/'+_foundUsers[index]['img'] )),
                                        //     flex:1 ,
                                        //       ),
                                        //       ),
                                              Container(
                                              width: 150,
                                              height: 150,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage('images/' + _foundUsers[index]['img']),
                                                ),
                                              ),
                                            ),
                                      Expanded(
                                        child:Container(
                                          padding: new EdgeInsets.all(15.0),
                                          alignment: Alignment.topLeft,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: ListTile(
                                                  title: Padding(
                                                    padding: const EdgeInsets.only(bottom: 10.0),
                                                    child: Text(_foundUsers[index]['place'], style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight: FontWeight.w700,),),
                                                  ),
                                                  subtitle: Text(_foundUsers[index]['description']),
                                                ),
                                              ),
                                                    ],
                                                  ),
                                                ),
                                      )
                      
                                      ],
                                    ),
                                    //  decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.withOpacity(0.3),
                                    //     offset: Offset(-10.0, 10.0),
                                    //     blurRadius: 20.0,
                                    //     spreadRadius: 4.0,
                                    //   ),
                                    // ],
                                    //  ),
                                  ),              
                                    key: ValueKey(_foundUsers[index]["id"]),
                                    color: Color.fromARGB(255, 253, 253, 253),
                                    // color: Color(0xff1554F6),
                                    elevation: 4,
                                    margin: const EdgeInsets.symmetric(vertical: 10,),
                                    
                                    // child: ListTile(
                                    //   leading: Text(
                                    //     _foundUsers[index]["id"].toString(),
                                    //     style: const TextStyle(fontSize: 24),
                                    //   ),
                                    //   title: Text(_foundUsers[index]['name']),
                                    //   subtitle: Text(
                                    //       '${_foundUsers[index]["age"].toString()} years old'),
                                    // ),
                            ),
                            
                            ),
                          ),
                    )
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 14),
                      ),
                  
              ),
            ],
          ),
        ),
        
      );
  
}

}