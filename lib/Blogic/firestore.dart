import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/model/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/post.dart';
import '../model/storymodel.dart';

class firestore{
  static final auth=FirebaseAuth.instance;
 static String? fullname ;static String? username ; static String? phonenumber;
  static String? dateofbirth ;static String? locetion ;static String? userimage ;static bool? isolder16;
  static  List<dynamic>? posts ; static  List<dynamic>? stories;


  static Future<void> Add_user_info(String fullname , String username , String phonenumber,
    String dateofbirth , String locetion , String userimage , bool isolder16,
      List<postmodel> posts ,List<storymodel> stories
      ) async{
    await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).set({
      'fullname': fullname,
      'username': username,
      'dateofbirth' :dateofbirth,
      'location':locetion,
      'phone':phonenumber,
      'userimage':userimage,
      'isolder16':isolder16,
      'posts': posts,
       'stories':stories,
    });
    print("ADDED user info");
  }
  static Future<void> Add_story(  String? username,
      String? userimage,String? story_img, String? date) async{
    await FirebaseFirestore.instance.collection('stories').add({
      'userimage': userimage,
      'username': username,
      'storyimage' :story_img,
      'date':date,
      'userid':auth.currentUser!.uid,
    });
    print("ADDED story");
  }
  static Future<void> Add_post(  String? username,
      String? userimage,String? postimge, String? des) async{
    await FirebaseFirestore.instance.collection('posts').add({
      'userimage': userimage,
      'username': username,
      'postimage' :postimge,
      'des':des,
      'userid':auth.currentUser!.uid,
    });
    print("ADDED post");
  }
  static Future<void> AddSavedList(String username,String userimage,String postimage,String date,String title) async {
    await FirebaseFirestore.instance
        .collection('users').doc(auth.currentUser!.uid).collection("saved_list").add({
      'username':username,
      'userimage':userimage,
      'postimage':postimage,
      'date':date,
      'title':title,


    });
  }

}