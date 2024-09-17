import 'dart:io';
import 'package:facebook/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:facebook/Blogic/firestore.dart';
class NewStory extends StatefulWidget {
  NewStory({super.key,required this.username,required this.userimage});
  String? username;
  String? userimage;
  @override
  State<NewStory> createState() => _NewStoryState();
}

class _NewStoryState extends State<NewStory> {
  bool getimage = false;
  File? file;
  TextEditingController title = TextEditingController();
  String url = "esraa";

  UploadImage_gallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image!.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  UploadImage_camera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file = File(image!.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  Widget upload_way() {
    return Container(
      padding: EdgeInsets.all(15),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color:  Colors.black,
          width: 2,
        ),
      ),
      child:
      Center(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await UploadImage_gallery();
                },
                child: Container(
                  height: 90,
                  width: 120,
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.image, size: 40, color:  Colors.blue[900]),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add from gallery',
                        style: TextStyle(
                            color:  Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await UploadImage_camera();
                },
                child: Container(
                  height: 90,
                  width: 120,
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.camera,
                          size: 40, color:  Colors.blue[900]),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Add from Camera',
                        style: TextStyle(
                            color:  Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            firestore.Add_story(
                widget.username!,
                widget.userimage!,
                url,
                "2:30");
            Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
          } catch (e) {
            print(e);
          }
        },
        child: Icon(
          Icons.upload,
          color: Colors.black,
        ),
        backgroundColor:Colors.white,
      ) );

  }
}