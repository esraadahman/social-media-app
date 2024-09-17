import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/model/post.dart';
import 'package:facebook/post.dart';
import 'package:flutter/material.dart';

import 'Blogic/Auth.dart';

class SavedList extends StatefulWidget {
  const SavedList({super.key});

  @override
  State<SavedList> createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: const Text(
                'Saved List',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
        StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(Authentication.auth.currentUser!.uid).collection("saved_list").snapshots(),
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PostWidget(
                      post: postmodel(
                        username: snap.data!.docs[index]['username'],
                        userimage: snap.data!.docs[index]['userimage'],
                        post_image: snap.data!.docs[index]['postimage'],
                        des: snap.data!.docs[index]['title'],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),])
      ) ,
    );
  }
}