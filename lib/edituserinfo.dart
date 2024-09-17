import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/Blogic/firestore.dart';
import 'package:facebook/home.dart';
import 'package:facebook/navie.dart';
import 'package:facebook/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(edit_info());
}

class edit_info extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<edit_info> {
  static final auth=FirebaseAuth.instance;
   String? fullname; String? username1; String? phonenumber;
   String? dateofbirth; String? locetion; String? userimage; bool? isolder16;
  List<dynamic>? posts;  List<dynamic>? stories;

   Future<void> get_user_info() async{
    await FirebaseFirestore.instance.collection('users').doc(auth.currentUser!.uid).get().then((snapshot) {
      if(snapshot.exists){
        setState(() {
        fullname= snapshot.data()!['fullname'];
        username1 =snapshot.data()!['username'];
        dateofbirth =  snapshot.data()!['dateofbirth'];
        locetion =  snapshot.data()!['location'];
        phonenumber =  snapshot.data()!['phone'];
        userimage =  snapshot.data()!['userimage'];
        isolder16 =  snapshot.data()!['isolder16'];
        posts =  snapshot.data()!['posts'];
        stories =  snapshot.data()!['stories'];
        });
      }
      else print("no data");

    });
  }






  void initState(){
    super.initState();
    get_user_info();
  }


   String selectedValue = "Egypt" ;
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Egypt"), value: "Egypt"),
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
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
    }
  }

  TextEditingController username = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  // @override
  // void dispose() {
  //   super.dispose();
  //   fname.dispose();
  //   lname.dispose();
  //   username.dispose();
  //   phone.dispose();
  //   code.dispose();
  // }

  bool isChecked = false;
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
              children: [ Row(children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 50, 10, 0),
                  width: 50.0, // Set the width of the container
                  height: 50.0, // Set the height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[900], // Set the color of the circle
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(230, 50, 0, 0),
                  width: 50.0, // Set the width of the container
                  height: 50.0, // Set the height of the container
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue[900], // Set the color of the circle
                  ),
                  child: GestureDetector(
                    onTap: () {
                      try {
                        String fullName = '${fname.text} ${lname.text}';
                        String date =
                            "${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}";
                        firestore.Add_user_info(
                            fullName,
                            username.text.trim(),
                            phone.text.trim(),
                            date,
                            selectedValue,
                            "hhtttp",
                            false, [], []);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => home()));
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Icon(
                      Icons.check,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: const Text(
                      'Edit ACCOUNT',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: const Text(
                      'INFORMATION',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: fullname,
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
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: username1,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
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
                        ),
                      ],
                    ),
                    Column(
                      children: [
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
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText:phonenumber,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
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
                        decoration: BoxDecoration(
                          // color: Colors.pink,
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        margin: EdgeInsets.fromLTRB(150, 50, 0, 20),
                        //  padding: EdgeInsets.fromLTRB(140, 25, 0, 0),
                        width: 150,
                        height: 40,
                        child: DropdownButton(
                            isExpanded: true,
                            hint: SizedBox(
                              width: 150,
                              height: 40, // Set the desired width here
                              child: Text('Select a city'),
                            ),
                            value: selectedValue,
                            icon: Icon(Icons.arrow_drop_down),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: dropdownItems))
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Selecte Date of Birth:',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      dateofbirth!,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date'),
                    ),
                  ],
                ),
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

              ],
            ))));
  }
}
