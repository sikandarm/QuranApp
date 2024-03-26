import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ramazan_app_new_v1/screens/complete_quran_screen.dart';

import 'all_sadja_ayats_screen.dart';
import 'all_search_text_screen.dart';
import 'quran_editions_screen.dart';
import 'surah_meta_data_screen.dart';

class QuranSectionScreen extends StatelessWidget {
  QuranSectionScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const valueStyle = TextStyle(
      color: Color(0xffffae2138),
      fontWeight: FontWeight.bold,
    );

    const subTitleStyle = TextStyle(
      color: Color(0xffffae2138),
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );

    const cardColor = Color.fromARGB(146, 255, 223, 204);
    const cardBorderColor = Color(0xffffae2138);

    double cardElevation = 0.5;
    double cardBorderWidth = 2;

    return Scaffold(
      appBar: AppBar(
        //    backgroundColor: Color(0xffd99658),
        // backgroundColor: Color(0xffffd6c8),
        title: const Text(
          'Quran Section',
          // style: TextStyle(color: Color(0xffffbc735e)),
        ),
        elevation: 1,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Image.asset(
          //   'assets/images/peach_bg_motorolla.png',
          //   fit: BoxFit.cover,
          // ),
          Image.asset(
            'assets/images/peach_bg_motorolla_new.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 21),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(const QuranEditionsScreen());
                      },
                      child: Container(
                        width: 170,
                        height: 165,
                        child: Card(
                          elevation: cardElevation,
                          margin: EdgeInsets.zero,
                          //  color: const Color.fromARGB(57, 36, 0, 58),
                          //   color: Color.fromARGB(114, 155, 95, 77),
                          color: cardColor,

                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              // color: Color(0xffffcfbf),
                              color: cardBorderColor,
                              width: cardBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/quran edition icon.png',
                                  width: 55,
                                  height: 55,
                                ),
                                const SizedBox(height: 11),
                                Text(
                                  'Quran Editions'.toUpperCase(),
                                  style: valueStyle,
                                ),
                                const Text(
                                  'طبعات القرآن الكريم',
                                  style: subTitleStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      if (!formKey.currentState!.validate()) {
                                        return;
                                      }
                                      String text =
                                          searchTextController.text.trim();
                                      Navigator.pop(context);
                                      Get.to(AllSearchTextScreen(
                                        inputText: text.trim(),
                                      ));
                                    },
                                    child: const Text('Search'))
                              ],
                              title: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    const Text(
                                      'Search in Quran',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 4),
                                    TextFormField(
                                      controller: searchTextController,
                                      validator: (value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Please enter a text!';
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          hintText: 'Type a word'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        //   width: 175,
                        //    height: 172,

                        width: 170,
                        height: 165,
                        child: Card(
                          elevation: cardElevation,
                          margin: EdgeInsets.zero,
                          //  color: const Color.fromARGB(57, 36, 0, 58),
                          //   color: Color.fromARGB(114, 155, 95, 77),
                          color: cardColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: cardBorderColor,
                              width: cardBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/search word icon.png',
                                  width: 55,
                                  height: 55,
                                ),
                                const SizedBox(height: 11),
                                Text(
                                  'Search Word'.toUpperCase(),
                                  style: valueStyle,
                                ),
                                const Text(
                                  'كلمة البحث',
                                  style: subTitleStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(const AllSadjaAyatsScreen());
                      },
                      child: Container(
                        width: 170,
                        height: 165,
                        child: Card(
                          elevation: cardElevation,
                          margin: EdgeInsets.zero,
                          // color: const Color.fromARGB(57, 36, 0, 58),
                          //     color: Color.fromARGB(114, 155, 95, 77),
                          color: cardColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: cardBorderColor,
                              width: cardBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/sajda icon.png',
                                  width: 55,
                                  height: 55,
                                ),
                                const SizedBox(height: 11),
                                Text(
                                  'Sadja Ayats'.toUpperCase(),
                                  style: valueStyle,
                                ),
                                const Text(
                                  'ساجدة ايات',
                                  style: subTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Get.to(const SurahMetaDataScreen());
                      },
                      child: Container(
                        width: 170,
                        height: 165,
                        child: Card(
                          elevation: cardElevation,
                          margin: EdgeInsets.zero,
                          //  color: const Color.fromARGB(57, 36, 0, 58),
                          //    color: Color.fromARGB(114, 155, 95, 77),
                          color: cardColor,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: cardBorderColor,
                              width: cardBorderWidth,
                            ),
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(21.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/quran encyclopedia icon.png',
                                  width: 55,
                                  height: 55,
                                ),
                                const SizedBox(height: 11),
                                Text(
                                  'Encyclopedia'.toUpperCase(),
                                  style: valueStyle,
                                ),
                                const Text(
                                  'موسوعة',
                                  style: subTitleStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                InkWell(
                  onTap: () {
                    Get.to(const CompleteQuranScreen());
                  },
                  child: Container(
                    //    width: Get.width - 10,
                    width: MediaQuery.of(context).size.width * 0.965,
                    height: 172,
                    child: Card(
                      elevation: cardElevation,
                      margin: EdgeInsets.zero,
                      // color: const Color.fromARGB(57, 36, 0, 58),
                      //     color: Color.fromARGB(114, 155, 95, 77),
                      color: cardColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: cardBorderColor,
                          width: cardBorderWidth,
                        ),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(21.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/quran.png',
                              width: 55,
                              height: 55,
                            ),
                            const SizedBox(height: 11),
                            Text(
                              'Quran Complete'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: valueStyle,
                            ),
                            const Text(
                              'القرآن كاملا',
                              style: subTitleStyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ramazan_app_new_v1/screens/complete_quran_screen.dart';
// import 'all_sadja_ayats_screen.dart';
// import 'all_search_text_screen.dart';
// import 'quran_editions_screen.dart';
// import 'surah_meta_data_screen.dart';

// class QuranSectionScreen extends StatelessWidget {
//   QuranSectionScreen({Key? key}) : super(key: key);

//   final formKey = GlobalKey<FormState>();
//   final TextEditingController searchTextController = TextEditingController();

//   // TextStyle valueStyle = const TextStyle(
//   //   //  color: Colors.white,
//   //   // color: Color(0xffffae2138),
//   //   color: Colors.red,
//   //   fontWeight: FontWeight.bold,
//   //   fontSize: 209,
//   // );

//   final BoxDecoration cardDecoration = BoxDecoration(
//     color: const Color.fromARGB(114, 155, 95, 77),
//     borderRadius: BorderRadius.circular(11.0),
//     border: Border.all(
//       color: const Color(0xffffcfbf),
//       width: 2,
//     ),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //   backgroundColor: const Color(0xffffdfcc),
//         title: const Text(
//           'Quran Section',
//         ),
//         //    elevation: 1,
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/images/peach_bg_motorolla.png',
//             fit: BoxFit.cover,
//           ),
//           Column(
//             children: [
//               const SizedBox(height: 21),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   buildFeatureCard(
//                     width: 170,
//                     height: 170,
//                     onPressed: () => Get.to(const QuranEditionsScreen()),
//                     iconPath: 'assets/icons/quran edition icon.png',
//                     title: 'Quran Editions',
//                     subTitle: 'طبعات القرآن الكريم',
//                   ),
//                   SizedBox(width: 7),
//                   buildFeatureCard(
//                     width: 170,
//                     height: 170,
//                     onPressed: () => showSearchDialog(context),
//                     iconPath: 'assets/icons/search word icon.png',
//                     title: 'Search Word',
//                     subTitle: 'كلمة البحث',
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 7,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   buildFeatureCard(
//                     width: 170,
//                     height: 170,
//                     onPressed: () => Get.to(const AllSadjaAyatsScreen()),
//                     iconPath: 'assets/icons/sajda icon.png',
//                     title: 'Sadja Ayats',
//                     subTitle: 'ساجدة ايات',
//                   ),
//                   SizedBox(width: 7),
//                   buildFeatureCard(
//                     width: 170,
//                     height: 170,
//                     onPressed: () => Get.to(const SurahMetaDataScreen()),
//                     iconPath: 'assets/icons/quran encyclopedia icon.png',
//                     title: 'Encyclopedia',
//                     subTitle: 'موسوعة',
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
//                 child: buildFeatureCard(
//                   width: Get.width,
//                   height: 170,
//                   onPressed: () => Get.to(const CompleteQuranScreen()),
//                   iconPath: 'assets/icons/quran.png',
//                   title: 'Quran Complete',
//                   subTitle: 'القرآن كاملا',
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildFeatureCard({
//     required double width,
//     required double height,
//     required VoidCallback onPressed,
//     required String iconPath,
//     required String title,
//     required String subTitle,
//   }) {
//     return InkWell(
//       onTap: onPressed,
//       child: Container(
//         //   width: 180,
//         //   height: 180,
//         width: width,
//         height: height,

//         child: Card(
//           margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//           //  color: Colors.transparent,

//           //    color: Color.fromARGB(0, 255, 223, 204),
//           color: Color.fromARGB(255, 255, 223, 204).withOpacity(0.1),

//           elevation: 0,

//           shape: RoundedRectangleBorder(
//             side: BorderSide(
//               color: Color(
//                 0xffffae2138,
//               ),
//               width: 1.7,
//             ),
//             borderRadius: BorderRadius.circular(
//               11.0,
//             ),
//           ),
//           child: Container(
//             decoration: cardDecoration,
//             child: Padding(
//               padding: const EdgeInsets.all(21.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     iconPath,
//                     width: 55,
//                     height: 55,
//                   ),
//                   const SizedBox(height: 11),
//                   Text(
//                     title.toUpperCase(),
//                     style: const TextStyle(
//                       color: Color(0xffffae2138),

//                       fontWeight: FontWeight.bold,
//                       //    fontSize: 20,
//                     ),
//                   ),
//                   Text(
//                     subTitle,
//                     style: const TextStyle(
//                       color: Color(0xffffae2138),
//                       fontWeight: FontWeight.w600,
//                       fontSize: 12,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void showSearchDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           actions: [
//             ElevatedButton(
//               onPressed: () async {
//                 if (!formKey.currentState!.validate()) {
//                   return;
//                 }
//                 String text = searchTextController.text.trim();
//                 Navigator.pop(context);
//                 Get.to(AllSearchTextScreen(inputText: text.trim()));
//               },
//               child: const Text('Search'),
//             )
//           ],
//           title: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 const Text(
//                   'Search in Quran',
//                   style: TextStyle(fontSize: 18),
//                 ),
//                 const SizedBox(height: 4),
//                 TextFormField(
//                   controller: searchTextController,
//                   validator: (value) {
//                     if (value!.trim().isEmpty) {
//                       return 'Please enter a text!';
//                     }
//                     return null;
//                   },
//                   decoration: const InputDecoration(
//                     hintText: 'Type a word',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
