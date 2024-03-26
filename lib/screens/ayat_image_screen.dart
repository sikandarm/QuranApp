import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AyatImageScreen extends StatelessWidget {
  const AyatImageScreen(
      {super.key, required this.surahNumber, required this.ayatNumber});
  final int surahNumber;
  final int ayatNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        //    fit: StackFit.expand,
        children: [
          Container(
            height: Get.height,
            child: Image.asset(
              'assets/images/peach_bg_motorolla_new.png',
              fit: BoxFit.cover,
            ),
          ),
          Image.asset(
            'assets/images/Ayat_frame_1.png',
            //  fit: BoxFit.cover,
            height: Get.height,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              child: EasyImageView(
                imageProvider: NetworkImage(
                  'https://cdn.islamic.network/quran/images/${surahNumber}_${ayatNumber}.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
