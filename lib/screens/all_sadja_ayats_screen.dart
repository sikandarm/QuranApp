// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:get/get.dart';
// // // // // import 'package:ramazan_app/controller/commonController.dart';

// // // // // import '../models/sadja_ayats_model.dart';

// // // // // class AllSadjaAyatsScreen extends StatefulWidget {
// // // // //   const AllSadjaAyatsScreen({Key? key}) : super(key: key);

// // // // //   @override
// // // // //   State<AllSadjaAyatsScreen> createState() => _AllSadjaAyatsScreenState();
// // // // // }

// // // // // class _AllSadjaAyatsScreenState extends State<AllSadjaAyatsScreen> {
// // // // //   CommonController? controller;
// // // // //   bool isLoading = true;

// // // // //   @override
// // // // //   void didChangeDependencies() {
// // // // //     super.didChangeDependencies();
// // // // //     callApiMethods();
// // // // //   }

// // // // //   Future<void> callApiMethods() async {
// // // // //     setState(() {
// // // // //       isLoading = true;
// // // // //     });
// // // // //     controller = Get.put(CommonController());
// // // // //     controller!.allSadjaAyatsInQuran.value = await fetchSajdaAyats();
// // // // //     setState(() {
// // // // //       isLoading = false;
// // // // //     });
// // // // //   }

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       floatingActionButton: FloatingActionButton(
// // // // //         onPressed: () async {
// // // // //           print(controller!.allSadjaAyatsInQuran.value.data!.ayahs!.length);
// // // // //         },
// // // // //       ),
// // // // //       backgroundColor: Colors.black54,
// // // // //       appBar: AppBar(
// // // // //         title: const Text('Sadja Ayats'),
// // // // //         elevation: 1,
// // // // //       ),
// // // // //       body: Padding(
// // // // //         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
// // // // //         child: SingleChildScrollView(
// // // // //           child: Column(
// // // // //             children: [
// // // // //               if (controller != null &&
// // // // //                   controller!.allSadjaAyatsInQuran.value.data != null &&
// // // // //                   controller!.allSadjaAyatsInQuran.value.data!.ayahs != null &&
// // // // //                   controller!
// // // // //                       .allSadjaAyatsInQuran.value.data!.ayahs!.isNotEmpty) ...{
// // // // //                 for (int i = 0;
// // // // //                     i <
// // // // //                         controller!
// // // // //                             .allSadjaAyatsInQuran.value.data!.ayahs!.length;
// // // // //                     i++) ...{
// // // // //                   Card(
// // // // //                     child: Padding(
// // // // //                       padding: const EdgeInsets.all(11.0),
// // // // //                       child: Column(
// // // // //                         children: [
// // // // //                           Text(
// // // // //                             controller!.allSadjaAyatsInQuran.value.data!
// // // // //                                 .ayahs![i].text!,
// // // // //                             style: const TextStyle(color: Colors.white),
// // // // //                           ),
// // // // //                           const SizedBox(height: 11),
// // // // //                           Row(
// // // // //                             children: [
// // // // //                               const Text(
// // // // //                                 'Surah: ',
// // // // //                                 style: TextStyle(color: Colors.amber),
// // // // //                               ),
// // // // //                               const SizedBox(width: 7),
// // // // //                               Text(
// // // // //                                 controller!.allSadjaAyatsInQuran.value.data!
// // // // //                                     .ayahs![i].surah!.name!,
// // // // //                                 style: const TextStyle(color: Colors.white),
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                           const SizedBox(height: 5),
// // // // //                           Row(
// // // // //                             children: [
// // // // //                               const Text(
// // // // //                                 'Ayat No:',
// // // // //                                 style: TextStyle(color: Colors.amber),
// // // // //                               ),
// // // // //                               const SizedBox(width: 7),
// // // // //                               Text(
// // // // //                                 controller!.allSadjaAyatsInQuran.value.data!
// // // // //                                     .ayahs![i].numberInSurah
// // // // //                                     .toString(),
// // // // //                                 style: const TextStyle(color: Colors.white),
// // // // //                               ),
// // // // //                             ],
// // // // //                           ),
// // // // //                         ],
// // // // //                       ),
// // // // //                     ),
// // // // //                   ),
// // // // //                   const Divider(
// // // // //                     thickness: 0.5,
// // // // //                   ),
// // // // //                 }
// // // // //               } else
// // // // //                 const Center(
// // // // //                   child: Text(
// // // // //                     'Not Found!',
// // // // //                     style: TextStyle(color: Colors.white),
// // // // //                   ),
// // // // //                 )
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:share_plus/share_plus.dart';
// // // // import '../controller/commonController.dart';
// // // // import '../models/sadja_ayats_model.dart';

// // // // class AllSadjaAyatsScreen extends StatefulWidget {
// // // //   const AllSadjaAyatsScreen({Key? key}) : super(key: key);

// // // //   @override
// // // //   State<AllSadjaAyatsScreen> createState() => _AllSadjaAyatsScreenState();
// // // // }

// // // // class _AllSadjaAyatsScreenState extends State<AllSadjaAyatsScreen> {
// // // //   final CommonController controller = Get.put(CommonController());
// // // //   late RxBool isLoading;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     isLoading = true.obs;
// // // //     callApiMethods();
// // // //   }

// // // //   Future<void> callApiMethods() async {
// // // //     isLoading(true);
// // // //     controller.allSadjaAyatsInQuran.value = await fetchSajdaAyats();
// // // //     isLoading(false);
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       // floatingActionButton: FloatingActionButton(
// // // //       //   onPressed: () async {
// // // //       //     print(controller.allSadjaAyatsInQuran.value.data!.ayahs!.length);
// // // //       //   },
// // // //       // ),
// // // //       //  backgroundColor: Colors.black54,
// // // //       appBar: AppBar(
// // // //         title: const Text('Sadja Ayats'),
// // // //         elevation: 1,
// // // //       ),
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
// // // //         child: Obx(() {
// // // //           if (isLoading.value) {
// // // //             return Center(child: CircularProgressIndicator());
// // // //           } else {
// // // //             if (controller.allSadjaAyatsInQuran.value.data != null &&
// // // //                 controller.allSadjaAyatsInQuran.value.data!.ayahs != null &&
// // // //                 controller.allSadjaAyatsInQuran.value.data!.ayahs!.isNotEmpty) {
// // // //               return SingleChildScrollView(
// // // //                 child: Column(
// // // //                   children: [
// // // //                     for (int i = 0;
// // // //                         i <
// // // //                             controller
// // // //                                 .allSadjaAyatsInQuran.value.data!.ayahs!.length;
// // // //                         i++)
// // // //                       Card(
// // // //                         child: Padding(
// // // //                           padding: const EdgeInsets.all(11.0),
// // // //                           child: Column(
// // // //                             crossAxisAlignment: CrossAxisAlignment.end,
// // // //                             children: [
// // // //                               InkWell(
// // // //                                 onTap: () async {
// // // //                                   await Share.share(
// // // //                                     controller.allSadjaAyatsInQuran.value.data!
// // // //                                         .ayahs![i].text!,
// // // //                                   );
// // // //                                 },
// // // //                                 child: Text(
// // // //                                   controller.allSadjaAyatsInQuran.value.data!
// // // //                                       .ayahs![i].text!,
// // // //                                   textAlign: TextAlign.right,
// // // //                                   style: const TextStyle(
// // // //                                     color: Colors.white,
// // // //                                     fontSize: 17.5,
// // // //                                   ),
// // // //                                 ),
// // // //                               ),
// // // //                               const SizedBox(height: 11),
// // // //                               Row(
// // // //                                 children: [
// // // //                                   const Text(
// // // //                                     'Surah: ',
// // // //                                     style: TextStyle(color: Colors.amber),
// // // //                                   ),
// // // //                                   const SizedBox(width: 7),
// // // //                                   Text(
// // // //                                     controller.allSadjaAyatsInQuran.value.data!
// // // //                                         .ayahs![i].surah!.name!,
// // // //                                     style: const TextStyle(color: Colors.white),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                               const SizedBox(height: 5),
// // // //                               Row(
// // // //                                 children: [
// // // //                                   const Text(
// // // //                                     'Ayat No:',
// // // //                                     style: TextStyle(color: Colors.amber),
// // // //                                   ),
// // // //                                   const SizedBox(width: 7),
// // // //                                   Text(
// // // //                                     controller.allSadjaAyatsInQuran.value.data!
// // // //                                         .ayahs![i].numberInSurah
// // // //                                         .toString(),
// // // //                                     style: const TextStyle(color: Colors.white),
// // // //                                   ),
// // // //                                 ],
// // // //                               ),
// // // //                             ],
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     const Divider(
// // // //                       thickness: 0.5,
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               );
// // // //             } else {
// // // //               return Center(
// // // //                 child: Text(
// // // //                   'Not Found!',
// // // //                   style: TextStyle(color: Colors.white),
// // // //                 ),
// // // //               );
// // // //             }
// // // //           }
// // // //         }),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:share_plus/share_plus.dart';
// // // import '../controller/commonController.dart';
// // // import '../models/sadja_ayats_model.dart';

// // // class AllSadjaAyatsScreen extends StatefulWidget {
// // //   const AllSadjaAyatsScreen({Key? key}) : super(key: key);

// // //   @override
// // //   State<AllSadjaAyatsScreen> createState() => _AllSadjaAyatsScreenState();
// // // }

// // // class _AllSadjaAyatsScreenState extends State<AllSadjaAyatsScreen> {
// // //   final CommonController controller = Get.put(CommonController());
// // //   late RxBool isLoading;
// // //   double _fontSize = 17.5;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     isLoading = true.obs;
// // //     callApiMethods();
// // //   }

// // //   Future<void> callApiMethods() async {
// // //     isLoading(true);
// // //     controller.allSadjaAyatsInQuran.value = await fetchSajdaAyats();
// // //     isLoading(false);
// // //   }

// // //   void updateFontSize(double newSize) {
// // //     setState(() {
// // //       _fontSize = newSize;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Sadja Ayats'),
// // //         elevation: 1,
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
// // //         child: Obx(() {
// // //           if (isLoading.value) {
// // //             return Center(child: CircularProgressIndicator());
// // //           } else {
// // //             if (controller.allSadjaAyatsInQuran.value.data != null &&
// // //                 controller.allSadjaAyatsInQuran.value.data!.ayahs != null &&
// // //                 controller.allSadjaAyatsInQuran.value.data!.ayahs!.isNotEmpty) {
// // //               return SingleChildScrollView(
// // //                 child: Column(
// // //                   children: [
// // //                     for (int i = 0;
// // //                         i <
// // //                             controller
// // //                                 .allSadjaAyatsInQuran.value.data!.ayahs!.length;
// // //                         i++)
// // //                       Card(
// // //                         child: Padding(
// // //                           padding: const EdgeInsets.all(11.0),
// // //                           child: Column(
// // //                             crossAxisAlignment: CrossAxisAlignment.end,
// // //                             children: [
// // //                               InkWell(
// // //                                 onTap: () async {
// // //                                   await Share.share(
// // //                                     controller.allSadjaAyatsInQuran.value.data!
// // //                                         .ayahs![i].text!,
// // //                                   );
// // //                                 },
// // //                                 child: Text(
// // //                                   controller.allSadjaAyatsInQuran.value.data!
// // //                                       .ayahs![i].text!,
// // //                                   textAlign: TextAlign.right,
// // //                                   style: TextStyle(
// // //                                     color: Colors.white,
// // //                                     fontSize: _fontSize,
// // //                                   ),
// // //                                 ),
// // //                               ),
// // //                               const SizedBox(height: 11),
// // //                               Row(
// // //                                 children: [
// // //                                   const Text(
// // //                                     'Surah: ',
// // //                                     style: TextStyle(color: Colors.amber),
// // //                                   ),
// // //                                   const SizedBox(width: 7),
// // //                                   Text(
// // //                                     controller.allSadjaAyatsInQuran.value.data!
// // //                                         .ayahs![i].surah!.name!,
// // //                                     style: const TextStyle(color: Colors.white),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                               const SizedBox(height: 5),
// // //                               Row(
// // //                                 children: [
// // //                                   const Text(
// // //                                     'Ayat No:',
// // //                                     style: TextStyle(color: Colors.amber),
// // //                                   ),
// // //                                   const SizedBox(width: 7),
// // //                                   Text(
// // //                                     controller.allSadjaAyatsInQuran.value.data!
// // //                                         .ayahs![i].numberInSurah
// // //                                         .toString(),
// // //                                     style: const TextStyle(color: Colors.white),
// // //                                   ),
// // //                                 ],
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     const Divider(
// // //                       thickness: 0.5,
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             } else {
// // //               return Center(
// // //                 child: Text(
// // //                   'Not Found!',
// // //                   style: TextStyle(color: Colors.white),
// // //                 ),
// // //               );
// // //             }
// // //           }
// // //         }),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () {
// // //           showModalBottomSheet(
// // //             context: context,
// // //             builder: (BuildContext context) {
// // //               return Container(
// // //                 height: 200,
// // //                 padding: EdgeInsets.all(20),
// // //                 child: Column(
// // //                   mainAxisAlignment: MainAxisAlignment.center,
// // //                   children: [
// // //                     Text(
// // //                       'Adjust Font Size',
// // //                       style: TextStyle(
// // //                         fontSize: 20.0,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                     Slider(
// // //                       value: _fontSize,
// // //                       min: 10.0,
// // //                       max: 30.0,
// // //                       onChanged: (value) {
// // //                         updateFontSize(value);
// // //                       },
// // //                     ),
// // //                   ],
// // //                 ),
// // //               );
// // //             },
// // //           );
// // //         },
// // //         child: Icon(Icons.format_size),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:share_plus/share_plus.dart';
// // import '../controller/commonController.dart';
// // import '../models/sadja_ayats_model.dart';

// // class AllSadjaAyatsScreen extends StatefulWidget {
// //   const AllSadjaAyatsScreen({Key? key}) : super(key: key);

// //   @override
// //   State<AllSadjaAyatsScreen> createState() => _AllSadjaAyatsScreenState();
// // }

// // class _AllSadjaAyatsScreenState extends State<AllSadjaAyatsScreen> {
// //   final CommonController controller = Get.put(CommonController());
// //   late RxBool isLoading;
// //   double _fontSize = 17.5;

// //   @override
// //   void initState() {
// //     super.initState();
// //     isLoading = true.obs;
// //     callApiMethods();
// //   }

// //   Future<void> callApiMethods() async {
// //     isLoading(true);
// //     controller.allSadjaAyatsInQuran.value = await fetchSajdaAyats();
// //     isLoading(false);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Sadja Ayats'),
// //         elevation: 1,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
// //         child: Obx(() {
// //           if (isLoading.value) {
// //             return Center(child: CircularProgressIndicator());
// //           } else {
// //             if (controller.allSadjaAyatsInQuran.value.data != null &&
// //                 controller.allSadjaAyatsInQuran.value.data!.ayahs != null &&
// //                 controller.allSadjaAyatsInQuran.value.data!.ayahs!.isNotEmpty) {
// //               return SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     for (int i = 0;
// //                         i <
// //                             controller
// //                                 .allSadjaAyatsInQuran.value.data!.ayahs!.length;
// //                         i++)
// //                       Card(
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(11.0),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.end,
// //                             children: [
// //                               InkWell(
// //                                 onTap: () async {
// //                                   await Share.share(
// //                                     controller.allSadjaAyatsInQuran.value.data!
// //                                         .ayahs![i].text!,
// //                                   );
// //                                 },
// //                                 child: Text(
// //                                   controller.allSadjaAyatsInQuran.value.data!
// //                                       .ayahs![i].text!,
// //                                   textAlign: TextAlign.right,
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: _fontSize,
// //                                   ),
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 11),
// //                               Row(
// //                                 children: [
// //                                   const Text(
// //                                     'Surah: ',
// //                                     style: TextStyle(color: Colors.amber),
// //                                   ),
// //                                   const SizedBox(width: 7),
// //                                   Text(
// //                                     controller.allSadjaAyatsInQuran.value.data!
// //                                         .ayahs![i].surah!.name!,
// //                                     style: const TextStyle(color: Colors.white),
// //                                   ),
// //                                 ],
// //                               ),
// //                               const SizedBox(height: 5),
// //                               Row(
// //                                 children: [
// //                                   const Text(
// //                                     'Ayat No:',
// //                                     style: TextStyle(color: Colors.amber),
// //                                   ),
// //                                   const SizedBox(width: 7),
// //                                   Text(
// //                                     controller.allSadjaAyatsInQuran.value.data!
// //                                         .ayahs![i].numberInSurah
// //                                         .toString(),
// //                                     style: const TextStyle(color: Colors.white),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     const Divider(
// //                       thickness: 0.5,
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             } else {
// //               return Center(
// //                 child: Text(
// //                   'Not Found!',
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               );
// //             }
// //           }
// //         }),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           showModalBottomSheet(
// //             context: context,
// //             builder: (BuildContext context) {
// //               return Container(
// //                 height: 200,
// //                 padding: EdgeInsets.all(20),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Text(
// //                       'Adjust Font Size',
// //                       style: TextStyle(
// //                         fontSize: 20.0,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                     Slider(
// //                       value: _fontSize,
// //                       min: 10.0,
// //                       max: 30.0,
// //                       onChanged: (value) {
// //                         setState(() {
// //                           _fontSize = value;
// //                         });
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //         child: Icon(Icons.format_size),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:arabic_font/arabic_font.dart'; // Import arabic_font package
// import '../controller/commonController.dart';
// import '../models/sadja_ayats_model.dart';

