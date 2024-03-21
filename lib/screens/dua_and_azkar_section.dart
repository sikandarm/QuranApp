import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/daily_dua_screen.dart';
import 'package:ramazan_app_new_v1/screens/dua_azkar_screen.dart';
import 'package:ramazan_app_new_v1/screens/hajj_and_umrah_screen.dart';
import 'package:ramazan_app_new_v1/screens/hisnul_muslim_screen.dart';
import 'package:ramazan_app_new_v1/screens/ramadan_dua_screen.dart';

class DartAndAzkarSection extends StatelessWidget {
  DartAndAzkarSection({super.key});

  List<String> headings = [
    'Azkar Dua',
    'Daily Dua',
    'Hisnul Muslim',
    'Ramadan Duas',
    'Hajj And Umrah',
  ];
  List<String> headingsArabic = [
    'اذكار دعاء',
    'الدعاء اليومي',
    'هسنول مسلم',
    'ادعية رمضان',
    'الحج والعمرة',
  ];

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.amber,
    );
    const valueStyle = TextStyle(
      color: Colors.white,
      //  fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dua and Azkar'),
      ),
      body: Column(
        children: [
          SizedBox(height: 21),
          Expanded(
            child: GridView.builder(
              itemCount: headings.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
                childAspectRatio: 2 / 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      if (index == 0) {
                        Get.to(DuaAzkarScreen(title: headings[index]));
                      }

                      if (index == 1) {
                        Get.to(DailyDuaScreen(
                          title: headings[index],
                        ));
                      }

                      if (index == 2) {
                        Get.to(HisnulMuslimScreen(
                          title: headings[index],
                        ));
                      }
                      if (index == 3) {
                        Get.to(RamadanDuaScreen(
                          title: headings[index],
                        ));
                      }

                      if (index == 4) {
                        Get.to(HajjAndUmrahScreen(
                          title: headings[index],
                        ));
                      }
                    },
                    child:
                        DuaAndAzkarTileCard(headingStyle, index, valueStyle));
              },
            ),
          ),
        ],
      ),
    );
  }

  Card DuaAndAzkarTileCard(
      TextStyle headingStyle, int i, TextStyle valueStyle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(
        //   color: Colors.amber,
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              //   hadithBooks[i],
              headings[i],
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: valueStyle,
            ),
            //  SizedBox(
            //    height: 4,
            //  ),
            Text(
              headingsArabic[i],
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: valueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
