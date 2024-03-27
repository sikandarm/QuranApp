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
    const valueStyle = TextStyle(
      color: Color(0xffffae2138),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );

    const subTitleStyle = TextStyle(
      color: Color(0xffffae2138),
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dua and Azkar'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: Get.width,
            child: Image.asset(
              'assets/images/peach_bg_motorolla_new.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 11.0, vertical: 4.5),
            child: Column(
              children: [
                SizedBox(height: 17),
                Expanded(
                  child: GridView.builder(
                    itemCount: headings.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0,
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
                          child: DuaAndAzkarTileCard(
                              valueStyle, index, subTitleStyle));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget DuaAndAzkarTileCard(
      TextStyle headingStyle, int i, TextStyle valueStyle) {
    return Container(
      width: 165,
      height: 160,
      child: Card(
        margin: EdgeInsets.zero,
        color: Color.fromARGB(110, 216, 200, 189),
        elevation: 0,
        // color: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            side: const BorderSide(
              width: 2,
              color: Color(0xffffae2138),
            )),
        // side: BorderSide(
        //   color: Colors.amber,
        // ),

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
                style: headingStyle,
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
      ),
    );
  }
}
