// import 'dart:async';

// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:ionicons/ionicons.dart';
// import 'package:ramazan_app/screens/quran_surahs_screen.dart';

// import '../controller/commonController.dart';
// import '../models/quran_editions_model.dart';

// class QuranEditionsScreen extends StatefulWidget {
//   const QuranEditionsScreen({super.key});

//   @override
//   State<QuranEditionsScreen> createState() => _QuranSectionScreenState();
// }

// class _QuranSectionScreenState extends State<QuranEditionsScreen> {
//   var controller = null;
//   RxBool isLoading = true.obs;

//   @override
//   void didChangeDependencies() {
//     callApiMethods();
//     super.didChangeDependencies();
//   }

//   Future<void> callApiMethods() async {
//     isLoading = true.obs;
//     controller = Get.put(CommonController());
//     // await fetchAllQuranEditions();
//     controller.allQuranEditionsController.value = await fetchQuranEditions();
//     isLoading = false.obs;
//     setState(() {});
//   }

//   RxInt currentIndex = 0.obs;
//   Future<void> fetchAllQuranEditions() async {
//     // controller.allQuranEditionsController.value = await fetchQuranEditions();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const headingStyle = TextStyle(
//       fontWeight: FontWeight.bold,
//       color: Colors.amber,
//     );
//     const valueStyle = TextStyle(
//       //  fontWeight: FontWeight.bold,
//       color: Colors.white,
//     );

//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(
//         title: const Text('Quran Editions'),
//         elevation: 1,
//       ),
//       body: Obx(() {
//         return isLoading.isTrue
//             ? const Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (int i = 0;
//                         i <
//                             controller
//                                 .allQuranEditionsController.value.data!.length;
//                         i++) ...{
//                       InkWell(
//                         onTap: () {
//                           Get.to(QuranSurahsScreen(
//                             language: controller.allQuranEditionsController
//                                 .value.data[i].language,
//                             title: controller
//                                 .allQuranEditionsController.value.data[i].name,
//                             textDirection: controller.allQuranEditionsController
//                                 .value.data[i].direction,
//                           ));
//                         },
//                         child:
//                             QuranEditionTileCard(headingStyle, i, valueStyle),
//                       )
//                     }
//                   ],
//                 ),
//               );
//       })

//       // bottomNavigationBar: BottomNavigationBar(items: [
//       //   BottomNavigationBarItem(
//       //     label: 'Quran Editions',
//       //     icon: Icon(Icons.quora_rounded),
//       //   ),
//       //   BottomNavigationBarItem(
//       //     label: 'Quran Editions',
//       //     icon: Icon(Icons.quora_rounded),
//       //   ),
//       // ]),
//       ,
//       bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
//             backgroundColor: Colors.black,
//             activeColor: Colors.amber,
//             inactiveColor: Colors.grey,
//             icons: const [
//               Icons.quora,
//               Icons.quora,
//             ],

//             activeIndex: currentIndex.value,
//             gapLocation: GapLocation.center,
//             notchSmoothness: NotchSmoothness.defaultEdge,
//             onTap: (index) {
//               print(index);
//               currentIndex.value = index;
//             },

//             //other params
//           )),
//     );
//   }

//   Card QuranEditionTileCard(
//       TextStyle headingStyle, int i, TextStyle valueStyle) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(13.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Text('Title: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller.allQuranEditionsController.value.data![i].name!,
//                   softWrap: true,
//                   overflow: TextOverflow.ellipsis,
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.amber,
//               thickness: 0.5,
//             ),
//             Row(
//               children: [
//                 Text('English Title: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller.allQuranEditionsController.value.data![i]
//                               .englishName
//                               .toString()
//                               .length <=
//                           26
//                       ? controller.allQuranEditionsController.value.data![i]
//                           .englishName!
//                       : '${controller.allQuranEditionsController.value.data![i].englishName!.toString().substring(0, 22)}...',
//                   softWrap: true,
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.amber,
//               thickness: 0.5,
//             ),
//             // Row(
//             //   children: [
//             //     Text('Format: '),
//             //     Spacer(),
//             //     Text(controller
//             //         .allQuranEditionsController.value.data![i].format!),
//             //   ],
//             // ),
//             // Divider(
//             //   color: Colors.amber,
//             // ),
//             Row(
//               children: [
//                 Text('Direction: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller.allQuranEditionsController.value.data![i].direction
//                       .toString(),
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.amber,
//               thickness: 0.5,
//             ),
//             Row(
//               children: [
//                 Text('Language: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller
//                       .allQuranEditionsController.value.data![i].language!,
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

