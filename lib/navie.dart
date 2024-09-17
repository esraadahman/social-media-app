import 'package:facebook/edituserinfo.dart';
import 'package:facebook/model/post.dart';
import 'package:facebook/model/storymodel.dart';
import 'package:facebook/post.dart';
import 'package:facebook/profile.dart';
import 'package:facebook/story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';import 'package:facebook/edituserinfo.dart';
import 'package:facebook/model/post.dart';
import 'package:facebook/model/storymodel.dart';
import 'package:facebook/post.dart';
import 'package:facebook/profile.dart';
import 'package:facebook/story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'home.dart';

class navie extends StatefulWidget {
  const navie({
    Key? key,
  }) : super(key: key);

  @override
  State<navie> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<navie> {
  postmodel p =postmodel(username:  'Esraa_Dahman',
      userimage: "https://as2.ftcdn.net/v2/jpg/03/17/05/25/1000_F_317052595_sPhPHXXxyXpfZucFcc2Bb7uk4vbmv7Wd.jpg"
      ,post_image:"https://as1.ftcdn.net/v2/jpg/01/87/97/86/1000_F_187978645_iclzUblZfGFri7fhyN8r0WPJgCYGOn8w.jpg" ,des: "vc");


  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              Icons.house_outlined,
            ),
            selectedIcon: const Icon(Icons.house_rounded),
            // selectedColor: Colors.teal,
            backgroundColor: Colors.blue.shade900,
            title: const Text('Home'),
          ),
          BottomBarItem(
            icon: const Icon(Icons.video_collection_outlined),
            selectedIcon: const Icon(Icons.video_collection),
            selectedColor: Colors.blue.shade900,
            unSelectedColor: Colors.blue.shade900,
            backgroundColor: Colors.blue.shade900,
            title: const Text('Video'),
          ),
          BottomBarItem(
              icon: const Icon(
                Icons.people,
              ),
              selectedIcon: const Icon(
                Icons.people_alt_rounded,
              ),
              selectedColor: Colors.blue.shade900,
              unSelectedColor: Colors.blue.shade900,
              backgroundColor: Colors.blue.shade900,
              title: const Text('Friends')),
          BottomBarItem(
              icon: const Icon(
                Icons.notifications_active_outlined,
              ),
              selectedIcon: const Icon(
                Icons.notifications_active,
              ),
              selectedColor: Colors.blue.shade900,
              unSelectedColor: Colors.blue.shade900,
              backgroundColor: Colors.blue.shade900,
              title: const Text('Notifi')),
          BottomBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              selectedColor: Colors.blue.shade900,
              unSelectedColor: Colors.blue.shade900,
              backgroundColor: Colors.blue.shade900,
              title: const Text('Profile')),

        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            heart = !heart;
          });
        },
        backgroundColor: Colors.white,
        child: Icon(
          heart ? CupertinoIcons.add_circled : CupertinoIcons.add_circled_solid,
          color: Colors.blue[900],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children:  [
            home(),
            PostWidget(post: p,),
            home(),
            profile()
          ],
        ),
      ),
    );
  }
}

