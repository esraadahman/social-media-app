import 'package:facebook/model/storymodel.dart';
import 'package:facebook/story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryWidget extends StatefulWidget {
  StoryWidget({
    super.key,
    required this.story,
  });
  storymodel? story;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
           context, MaterialPageRoute(builder: (context) => story(s: widget.story!)

       ));
      },
      child:
    Container(
      margin: EdgeInsets.fromLTRB(0, 30, 20, 0),
          width: 60.w,
          height: 110.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(widget.story!.story_img!),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 10.r,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 8.r,
                        backgroundImage: NetworkImage(widget.story!.userimage!),
                      )),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.story!.username!,
                    style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}