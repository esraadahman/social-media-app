import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/Blogic/firestore.dart';
import 'package:facebook/newpost.dart';
import 'package:facebook/newstory.dart';
import 'package:facebook/post.dart';
import 'package:facebook/savedlist.dart';
import 'package:facebook/setting.dart';
import 'package:facebook/story.dart';
import 'package:facebook/storywedgit.dart';
import 'package:facebook/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/post.dart';
import 'model/storymodel.dart';

void main() {


  runApp(home());}

class home extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<home> {

  bool isFavorite = false;
  bool isStarred = false;

  storymodel s=storymodel(story_img: "https://as2.ftcdn.net/v2/jpg/00/81/55/69/1000_F_81556974_8sF8cKszJaRfBGd5sDt1RXE2QbzDtQqs.jpg",
    username: "esraa dahman",
    userimage: "https://as2.ftcdn.net/v2/jpg/03/17/05/25/1000_F_317052595_sPhPHXXxyXpfZucFcc2Bb7uk4vbmv7Wd.jpg",
  );
  final auth = FirebaseAuth.instance;

  String? fullname = "";
  String? username = "";
  String? dateOfBirth = "";
  String? location = "";
  String? phonenumber = "";
  String? userimage = "";
  bool? isOlder16 = true;

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
          dateOfBirth = snapshot.data()!['dateofbirth'];
          location = snapshot.data()!['location'];
          phonenumber = snapshot.data()!['phone'];
          userimage = snapshot.data()!['userimage'];
          isOlder16 = snapshot.data()!['isolder16'];
        });
      } else {
        print('No data');
      }
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    print(auth.currentUser!.uid);
    print("State");
    GetUserInfo();
    print("State2");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,

        body:SingleChildScrollView(
            child:  Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 2, 0,0 ),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(userimage!),
                              fit: BoxFit.cover,
                            ), shape: BoxShape.circle,
                          ),),

                        Column(
                          children: [
                            Padding( padding: EdgeInsets.fromLTRB(0, 5, 0, 10), child:
                            Text(
                             username!,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]
                              ),
                            ),),
                            Text(
                              fullname!,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue[900]
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:EdgeInsets.fromLTRB(60, 0, 0, 0),child: IconButton(
                          icon: Icon(Icons.settings, color: Colors.blue[900]),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => sett()));
                          },

                        ),),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 0, 0, 0),child: IconButton(
                          icon: Icon(Icons.search, color: Colors.blue[900]),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => SavedList()));
                          },
                        ),),
                        Padding(
                          padding:EdgeInsets.fromLTRB(0, 0, 0, 0),child: IconButton(
                          icon: Icon(Icons.logout, color: Colors.blue[900]),
                          onPressed: () {
                            firestore.auth.signOut();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>welcome()));
                          },

                        ),),
                      ],
                    ),
                  ),
                  Container(
                      height: 160,
                  //    width: 100,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('stories')
                            .snapshots(),
                        builder: (context, snap) {
                          if (snap.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snap.data!.docs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: StoryWidget(
                                    story: storymodel(
                                      username: snap.data!.docs[index]['username'],
                                      userimage: snap.data!.docs[index]['userimage'],
                                      story_img: snap.data!.docs[index]['storyimage'],),
                                  ),
                                );
                              },
                            );
                          }
                        },
                      )),
                  Row(
                    children: [
                      Container(
                          height: 50,
                          margin:EdgeInsets.fromLTRB( 40, 10, 0,5) ,
                          // padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: ElevatedButton(
                            child: Row(children: [ Text("add post   ",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),),
                              Icon(Icons.add_a_photo_rounded, color: Colors.white),
                            ],),
                            onPressed: () {
                           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>signin()));
                               try{
                              //   firestore.Add_story("hassan", "imageuser", "story image", "1:33");
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPost(username: username, userimage: userimage)));
                               } catch(e){print(e);}
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
                          margin:EdgeInsets.fromLTRB( 15, 10, 0,5) ,
                          // padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: ElevatedButton(
                            child:
                            Row(children: [ Text("add story   ",style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),),
                              Icon(Icons.video_camera_front_sharp, color: Colors.white),
                            ],),
                            onPressed: () {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>NewStory(username: username, userimage: userimage)));
                                 },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Adjust the radius as needed
                              ),
                            ),
                          )),
                    ],
                  ),
                  Divider(),
            Container(
              //width: 500,
                child:
                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('posts').snapshots(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snap.data!.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot ds = snap.data!.docs[index];
                          return
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PostWidget(
                              post: postmodel(
                                username: snap.data!.docs[index]['username'],
                                userimage: snap.data!.docs[index]['userimage'],
                                post_image: snap.data!.docs[index]['postimage'],
                                des: snap.data!.docs[index]['des'],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ))
                ])
        ),










      ),);


  }


}
