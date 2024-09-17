import 'package:facebook/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/profilepost.dart';
import 'package:facebook/postview.dart';


class ProfilePostWidget extends StatefulWidget {
  ProfilePostWidget({
    super.key,
    required this.profile,
  });
  ProfilePost? profile;

  @override
  State<ProfilePostWidget> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePostWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>PostView(post: postmodel(username: widget.profile!.username,
                  post_image: widget.profile!.postImg,
                  userimage: widget.profile!.userimage,
                  des: widget.profile!.posttitle,
                ),) ));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black, width: 2.w),
        ),
        child: Image.network(
          widget.profile!.postImg!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}