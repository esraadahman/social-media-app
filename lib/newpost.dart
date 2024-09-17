import 'dart:io';
import 'package:facebook/Blogic/firestore.dart';
import 'package:facebook/home.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class NewPost extends StatefulWidget {
  NewPost({super.key,required this.username,required this.userimage});
  String? username;
  String? userimage;


  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  bool getimage = false;
  File? file;
  TextEditingController title = TextEditingController();
  String url = "hassan";

  UploadImage_gallery() async {
    try{
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
        var downloadUrl = await ref.getDownloadURL();

        setState(() {
          // Update the URL after retrieval
          url = downloadUrl;
        });
      }
    }
    catch(error) {
      print("error: $error");
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
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(width: 30),
              CircleAvatar(
                  radius: 22,
                  backgroundColor:  Colors.white,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                    NetworkImage(widget.userimage!),
                  )),
              SizedBox(width: 10),
              Column(
                children: [
                  Text(
                    widget.username!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "public",
                    style: TextStyle(
                      color:  Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 160),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color:  Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: title,
            decoration: InputDecoration(
              hintText: "write a des for post?",
              hintStyle: TextStyle(
                color:  Colors.black,
                fontSize: 15,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color:  Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // enterpassword? true:false
          // enterpassword? home:reload
          getimage?
          Container(
            padding:EdgeInsets.fromLTRB(10, 10, 10, 0),
            margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
            height: 300,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                //image: FileImage(file!),
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ), border: Border.all(color: Colors.black,width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          )
              :
          GestureDetector(
            onTap:() {
              setState((){
                 SmartDialog.show(builder: (context){
                  return upload_way();
               // UploadImage_gallery();
                });

                });} ,
            child:
            Container(
                padding:EdgeInsets.fromLTRB(10, 10, 10, 0),
                margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: NetworkImage("https://as1.ftcdn.net/v2/jpg/01/87/97/86/1000_F_187978645_iclzUblZfGFri7fhyN8r0WPJgCYGOn8w.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                  border: Border.all(color: Colors.black,width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),child:
            Column(children: [
              Padding(
                padding:EdgeInsets.fromLTRB(10, 100, 0, 0),child:IconButton(
                icon: Icon(Icons.image_rounded, color: Colors.blue[900],size: 50,),
                onPressed: () {
                },
              ),),
              Center( child:Text("Add photo"),),
            ],)
            ),),

          Container(
              height: 50,
              width: 300,
              margin:EdgeInsets.fromLTRB( 10, 15, 0,0) ,
              child: ElevatedButton(
                child: const Text('post',style: TextStyle(
                    color: Colors.white),),
                onPressed: () async {
                  try{
                    await firestore.Add_post(widget.username!, widget.userimage!,url, title.text.trim()!);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));

                  }
                  catch(e){
                    print(e);
                  }

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the radius as needed
                  ),
                ),
              )
          ),

        ],
      ),

    );

  }}