/////////////////////////////////////////////////////////

// import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ramazan_app/models/quran_editions_model.dart';
// import '../controller/commonController.dart';
// import 'quran_surahs_screen.dart';

// class QuranEditionsScreen extends StatefulWidget {
//   const QuranEditionsScreen({Key? key});

//   @override
//   State<QuranEditionsScreen> createState() => _QuranEditionsScreenState();
// }

// class _QuranEditionsScreenState extends State<QuranEditionsScreen> {
//   final CommonController controller = Get.put(CommonController());
//   late RxBool isLoading;

//   @override
//   void initState() {
//     super.initState();
//     isLoading = true.obs;
//     callApiMethods();
//   }

//   Future<void> callApiMethods() async {
//     isLoading(true);
//     controller.allQuranEditionsController.value = await fetchQuranEditions();
//     isLoading(false);
//   }

//   RxInt currentIndex = 0.obs;

//   @override
//   Widget build(BuildContext context) {
//     const headingStyle = TextStyle(
//       fontWeight: FontWeight.bold,
//       color: Colors.amber,
//     );
//     const valueStyle = TextStyle(
//       color: Colors.white,
//     );

//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(
//         title: const Text('Quran Editions'),
//         elevation: 1,
//       ),
//       body: Obx(() {
//         return isLoading.isTrue
//             ? const Center(child: CircularProgressIndicator())
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (int i = 0;
//                         i <
//                             controller
//                                 .allQuranEditionsController.value.data!.length;
//                         i++) ...{
//                       InkWell(
//                         onTap: () {
//                           Get.to(QuranSurahsScreen(
//                             language: controller.allQuranEditionsController
//                                 .value.data![i].language!,
//                             title: controller.allQuranEditionsController.value
//                                 .data![i].name!,
//                             textDirection: controller.allQuranEditionsController
//                                 .value.data![i].direction!,
//                           ));
//                         },
//                         child:
//                             QuranEditionTileCard(headingStyle, i, valueStyle),
//                       )
//                     }
//                   ],
//                 ),
//               );
//       }),
//       bottomNavigationBar: Obx(() => AnimatedBottomNavigationBar(
//             backgroundColor: Colors.black,
//             activeColor: Colors.amber,
//             inactiveColor: Colors.grey,
//             icons: const [
//               Icons.quora,
//               Icons.quora,
//             ],
//             activeIndex: currentIndex.value,
//             gapLocation: GapLocation.center,
//             notchSmoothness: NotchSmoothness.defaultEdge,
//             onTap: (index) {
//               currentIndex.value = index;
//             },
//           )),
//     );
//   }

//   Card QuranEditionTileCard(
//       TextStyle headingStyle, int i, TextStyle valueStyle) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(13.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Text('Title: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller.allQuranEditionsController.value.data![i].name!,
//                   softWrap: true,
//                   overflow: TextOverflow.ellipsis,
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.amber,
//               thickness: 0.5,
//             ),
//             Row(
//               children: [
//                 Text('English Title: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller.allQuranEditionsController.value.data![i]
//                               .englishName!.length <=
//                           26
//                       ? controller.allQuranEditionsController.value.data![i]
//                           .englishName!
//                       : '${controller.allQuranEditionsController.value.data![i].englishName!.substring(0, 22)}...',
//                   softWrap: true,
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//             Divider(
//               color: Colors.amber,
//               thickness: 0.5,
//             ),
//             //  Row(
//             //     children: [
//             //       Text('Direction: ', style: headingStyle),
//             //       const Spacer(),
//             // Text(
//             //   controller
//             //       .allQuranEditionsController.value.data![i].direction!,
//             //   style: valueStyle,
//             // ),
//             //     ],
//             //   ),
//             //    Divider(
//             //      color: Colors.amber,
//             //      thickness: 0.5,
//             //    ),
//             Row(
//               children: [
//                 Text('Language: ', style: headingStyle),
//                 const Spacer(),
//                 Text(
//                   controller
//                       .allQuranEditionsController.value.data![i].language!,
//                   style: valueStyle,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controller/commonController.dart';
import '../models/quran_editions_model.dart';
import 'quran_surahs_screen.dart';

class QuranEditionsScreen extends StatefulWidget {
  const QuranEditionsScreen({Key? key});

  @override
  State<QuranEditionsScreen> createState() => _QuranEditionsScreenState();
}

class _QuranEditionsScreenState extends State<QuranEditionsScreen> {
  final CommonController controller = Get.put(CommonController());
  late RxBool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true.obs;
    callApiMethods();
  }

  Future<void> callApiMethods() async {
    isLoading(true);
    controller.allQuranEditionsController.value = await fetchQuranEditions();
    isLoading(false);
  }

  // RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xffff951d31),
    );
    const valueStyle = TextStyle(
      color: Colors.black,
    );

    return Scaffold(
      //    backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text('Quran Editions'),
      ),
      body: Obx(() {
        return Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              child: Image.asset(
                'assets/images/peach_bg_motorolla_new.png',
                fit: BoxFit.cover,
              ),
            ),
            isLoading.isTrue
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(height: 9),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller
                              .allQuranEditionsController.value.data!.length,
                          itemBuilder: (context, i) {
                            return InkWell(
                              onTap: () {
                                Get.to(QuranSurahsScreen(
                                  language: controller
                                      .allQuranEditionsController
                                      .value
                                      .data![i]
                                      .language!,
                                  title: controller.allQuranEditionsController
                                      .value.data![i].name!,
                                  textDirection: controller
                                      .allQuranEditionsController
                                      .value
                                      .data![i]
                                      .direction!,
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9.0, vertical: 5),
                                child: QuranEditionTileCard(
                                    headingStyle, i, valueStyle),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        );
      }),
    );
  }

  Widget QuranEditionTileCard(
      TextStyle headingStyle, int i, TextStyle valueStyle) {
    return Card(
      margin: EdgeInsets.zero,
      color: const Color.fromARGB(146, 255, 223, 204),
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
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Title: ', style: headingStyle),
                const Spacer(),
                Text(
                  controller.allQuranEditionsController.value.data![i].name!,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(
              color: Color(0xffff951d31),
              thickness: 0.5,
            ),
            Row(
              children: [
                Text('English Title: ', style: headingStyle),
                const Spacer(),
                Text(
                  controller.allQuranEditionsController.value.data![i]
                              .englishName!.length <=
                          26
                      ? controller.allQuranEditionsController.value.data![i]
                          .englishName!
                      : '${controller.allQuranEditionsController.value.data![i].englishName!.substring(0, 22)}...',
                  softWrap: true,
                  style: valueStyle,
                ),
              ],
            ),
            const Divider(
              color: Color(0xffff951d31),
              thickness: 0.5,
            ),
            // Row(
            //   children: [
            //     Text('Direction: ', style: headingStyle),
            //     const Spacer(),
            //     Text(
            //       controller.allQuranEditionsController.value.data![i].direction
            //           .toString(),
            //       style: valueStyle,
            //     ),
            //   ],
            // ),
            // const Divider(
            //   color: Colors.amber,
            //   thickness: 0.5,
            // ),
            Row(
              children: [
                Text('Language: ', style: headingStyle),
                const Spacer(),
                Text(
                  controller
                      .allQuranEditionsController.value.data![i].language!,
                  style: valueStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
