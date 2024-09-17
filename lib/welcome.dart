import 'package:facebook/signin.dart';
import 'package:facebook/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(welcome());
}

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   // centerTitle: true,
            //   title: const   Text("Weather App"),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.add_alert_rounded,
//                 color: Colors.white,
//               ),
//               onPressed: () {
// // do something
//               },
//             )
//           ],
            //   ),
            body: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 200, 0, 60), //apply padding to all four sides
                    child: Image.network(
                        'https://as1.ftcdn.net/v2/jpg/02/69/32/86/1000_F_269328641_6PEsAYVSrGUdRhK4uzWkQcIBntPzZftV.jpg',
                        fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        10, 10, 0, 5), //apply padding to all four sides
                    child: Text(
                      'WELCOME TO FACEBOOK',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold,
                          // fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                  ),

                  Row(children: [
                    Container(
                        height: 50,
                        margin:EdgeInsets.fromLTRB( 30, 30, 0,0) ,
                        // padding:EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: ElevatedButton(
                          child: const Text('SIGN UP' ,style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.w500,
                              fontSize: 25),),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => signup()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                          ),
                        )),
                    Container(
                        height: 50,
                        margin:EdgeInsets.fromLTRB( 30, 30, 0,0) ,
                        // padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                        child: ElevatedButton(
                          child: const Text('SIGN IN',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              // fontWeight: FontWeight.w500,
                              fontSize: 25),),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  15.0), // Adjust the radius as needed
                            ),
                          ),
                        )),
                  ]),
                ]))));
  }
}
