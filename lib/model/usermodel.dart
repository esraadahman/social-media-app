import 'package:facebook/model/post.dart';
import 'package:facebook/model/storymodel.dart';

class usermodel{
  String? fullname;
  String? username;
  String? date_of_birth;
  String? location;
  String? phonenumber;
  String? userimage ;
  bool? isolder16;
  List<postmodel>? post ;
  List<storymodel>? stories;

  usermodel({this.fullname,this.username,this.date_of_birth,this.location,this.phonenumber,this.userimage
  ,this.isolder16,this.post,this.stories
  });


  }
