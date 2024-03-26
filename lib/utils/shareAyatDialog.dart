import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../screens/share_ayat_with_bg_screen.dart';

Future<String?> showMyAyatShareDialog(BuildContext context, String ayat,
    String surahNumberOrTitle, int ayatNumber) async {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 216, 200, 189),
        title: const Text(
          'Share Options',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffffae2138)),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: Color(0xffffae2138),
            ),
            InkWell(
              onTap: () async {
                // Handle option 1 tap
                Navigator.pop(context, 'Option 1');
                await Share.share(ayat);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Only Text',
                  style: TextStyle(
                    fontSize: 17,
                    //    color: Colors.black,
                    color: Color(0xffffae2138),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // Handle option 2 tap
                Navigator.pop(context, 'Option 2');
                Get.to(ShareAyatWithBgScreen(
                  text: ayat,
                  ayatNumber: ayatNumber,
                  surahNumberOrTitle: surahNumberOrTitle,
                ));
              },
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.blue,
                //   borderRadius: BorderRadius.circular(5),
                // ),

                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  'Text with Background',
                  style: TextStyle(
                    fontSize: 17,
                    //    color: Colors.black,
                    color: Color(0xffffae2138),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