// class AllSadjaAyatsScreen extends StatefulWidget {
//   const AllSadjaAyatsScreen({Key? key}) : super(key: key);

//   @override
//   State<AllSadjaAyatsScreen> createState() => _AllSadjaAyatsScreenState();
// }

// class _AllSadjaAyatsScreenState extends State<AllSadjaAyatsScreen> {
//   final CommonController controller = Get.put(CommonController());
//   late RxBool isLoading;
//   double _fontSize = 17.5;
//   String _selectedArabicFont =
//       ArabicFont.elMessiri; // Define selected Arabic font

//   @override
//   void initState() {
//     super.initState();
//     isLoading = true.obs;
//     callApiMethods();
//   }

//   Future<void> callApiMethods() async {
//     isLoading(true);
//     controller.allSadjaAyatsInQuran.value = await fetchSajdaAyats();
//     isLoading(false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sadja Ayats'),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
//         child: Obx(() {
//           if (isLoading.value) {
//             return const Center(child: CircularProgressIndicator());
//           } else {
//             if (controller.allSadjaAyatsInQuran.value.data != null &&
//                 controller.allSadjaAyatsInQuran.value.data!.ayahs != null &&
//                 controller.allSadjaAyatsInQuran.value.data!.ayahs!.isNotEmpty) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (int i = 0;
//                         i <
//                             controller
//                                 .allSadjaAyatsInQuran.value.data!.ayahs!.length;
//                         i++)
//                       Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(11.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               InkWell(
//                                 onTap: () async {
//                                   await Share.share(
//                                     controller.allSadjaAyatsInQuran.value.data!
//                                         .ayahs![i].text!,
//                                   );
//                                 },
//                                 child: Text(
//                                   controller.allSadjaAyatsInQuran.value.data!
//                                       .ayahs![i].text!,
//                                   textAlign: TextAlign.right,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: _fontSize,
//                                     fontFamily:
//                                         _selectedArabicFont, // Use selected Arabic font
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(height: 11),
//                               Row(
//                                 children: [
//                                   const Text(
//                                     'Surah: ',
//                                     style: TextStyle(color: Colors.amber),
//                                   ),
//                                   const SizedBox(width: 7),
//                                   Text(
//                                     controller.allSadjaAyatsInQuran.value.data!
//                                         .ayahs![i].surah!.name!,
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   const Text(
//                                     'Ayat No:',
//                                     style: TextStyle(color: Colors.amber),
//                                   ),
//                                   const SizedBox(width: 7),
//                                   Text(
//                                     controller.allSadjaAyatsInQuran.value.data!
//                                         .ayahs![i].numberInSurah
//                                         .toString(),
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     const Divider(
//                       thickness: 0.5,
//                     ),
//                   ],
//                 ),
//               );
//             } else {
//               return const Center(
//                 child: Text(
//                   'Not Found!',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             }
//           }
//         }),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 height: 300,
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Adjust Font Size',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Slider(
//                       value: _fontSize,
//                       min: 10.0,
//                       max: 30.0,
//                       onChanged: (value) {
//                         setState(() {
//                           _fontSize = value;
//                         });
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       'Select Arabic Font',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     DropdownButton<String>(
//                       value: _selectedArabicFont,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _selectedArabicFont = newValue!;
//                         });
//                       },
//                       items: const [
//                         DropdownMenuItem(
//                           value: ArabicFont.elMessiri,
//                           child: Text('El Messiri'),
//                         ),
//                         DropdownMenuItem(
//                           value: ArabicFont.katibeh,
//                           child: Text('Katibeh'),
//                         ),
//                         DropdownMenuItem(
//                           value: ArabicFont.lalezar,
//                           child: Text('Lalezar'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           );
//         },
//         child: const Icon(Icons.settings),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/share_ayat_with_bg_screen.dart';
import 'package:ramazan_app_new_v1/utils/shareAyatDialog.dart';
import 'package:share_plus/share_plus.dart';
import 'package:arabic_font/arabic_font.dart'; // Import arabic_font package
import '../controller/commonController.dart';
import '../models/sadja_ayats_model.dart';

class AllSadjaAyatsScreen extends StatefulWidget {
  const AllSadjaAyatsScreen({Key? key}) : super(key: key);

  @override
  State<AllSadjaAyatsScreen> createState() => _AllSadjaAyatsScreenState();
}

class _AllSadjaAyatsScreenState extends State<AllSadjaAyatsScreen> {
  final CommonController controller = Get.put(CommonController());
  late RxBool isLoading;
  double _fontSize = 18;

  // String _selectedArabicFont =
  //    ArabicFont.elMessiri; // Use constant provided by arabic_font package

  @override
  void initState() {
    super.initState();
    isLoading = true.obs;
    callApiMethods();
  }

  Future<void> callApiMethods() async {
    isLoading(true);
    controller.allSadjaAyatsInQuran.value = await fetchSajdaAyats();
    isLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sadja Ayats'),
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
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
            child: Obx(() {
              if (isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (controller.allSadjaAyatsInQuran.value.data != null &&
                    controller.allSadjaAyatsInQuran.value.data!.ayahs != null &&
                    controller
                        .allSadjaAyatsInQuran.value.data!.ayahs!.isNotEmpty) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Column(
                        children: [
                          for (int i = 0;
                              i <
                                  controller.allSadjaAyatsInQuran.value.data!
                                      .ayahs!.length;
                              i++)
                            Column(
                              children: [
                                SizedBox(height: 7),
                                Card(
                                  margin: EdgeInsets.zero,
                                  color:
                                      const Color.fromARGB(146, 255, 223, 204),
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
                                    padding: const EdgeInsets.all(11.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            //    await Share.share(
                                            //      controller.allSadjaAyatsInQuran.value.data!
                                            //         .ayahs![i].text!,
                                            //   );

                                            await showMyAyatShareDialog(
                                              context,
                                              controller.allSadjaAyatsInQuran
                                                  .value.data!.ayahs![i].text!,
                                              controller
                                                  .allSadjaAyatsInQuran
                                                  .value
                                                  .data!
                                                  .ayahs![i]
                                                  .surah!
                                                  .number
                                                  .toString(),
                                              controller
                                                  .allSadjaAyatsInQuran
                                                  .value
                                                  .data!
                                                  .ayahs![i]
                                                  .numberInSurah!,
                                            );
                                            /////////////////////////////////////

                                            //    Get.to(ShareAyatWithBgScreen(
                                            //     text: controller.allSadjaAyatsInQuran.value
                                            //         .data!.ayahs![i].text!,
                                            //  ));
                                          },
                                          child: Text(
                                            controller.allSadjaAyatsInQuran
                                                .value.data!.ayahs![i].text!,
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              // color: Colors.white,
                                              color: Color(0xffff951d31),
                                              fontSize: _fontSize,
                                              //  fontFamily:
                                              //    _selectedArabicFont, // Use selected Arabic font
                                            ),

                                            //   style: ArabicTextStyle(
                                            //   arabicFont: _selectedArabicFont,
                                            //   color: Colors.white,
                                            // fontSize: _fontSize,
                                            // ),
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        Row(
                                          children: [
                                            const Text(
                                              'Surah: ',
                                              style: TextStyle(
                                                color: Color(0xffff951d31),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            Text(
                                              controller
                                                  .allSadjaAyatsInQuran
                                                  .value
                                                  .data!
                                                  .ayahs![i]
                                                  .surah!
                                                  .name!,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                //  fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Text(
                                              'Ayat No:',
                                              style: TextStyle(
                                                color: Color(0xffff951d31),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            Text(
                                              controller
                                                  .allSadjaAyatsInQuran
                                                  .value
                                                  .data!
                                                  .ayahs![i]
                                                  .numberInSurah
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                //  fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          const Divider(
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Not Found!',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              }
            }),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //       context: context,
      //       builder: (BuildContext context) {
      //         return Container(
      //           height: 300,
      //           padding: const EdgeInsets.all(20),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               const Text(
      //                 'Adjust Font Size',
      //                 style: TextStyle(
      //                   fontSize: 20.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               Slider(
      //                 value: _fontSize,
      //                 min: 10.0,
      //                 max: 30.0,
      //                 onChanged: (value) {
      //                   setState(() {
      //                     _fontSize = value;
      //                   });
      //                 },
      //               ),
      //               const SizedBox(height: 20),
      //               const Text(
      //                 'Select Arabic Font',
      //                 style: TextStyle(
      //                   fontSize: 20.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //               const SizedBox(height: 10),
      //               DropdownButton<String>(
      //                 value: _selectedArabicFont,
      //                 onChanged: (String? newValue) {
      //                   setState(() {
      //                     _selectedArabicFont = newValue!;
      //                   });
      //                 },
      //                 items: const [
      //                   DropdownMenuItem(
      //                     value: ArabicFont.elMessiri,
      //                     child: Text('El Messiri'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.katibeh,
      //                     child: Text('Katibeh'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.lalezar,
      //                     child: Text('Lalezar'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.dubai,
      //                     child: Text('Dubai'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.cairo,
      //                     child: Text('Cairo'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.lateef,
      //                     child: Text('Lateef'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.tajawal,
      //                     child: Text('Tajawal'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.avenirArabic,
      //                     child: Text('Avenir Arabic'),
      //                   ),
      //                   DropdownMenuItem(
      //                     value: ArabicFont.iBMPlexSansArabic,
      //                     child: Text('iBMPlexSansArabic'),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //     );
      //   },
      //   child: const Icon(Icons.settings),
      // ),
    );
  }
}
