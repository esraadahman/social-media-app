import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/edituserinfo.dart';
import 'package:facebook/model/storymodel.dart';
import 'package:facebook/profileposts.dart';
import 'package:facebook/storywedgit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Blogic/Auth.dart';
import 'model/profilepost.dart';

 void main() => runApp(profile());

class profile extends StatefulWidget {

  MyHome createState() => MyHome();
  }


class MyHome extends State<profile> {

  final auth = FirebaseAuth.instance;
  String fullname = '';
  String username = '';
  String userimage = '';
  int? posts_count;

  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          fullname = snapshot.data()!['fullname'];
          username = snapshot.data()!['username'];
          userimage = snapshot.data()!['userimage'];
        });
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserInfo();
  }



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
            Container(
                // height: 300,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        userimage),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                    bottom: Radius.zero, // This makes the bottom corner sharp
                  ),
                ),
                child: Column(children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 40,
                    width: 50,
                  margin: EdgeInsets.fromLTRB(310, 40, 0, 0),
                  //  padding: const EdgeInsets.fromLTRB(300, 0, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.edit,size: 30 ,color: Colors.white),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => edit_info()));
                      },
                    ),
                  ),//icon edit
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://th.bing.com/th/id/OIP.tdHz9WLVvfjMhvxSVJu5NAHaHa?rs=1&pid=ImgDetMain.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.black, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ), //user image
                  Container(
                    height: 900,
                    width: 400,
                    padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40.0),
                        bottom:
                            Radius.zero, // This makes the bottom corner sharp
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Text(
                          username,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '@${fullname}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 15, 0, 0),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '            12 k          ',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    '          followers          ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '98         ',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'funds           ',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    '$posts_count',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'posts',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(children: [
                          Container(
                              height: 50,
                              width: 300,
                              padding: const EdgeInsets.fromLTRB(5, 10, 10, 0),
                              child: ElevatedButton(
                                child: const Text(
                                  'puplic view',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[900],
                                  //  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Adjust the radius as needed
                                  ),
                                ),
                              )),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            height: 40,
                            width: 50,
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: IconButton(
                              icon: Icon(Icons.add, color: Colors.black),
                              onPressed: () {},
                            ),
                          ),
                        ]),
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                          child: Text(
                            'story',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                            height: 160.h,
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('stories')
                                  .where("userid", isEqualTo: Authentication.auth.currentUser!.uid)
                                  .snapshots(),
                              builder: (context, snap) {
                                if (snap.connectionState == ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                }
                                return ListView.builder(
                                  itemCount: snap.data!.docs.length,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 10.0),
                                      child: StoryWidget(
                                        story: storymodel(
                                            username: snap.data!.docs[index]['username'],
                                            userimage: snap.data!.docs[index]['userimage'],
                                            story_img: snap.data!.docs[index]['storyimage']),
                                      ),
                                    );
                                  },
                                );
                              },
                            )),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text(
                            'posts',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    Container(
    child: StreamBuilder(
    stream: FirebaseFirestore.instance
        .collection('posts')
        .where("userid", isEqualTo: Authentication.auth.currentUser!.uid)
        .snapshots(),
    builder: (context, snap) {
    if (!snap.hasData) {
    return CircularProgressIndicator();
    }
    return GridView.builder(
    itemCount: snap.data!.docs.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3),
    itemBuilder: (context, index) {
    posts_count=snap.data!.docs.length;
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ProfilePostWidget(
    profile: ProfilePost(
    username: snap.data!.docs[index]['username'],
    userimage: snap.data!.docs[index]['userimage'],
    posttitle: snap.data!.docs[index]['des'],
    postImg: snap.data!.docs[index]['postimage'],
    ),
    ));});}))

                      ],
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}
