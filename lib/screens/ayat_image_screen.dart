import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class AyatImageScreen extends StatelessWidget {
  const AyatImageScreen(
      {super.key, required this.surahNumber, required this.ayatNumber});
  final int surahNumber;
  final int ayatNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          child: EasyImageView(
            imageProvider: NetworkImage(
              'https://cdn.islamic.network/quran/images/${surahNumber}_${ayatNumber}.png',
            ),
          ),
        ),
      ),
    );
  }
}
