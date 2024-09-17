import 'package:facebook/navie.dart';
import 'package:facebook/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Blogic/Auth.dart';
import 'firebase_options.dart';
import 'home.dart';
import 'main.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(signin());
}
class signin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MyHome()
    );
    // import 'package:facebook/navie.dart';
    // import 'package:facebook/welcome.dart';
    // import 'package:firebase_core/firebase_core.dart';
    // import 'package:flutter/material.dart';
    //
    // import 'Blogic/Auth.dart';
    // import 'firebase_options.dart';
    // import 'home.dart';
    // import 'main.dart';
    // void main() async{
    //   WidgetsFlutterBinding.ensureInitialized();
    //   await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );
    //
    //   runApp(signin());
    // }
    // class signin extends StatelessWidget {
    //
    // @override
    // Widget build(BuildContext context) {
    //
    // return MaterialApp(
    // debugShowCheckedModeBanner: false,
    // home:MyHome()
    // );
    // }
    // }
    //
    // class MyHome extends StatelessWidget {
    //
    // TextEditingController email_filed = TextEditingController();
    // TextEditingController pass_filed = TextEditingController();
    //
    // bool isChecked = false;
    // @override
    // Widget build(BuildContext context) {
    // return MaterialApp(
    // debugShowCheckedModeBanner: false,
    // home:
    // Scaffold(
    // backgroundColor: Colors.white,
    // // appBar: AppBar(
    // //   title: Text('Profile Screen'),
    // // ),
    // body: SingleChildScrollView(
    // child:Padding(
    // padding:EdgeInsets.fromLTRB(10, 16, 16, 5),// Outer padding for the entire screen
    // child:   Column(
    // children:[
    //
    // Container(
    // margin:EdgeInsets.fromLTRB( 0, 50, 290,0) ,
    // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
    // width: 50.0, // Set the width of the container
    // height: 50.0, // Set the height of the container
    // decoration: BoxDecoration(
    // shape: BoxShape.circle,
    // color: Colors.blue[900], // Set the color of the circle
    // ),
    // child: GestureDetector(
    // onTap: () {
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));
    // },
    // child: Icon(
    // Icons.arrow_back_ios,
    // size: 40.0,
    // color: Colors.white,
    // ),
    // ),),
    // Container(
    // alignment: Alignment.topLeft,
    // margin:EdgeInsets.fromLTRB( 10, 30, 0,0) ,
    // child: const Text(
    // 'LOGIN TO YOUR',
    // style: TextStyle(
    // color: Colors.black,
    // fontWeight: FontWeight.bold,
    // fontSize: 30),
    // )),
    // Container(
    // alignment: Alignment.topLeft,
    // margin:EdgeInsets.fromLTRB( 15, 10, 0,0) ,
    // child: const Text(
    // 'ACCOUNT',
    // style: TextStyle(
    // color: Colors.black,
    // fontWeight: FontWeight.bold,
    // fontSize: 30),
    // )),
    //
    // Container(
    // alignment: Alignment.topLeft,
    // padding:EdgeInsets.fromLTRB(20, 15, 0, 0),
    // child: const Text(
    // 'your Email',
    // style: TextStyle(
    // color: Colors.black,
    // fontWeight: FontWeight.w500,
    // fontSize: 20),
    // )),
    // Container(
    // padding: const EdgeInsets.all(10),
    // child: TextField(
    // controller: email_filed,
    // decoration: const InputDecoration(
    // border: OutlineInputBorder(),
    // labelText: 'User Email',
    // ),
    // ),
    // ),
    // Container(
    // alignment: Alignment.topLeft,
    // padding:EdgeInsets.fromLTRB(20, 15, 0, 0),
    // child: const Text(
    // 'Password',
    // style: TextStyle(
    // color: Colors.black,
    // fontWeight: FontWeight.w500,
    // fontSize: 20),
    // )),
    // Container(
    // padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    // child: TextField(
    // controller: pass_filed,
    // obscureText: true,
    // decoration: const InputDecoration(
    // border: OutlineInputBorder(),
    // labelText: 'Password',
    // ),
    // ),
    // ),
    // Center(
    // child: Row(
    // children: [
    // Checkbox(
    // value:true,
    // onChanged: (bool? value) {
    // isChecked = value ?? false;
    // },
    // ),
    // Text('Accept the Conditions'),
    // ],)),
    // Container(
    // height: 50,
    // width: 300,
    // margin:EdgeInsets.fromLTRB( 10, 15, 0,0) ,
    // child:
    // ElevatedButton(
    // child: const Text('Login',style: TextStyle(
    // color: Colors.white),),
    // onPressed: () {
    // try{
    //
    // Authentication.signin_with_email(email_filed.text.trim(),pass_filed.text.trim());
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>navie()));
    //
    // }
    // catch(e){
    // print(e);
    // }
    //
    // },
    // style: ElevatedButton.styleFrom(
    // backgroundColor: Colors.blue[900],
    // shadowColor: Colors.black,
    // shape: RoundedRectangleBorder(
    // borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
    // ),
    // ),
    // )
    // ),
    // Container(
    // height: 50,
    // width: 300,
    // margin:EdgeInsets.fromLTRB( 10, 10, 0,0) ,
    // child:ElevatedButton(
    // child: const Text('sign up with Google',style: TextStyle(
    // color: Colors.white),),
    // onPressed: () {
    // // try{
    // //   Authentication.signInWithGoogle();
    // //   Navigator.push(context, MaterialPageRoute(builder: (context)=>navie()));
    // // } catch(e){print(e);}
    // },
    // style: ElevatedButton.styleFrom(
    // backgroundColor: Colors.blue[900],
    // shadowColor: Colors.black,
    // shape: RoundedRectangleBorder(
    // borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
    // ),
    // ),
    // )
    // ),
    // ],
    // ))))
    // );
    //
    // }
    // }

  }
}

