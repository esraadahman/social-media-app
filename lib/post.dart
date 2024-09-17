import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:facebook/Blogic/firestore.dart';
import 'model/post.dart';

class PostWidget extends StatefulWidget {
  PostWidget({
    super.key,
    required this.post,
  });
  postmodel? post;

  @override
  State<PostWidget> createState() => _PostState();
}

class _PostState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => PostWidget(post: widget.post)));
      },
      child: Container(
        width: 500.w,
        height: 400.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 2.w, color: Colors.black),
        ),
        child: Column(children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                radius: 22.r,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.post!.userimage!),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '${widget.post!.username!}\n',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                width: 130.w,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      firestore.AddSavedList(
                          widget.post!.username!,
                          widget.post!.userimage!,
                          widget.post!.post_image!,
                          "3:30",
                          widget.post!.des!);
                    });
                  },
                  icon: Icon(
                    Icons.bookmark_outline,
                    size: 25,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.post!.des!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 300.w,
            height: 220.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: NetworkImage(widget.post!.post_image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Padding(
                padding:EdgeInsets.fromLTRB(30, 0, 0, 0),child: IconButton(
                icon: Icon(Icons.favorite, color: Colors.red[900],),
                onPressed: () {
                },
              ),),
              Text(
                '20',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[900]
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(15, 0, 0, 0),child: IconButton(
                icon: Icon(Icons.comment_rounded, color: Colors.blue[900],),
                onPressed: () {
                },
              ),),
              Text(
                '60',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[900]
                ),
              ),
              Padding(
                padding:EdgeInsets.fromLTRB(15, 0, 0, 0),child: IconButton(
                icon: Icon(Icons.star, color: Colors.yellow[800],),
                onPressed: () {
                },
              ),),
            ],
          ),
        ]),
      ),
    );
  }
}