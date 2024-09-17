import 'package:facebook/home.dart';
import 'package:facebook/model/storymodel.dart';
import 'package:facebook/navie.dart';
import 'package:flutter/material.dart';

 //void main() => runApp(story());

class story extends StatefulWidget {
   story({super.key,
    required this.s, });
   storymodel s;
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<story> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Scaffold(
          backgroundColor: Colors.white,
          // appBar:AppBar(
          //     backgroundColor: Colors.white,
          //     title:
          // ),
          body:SingleChildScrollView(
              child:
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.s.story_img!),
                      fit: BoxFit.cover,
                    ),   borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                    bottom: Radius.zero, // This makes the bottom corner sharp
                  ),

                  ),
                  child:
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child:
                            Padding(  padding: EdgeInsets.fromLTRB(5, 40, 0, 0), child:Divider(
                              color: Colors.black,
                              thickness: 3.0,
                              height: 20.0,
                            ),
                            ),), // Adjust spacing between dividers
                          Expanded(
                              child:  Padding(  padding: EdgeInsets.fromLTRB(5, 40, 0, 0), child: Divider(
                                color: Colors.black,
                                thickness: 3.0,
                                height: 20.0,
                              ),)
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 2, 0,0 ),
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(widget.s.userimage!),
                                  fit: BoxFit.cover,
                                ), shape: BoxShape.circle,
                              ),),

                            Column(
                              children: [
                                Padding( padding: EdgeInsets.fromLTRB(0, 5, 0, 10), child:
                                Text(
                                  widget.s.username!,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  ),
                                ),),
                                Text(
                                  '9:67 pm',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:EdgeInsets.fromLTRB(150, 0, 0, 0),child: IconButton(
                              icon: Icon(Icons.clear_sharp, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => home()));
                              },

                            ),),
                          ],
                        ),
                      ),
                      Row( children:[ Container(
                        width: 335,
                        padding: const EdgeInsets.fromLTRB(10, 600, 10, 0),
                        child: TextField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Send Reply',
                              filled: true,
                              fillColor: Colors.grey // Set your desired background color here
                          ),
                        ),
                      ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(5, 600, 0, 0),child: IconButton(
                          icon: Icon(Icons.send, color: Colors.white),
                          onPressed: () {
                          },

                        ),),

                      ])
                    ],
                  )


              ))
      ),);


  }


}