class MyHome extends StatelessWidget {

  TextEditingController email_filed = TextEditingController();
  TextEditingController pass_filed = TextEditingController();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   title: Text('Profile Screen'),
            // ),
            body: SingleChildScrollView(
        child:Padding(
                padding:EdgeInsets.fromLTRB(10, 16, 16, 5),// Outer padding for the entire screen
                child:   Column(
                  children:[

                    Container(
                      margin:EdgeInsets.fromLTRB( 0, 50, 290,0) ,
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: 50.0, // Set the width of the container
                      height: 50.0, // Set the height of the container
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue[900], // Set the color of the circle
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 40.0,
                          color: Colors.white,
                        ),
                      ),),
                    Container(
                        alignment: Alignment.topLeft,
                        margin:EdgeInsets.fromLTRB( 10, 30, 0,0) ,
                        child: const Text(
                          'LOGIN TO YOUR',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )),
                    Container(
                        alignment: Alignment.topLeft,
                        margin:EdgeInsets.fromLTRB( 15, 10, 0,0) ,
                        child: const Text(
                          'ACCOUNT',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )),

                    Container(
                        alignment: Alignment.topLeft,
                        padding:EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: const Text(
                          'your Email',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: email_filed,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Email',
                        ),
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding:EdgeInsets.fromLTRB(20, 15, 0, 0),
                        child: const Text(
                          'Password',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        )),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextField(
                        controller: pass_filed,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Center(
                        child: Row(
                          children: [
                            Checkbox(
                              value:true,
                              onChanged: (bool? value) {
                                isChecked = value ?? false;
                              },
                            ),
                            Text('Accept the Conditions'),
                          ],)),
                    Container(
                        height: 50,
                        width: 300,
                        margin:EdgeInsets.fromLTRB( 10, 15, 0,0) ,
                        child:
                        ElevatedButton(
                          child: const Text('Login',style: TextStyle(
                              color: Colors.white),),
                          onPressed: () {
                            try{

                              Authentication.signin_with_email(email_filed.text.trim(),pass_filed.text.trim());
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>navie()));

                            }
                            catch(e){
                              print(e);
                            }

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                            ),
                          ),
                        )
                    ),
                    Container(
                        height: 50,
                        width: 300,
                        margin:EdgeInsets.fromLTRB( 10, 10, 0,0) ,
                        child:ElevatedButton(
                          child: const Text('sign up with Google',style: TextStyle(
                              color: Colors.white),),
                          onPressed: () {
                            // try{
                            //   Authentication.signInWithGoogle();
                            //   Navigator.push(context, MaterialPageRoute(builder: (context)=>navie()));
                            // } catch(e){print(e);}
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                            ),
                          ),
                        )
                    ),
                  ],
                ))))
    );

  }
}
