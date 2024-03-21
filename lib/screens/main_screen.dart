import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:light_bottom_navigation_bar/light_bottom_navigation_bar.dart';
import 'package:ramazan_app_new_v1/screens/dua_and_azkar_section.dart';
import 'package:ramazan_app_new_v1/screens/tasbeeh_counter_section.dart';

import 'Home_screen.dart';
import 'hadith_section_screen.dart';
import 'quran_section_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  RxInt currentIndex = 0.obs;

  List<Widget> screens = [
    QuranSectionScreen(),
    const HomeScreen(),
    const HadithSectionScreen(),
    DartAndAzkarSection(),
    TasbeehCounterSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.black,
      //  appBar: AppBar(
      //    title: const Text('Main Screen'),
      //  ),
      body: Obx(() {
        return screens[currentIndex.value];
      }),
      //////////////////////

      // bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
      //       backgroundColor: Colors.black,
      //       activeColor: Colors.amber,
      //       inactiveColor: Colors.grey,
      //       icons: const [
      //         FlutterIslamicIcons.quran2,
      //         FlutterIslamicIcons.allah,

      //         FlutterIslamicIcons.islam,
      //         FlutterIslamicIcons.islam,
      //         //  FlutterIslamicIcons.mohammad,
      //         FlutterIslamicIcons.muslim2,
      //       ],
      //       activeIndex: currentIndex.value,
      //       gapLocation: GapLocation.center,
      //       notchSmoothness: NotchSmoothness.defaultEdge,
      //       onTap: (index) {
      //         currentIndex.value = index;
      //         print(currentIndex);
      //       },
      //     )),

/////////////////////////////////////////////////////////
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Colors.black,
      //   currentIndex: currentIndex.value,
      //   onTap: (index) {},
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.red,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorites',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: 'Notifications',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
//////////////////////////////////////////////////////////
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: const [
      //     FlutterIslamicIcons.quran2,
      //     FlutterIslamicIcons.islam,
      //     FlutterIslamicIcons.muslim,
      //     FlutterIslamicIcons.prayer,
      //     FlutterIslamicIcons.tasbih2,
      //   ],
      //   //   gapLocation: GapLocation.end,

      //   elevation: 1,
      //   activeIndex: currentIndex.value,
      //   backgroundColor: Colors.black,
      //   activeColor: Colors.amber,
      //   inactiveColor: Colors.white,
      //   notchSmoothness: NotchSmoothness.verySmoothEdge,
      //   //  leftCornerRadius: 32,
      //   // rightCornerRadius: 32,
      //   onTap: (index) => setState(() => currentIndex.value = index),
      //   //other params
      // ),

      // bottomNavigationBar: LightBottomNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 48, 2, 55),
      //   currentIndex: currentIndex.value,
      //   items: const [
      //     LightBottomNavigationBarItem(
      //       // highlightColor: Colors.white,

      //       borderBottomColor: Colors.amber,
      //       selectedIconColor: Colors.amber,
      //       backgroundShadowColor: Colors.amber,
      //       selectedIcon: FlutterIslamicIcons.quran2,
      //       unSelectedIcon: FlutterIslamicIcons.quran2,
      //     ),
      //     LightBottomNavigationBarItem(
      //       borderBottomColor: Colors.amber,
      //       selectedIconColor: Colors.amber,
      //       backgroundShadowColor: Colors.amber,
      //       selectedIcon: FlutterIslamicIcons.islam,
      //       unSelectedIcon: FlutterIslamicIcons.islam,
      //     ),
      //     LightBottomNavigationBarItem(
      //       borderBottomColor: Colors.amber,
      //       selectedIconColor: Colors.amber,
      //       backgroundShadowColor: Colors.amber,
      //       selectedIcon: FlutterIslamicIcons.prayingPerson,
      //       unSelectedIcon: FlutterIslamicIcons.prayingPerson,
      //     ),
      //     LightBottomNavigationBarItem(
      //       borderBottomColor: Colors.amber,
      //       selectedIconColor: Colors.amber,
      //       backgroundShadowColor: Colors.amber,
      //       selectedIcon: FlutterIslamicIcons.prayer,
      //       unSelectedIcon: FlutterIslamicIcons.prayer,
      //     ),
      //     LightBottomNavigationBarItem(
      //       borderBottomColor: Colors.amber,
      //       selectedIconColor: Colors.amber,
      //       backgroundShadowColor: Colors.amber,
      //       selectedIcon: FlutterIslamicIcons.tasbih3,
      //       unSelectedIcon: FlutterIslamicIcons.tasbih3,
      //     ),
      //   ],
      //   onSelected: (index) {
      //     print('tab $index');
      //     currentIndex(index);
      //   },

      // ),

      bottomNavigationBar: Container(
        height: 92,
        margin: const EdgeInsets.only(left: 2, right: 2, bottom: 0),
        decoration: BoxDecoration(
            border: Border.all(
          width: 1.5,
          //   color: Color.fromARGB(114, 155, 95, 77), // Add outline color here
        )),
        child: BottomNavigationBar(
          // backgroundColor: Color.fromARGB(165, 155, 95, 77),
          backgroundColor: Color(0xffff9b5f4d),
          //  selectedItemColor: const Color(0xffd99658),
          unselectedFontSize: 0,

          //  selectedFontSize: 0,

          //  backgroundColor: const Color(0xff24003a),
          //  backgroundColor: Color.fromARGB(255, 155, 95, 77),
          currentIndex: currentIndex.value,
          showUnselectedLabels: true,
          // showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (value) {
            currentIndex.value = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIslamicIcons.solidTakbir,
                color: Colors.white,
                size: 33,
              ),
              label: 'Prayers',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIslamicIcons.solidQuran,
                color: Colors.white,
                size: 33,
              ),
              label: 'Hadith',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIslamicIcons.solidQuran2,
                color: Colors.white,
                size: 33,
              ),
              label: 'Quran',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FlutterIslamicIcons.solidPrayer,
                color: Colors.white,
                size: 33,
              ),
              label: 'Duas',
            ),
            BottomNavigationBarItem(
              // icon: Image.asset(
              //   'assets/icons/tasbih icon.png',
              //   width: 55,
              //   height: 55,
              // ),
              icon: Icon(
                FlutterIslamicIcons.tasbih3,
                color: Colors.white,
                size: 33,
              ),
              label: 'Tasbeeh',
            ),
          ],
        ),
      ),
    );
  }
}
