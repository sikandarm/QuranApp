// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ramazan_app/models/search_text_In_Quran_model.dart';

// import '../controller/commonController.dart';

// class AllSearchTextScreen extends StatefulWidget {
//   const AllSearchTextScreen({super.key, required this.inputText});
//   final String inputText;

//   @override
//   State<AllSearchTextScreen> createState() => _AllSearchTextScreenState();
// }

// class _AllSearchTextScreenState extends State<AllSearchTextScreen> {
//   CommonController? controller = null;
//   RxBool isLoading = true.obs;
//   @override
//   void initState() {
//     callApiMethods();
//     super.initState();
//   }

//   Future<void> callApiMethods() async {
//     isLoading = true.obs;
//     controller = Get.put(CommonController());
//     controller!.allSearchTextInQuran.value = await fetchAllTextInQuran(
//         textToSearch: widget.inputText, language: 'en');
//     isLoading = false.obs;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(
//         title: const Text('All Text Ocurrences'),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               if (controller!.allSearchTextInQuran.value.data != null &&
//                   controller!.allSearchTextInQuran.value.data!.matches!
//                       .isNotEmpty) ...{
//                 for (int i = 0;
//                     i <
//                         controller!
//                             .allSearchTextInQuran.value.data!.matches!.length;
//                     i++) ...{
//                   Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(11.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             controller!.allSearchTextInQuran.value.data!
//                                 .matches![i].text!,
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                           SizedBox(height: 11),
//                           Row(
//                             children: [
//                               Text(
//                                 'Surah: ',
//                                 style: const TextStyle(color: Colors.amber),
//                               ),
//                               SizedBox(width: 7),
//                               Text(
//                                 controller!.allSearchTextInQuran.value.data!
//                                     .matches![i].surah!.name!,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 5),
//                           Row(
//                             children: [
//                               Text(
//                                 'Ayat No:',
//                                 style: const TextStyle(color: Colors.amber),
//                               ),
//                               SizedBox(width: 7),
//                               Text(
//                                 controller!.allSearchTextInQuran.value.data!
//                                     .matches![i].numberInSurah
//                                     .toString(),
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // const Divider(
//                   //   thickness: 0.5,
//                   // ),
//                 }
//               } else ...{
//                 const Center(
//                   child: Text(
//                     'Not Found!',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//               }
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ramazan_app/models/search_text_In_Quran_model.dart';
// import '../controller/commonController.dart';

// class AllSearchTextScreen extends StatefulWidget {
//   const AllSearchTextScreen({Key? key, required this.inputText})
//       : super(key: key);
//   final String inputText;

//   @override
//   State<AllSearchTextScreen> createState() => _AllSearchTextScreenState();
// }

// class _AllSearchTextScreenState extends State<AllSearchTextScreen> {
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
//     controller.allSearchTextInQuran.value = await fetchAllTextInQuran(
//         textToSearch: widget.inputText, language: 'en');
//     isLoading(false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(
//         title: const Text('All Text Occurrences'),
//         elevation: 1,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
//         child: Obx(() {
//           if (isLoading.value) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             if (controller.allSearchTextInQuran.value.data != null &&
//                 controller.allSearchTextInQuran.value.data!.matches != null &&
//                 controller
//                     .allSearchTextInQuran.value.data!.matches!.isNotEmpty) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     for (int i = 0;
//                         i <
//                             controller.allSearchTextInQuran.value.data!.matches!
//                                 .length;
//                         i++)
//                       Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(11.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 controller.allSearchTextInQuran.value.data!
//                                     .matches![i].text!,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                               SizedBox(height: 11),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Surah: ',
//                                     style: const TextStyle(color: Colors.amber),
//                                   ),
//                                   SizedBox(width: 7),
//                                   Text(
//                                     controller.allSearchTextInQuran.value.data!
//                                         .matches![i].surah!.name!,
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 5),
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Ayat No:',
//                                     style: const TextStyle(color: Colors.amber),
//                                   ),
//                                   SizedBox(width: 7),
//                                   Text(
//                                     controller.allSearchTextInQuran.value.data!
//                                         .matches![i].numberInSurah
//                                         .toString(),
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             } else {
//               return Center(
//                 child: Text(
//                   'Not Found!',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             }
//           }
//         }),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/commonController.dart';
import '../models/search_text_In_Quran_model.dart';

class AllSearchTextScreen extends StatefulWidget {
  const AllSearchTextScreen({Key? key, required this.inputText})
      : super(key: key);
  final String inputText;

  @override
  State<AllSearchTextScreen> createState() => _AllSearchTextScreenState();
}

class _AllSearchTextScreenState extends State<AllSearchTextScreen> {
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
    controller.allSearchTextInQuran.value = await fetchAllTextInQuran(
        textToSearch: widget.inputText, language: 'en');
    isLoading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text('All Text Occurrences'),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4),
        child: Obx(() {
          if (isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (controller.allSearchTextInQuran.value.data != null &&
                controller.allSearchTextInQuran.value.data!.matches != null &&
                controller
                    .allSearchTextInQuran.value.data!.matches!.isNotEmpty) {
              return Container(
                width: Get.width,
                height: Get.height,
                child: ListView.builder(
                  itemCount: controller
                      .allSearchTextInQuran.value.data!.matches!.length,
                  itemBuilder: (context, index) {
                    final match = controller
                        .allSearchTextInQuran.value.data!.matches![index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: Column(
                          children: [
                            Text(
                              match.text!,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(height: 11),
                            Row(
                              children: [
                                const Text(
                                  'Surah: ',
                                  style: TextStyle(color: Colors.amber),
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  match.surah!.name!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                const Text(
                                  'Ayat No:',
                                  style: TextStyle(color: Colors.amber),
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  match.numberInSurah.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
    );
  }
}
