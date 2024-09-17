import 'dart:io';
import 'package:facebook/Blogic/firestore.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path/path.dart';















import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:facebook/navie.dart';
import 'package:facebook/signup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(signup_info());
}

class signup_info extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<signup_info> {
  String selectedValue = "Egypt";
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Egypt"),value: "Egypt"),
      DropdownMenuItem(child: Text("USA"),value: "USA"),
      DropdownMenuItem(child: Text("Canada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ];
    return menuItems;
  }

  DateTime _selectedDate = DateTime.now(); // Initial selected date

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }}



  TextEditingController username = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    fname.dispose();
    lname.dispose();
    username.dispose();
    phone.dispose();
    code.dispose();
  }

  bool isChecked = false;

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            // appBar: AppBar(
            //   title: Text('Profile Screen'),
            // ),
            body: SingleChildScrollView(
                child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 50, 290, 0),
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          width: 50.0, // Set the width of the container
                          height: 50.0, // Set the height of the container
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Colors.blue[900], // Set the color of the circle
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signup()));
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 40.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(15, 30, 0, 0),
                            child: const Text(
                              'ACCOUNT',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                            child: const Text(
                              'INFORMATION',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        getimage?
                        GestureDetector(
                          onTap: () {
                          },
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage:FileImage(file!),
                          ),
                        )
                            :
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              SmartDialog.show(builder: (context) {
                                return upload_way();
                              });

                            });
                          },
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage:NetworkImage("https://th.bing.com/th/id/R.c98530977183534ed0e49e6db725bd7d?rik=qRXJBwOokn7dSQ&pid=ImgRaw&r=0"),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Column(children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                                  child: const Text(
                                    'first name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  )),
                              Container(
                                width: 180,
                                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                child: TextField(
                                  controller: fname,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'first name',
                                  ),
                                ),
                              ),
                            ]),
                            Column(children: [
                              Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                                  child: const Text(
                                    'last name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  )),
                              Container(
                                width: 180,
                                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                               // padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                child: TextField(
                                  controller: lname,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'last name',
                                  ),
                                ),
                              ),
                            ])
                          ],
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                            child: const Text(
                              'user name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )),
                        Container(
                          width: 350,
                          margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                          // padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                          child: TextField(
                            controller: username,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'user name',
                            ),
                          ),
                        ),
                        Row( children: [ Column(children: [
                          Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                              child: const Text(
                                'code',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              )),
                          Container(
                            width: 100,
                            margin: EdgeInsets.fromLTRB(10, 10, 30, 0),
                           // padding: EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: TextField(
                              controller: code,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'code',
                              ),
                            ),
                          ),],),Column(children: [
                        Container(
                            //alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                            child: const Text(
                              'phone',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20),
                            )),
                        Container(
                          width: 240,
                          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: TextField(
                            controller: phone,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'phone',
                            ),
                          ),
                        ),],)],),
                       Row(children: [
                         Container(
                           //alignment: Alignment.topLeft,
                             padding: EdgeInsets.fromLTRB(15, 25, 0, 0),
                             child: const Text(
                               'city',
                               style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w500,
                                   fontSize: 20),
                             )),
                         Container(
                             decoration:  BoxDecoration(
                              // color: Colors.pink,
                               border: Border.all(color: Colors.black,width: 2),
                               borderRadius: BorderRadius.all(Radius.circular(10)),),
                             margin: EdgeInsets.fromLTRB(150, 50,0, 20),
                           //  padding: EdgeInsets.fromLTRB(140, 25, 0, 0),
                            width: 150,
                             height: 40,
                             child:DropdownButton(
                                 isExpanded: true,
                                 hint: SizedBox(
                                   width: 150, height: 40, // Set the desired width here
                                   child: Text('Select a city'),
                                 ),
                             value: selectedValue,
                             icon: Icon(Icons.arrow_drop_down),
                             onChanged: (String? newValue){
                               setState(() {
                                 selectedValue = newValue!;
                               });
                             },
                             items: dropdownItems
                         ) )
                       ],),
                   Row(children: [
                        Text(
                          'Selecte Date of Birth:',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          '   ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}      ',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select Date'),
                        ),],),



                        Center(
                            child: Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (bool? value) {
                                isChecked = value ?? false;
                              },
                            ),
                            Text('Accept the Conditions'),
                          ],
                        )),
                        Container(
                            height: 50,
                            width: 300,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                try{
                                  String fullName = '${fname.text} ${lname.text}';
                                  String date = "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}";
                                  firestore.Add_user_info(fullName,username.text.trim(),phone.text.trim(),
                                      date, selectedValue,url, false,
                                  [],[]
                                  );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => navie()));

                                }
                                catch(e){
                                  print(e);
                                }

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[900],
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              ),
                            )),
                      ],
                    ))));
  }
}
