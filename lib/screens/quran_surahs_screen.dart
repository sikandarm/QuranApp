// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../constants/keys.dart';
// import 'surah_screen.dart';

// class QuranSurahsScreen extends StatelessWidget {
//   const QuranSurahsScreen({
//     super.key,
//     required this.language,
//     required this.title,
//     required this.textDirection,
//   });

//   final String language;
//   final String title;
//   final String textDirection;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //  backgroundColor: Colors.black54,
//       appBar: AppBar(
//         title: const Text('Surahs'),
//         elevation: 1,
//       ),
//       body: Column(
//         children: [
//           // Expanded(
//           //   child: GridView.builder(
//           //     itemCount: Keys.surahNames.length,
//           //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           //       crossAxisCount: 3, // Number of items in each row
//           //       mainAxisSpacing: 3.0, // Spacing between rows
//           //       crossAxisSpacing: 3.0, // Spacing between columns
//           //       childAspectRatio: 2 / 2.5, // Aspect ratio of each grid item
//           //     ),
//           //     itemBuilder: (BuildContext context, int index) {
//           //       return InkWell(
//           //         onTap: () {
//           //           Get.to(SurahScreen(
//           //             surahTitle: Keys.surahNames[index],
//           //             language: language,
//           //             title: title,
//           //             textDirection: textDirection,
//           //             surahNumber: index + 1,
//           //           ));
//           //         },
//           //         child: Card(
//           //           // shape: RoundedRectangleBorder(
//           //           //   borderRadius: BorderRadius.circular(13),
//           //           // ),
//           //           shape: RoundedRectangleBorder(
//           //             borderRadius: BorderRadius.circular(
//           //                 13.0), // Adjust border radius as needed
//           //             side: const BorderSide(
//           //               color: Colors.amber, // Specify the border color here
//           //               width: 0.5, // Adjust the border width as needed
//           //             ),
//           //           ),
//           //           child: Container(
//           //             child: Center(
//           //               child: Text(
//           //                 Keys.surahNames[index],
//           //                 style: const TextStyle(
//           //                   color: Colors.white,
//           //                   fontSize: 14.0,
//           //                   fontWeight: FontWeight.bold,
//           //                 ),
//           //               ),
//           //             ),
//           //           ),
//           //         ),
//           //       );
//           //     },
//           //   ),
//           // ),

//           Expanded(
//               child: ListView.builder(
//             itemCount: Keys.surahNames.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   Get.to(SurahScreen(
//                     surahTitle: Keys.surahNames[index],
//                     language: language,
//                     title: title,
//                     textDirection: textDirection,
//                     surahNumber: (index + 1),
//                   ));
//                 },
//                 child: Card(
//                   child: ListTile(
//                     leading: Chip(
//                       //  backgroundColor: Colors.transparent,
//                       backgroundColor: Colors.amber,
//                       elevation: 0,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(33)),
//                       // color: MaterialStatePropertyAll(Colors.amber),
//                       label: Text(
//                         (index + 1).toString(),
//                         style: const TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     trailing: Text(
//                       Keys.surahNamesArabic[index].toString(),
//                       style: const TextStyle(
//                         fontSize: 19,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     title: Text(
//                       Keys.surahNames[index],
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'verses: ' + Keys.surahAyats[index].toString(),
//                       style: const TextStyle(
//                         fontSize: 12,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/keys.dart';
import 'surah_screen.dart';

class QuranSurahsScreen extends StatefulWidget {
  const QuranSurahsScreen({
    Key? key,
    required this.language,
    required this.title,
    required this.textDirection,
  }) : super(key: key);

  final String language;
  final String title;
  final String textDirection;

  @override
  _QuranSurahsScreenState createState() => _QuranSurahsScreenState();
}

class _QuranSurahsScreenState extends State<QuranSurahsScreen> {
  int totalVerses = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Surahs'),
        elevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Keys.surahNames.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Calculate sum of verses up to the selected index
                    int sum = 0;

                    totalVerses = 0;

                    for (int i = 0; i < index; i++) {
                      sum += Keys.surahAyats[i];
                    }
                    setState(() {
                      totalVerses = sum;
                    });

                    print('TOTAL VERSES: ' + totalVerses.toString());
                    Get.to(SurahScreen(
                      totalPreviousVerses: totalVerses,
                      surahTitle: Keys.surahNames[index],
                      language: widget.language,
                      title: widget.title,
                      textDirection: widget.textDirection,
                      surahNumber: (index + 1),
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Chip(
                        backgroundColor: Colors.amber,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(33),
                        ),
                        label: Text(
                          (index + 1).toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      trailing: Text(
                        Keys.surahNamesArabic[index].toString(),
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      title: Text(
                        Keys.surahNames[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'verses: ' + Keys.surahAyats[index].toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Verses: $totalVerses',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
