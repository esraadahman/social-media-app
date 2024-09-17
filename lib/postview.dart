import 'package:facebook/model/post.dart';
import 'package:facebook/post.dart';
import 'package:flutter/material.dart';


class PostView extends StatefulWidget {
  PostView({super.key,required this.post});
  postmodel? post;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PostWidget(post: widget.post!)),
    );
  }
}