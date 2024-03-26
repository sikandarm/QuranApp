// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ramazan_app/controller/commonController.dart';
// import 'package:ramazan_app/models/surah_meta_data_model.dart';

// class SurahMetaDataScreen extends StatefulWidget {
//   const SurahMetaDataScreen({super.key});

//   @override
//   State<SurahMetaDataScreen> createState() => _SurahMetaDataScreenState();
// }

// class _SurahMetaDataScreenState extends State<SurahMetaDataScreen> {
//   final controller = Get.put(CommonController());
//   late RxBool isLoading;

//   @override
//   void initState() {
//     isLoading = true.obs;
//     callApiMethods();
//     super.initState();
//   }

//   Future<void> callApiMethods() async {
//     isLoading(true);
//     controller.allSurahMetaData.value = await fetchSurahMetaData();
//     isLoading(false);
//   }

//   final headingStyle = TextStyle(
//     fontWeight: FontWeight.bold,
//     color: Colors.amber,
//   );
//   final valueStyle = TextStyle(
//     color: Colors.white,
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black54,
//       appBar: AppBar(
//         title: const Text('Surah Encyclopedia'),
//         elevation: 1,
//       ),
//       body: SingleChildScrollView(child: Obx(() {
//         return isLoading.isTrue
//             ? const CircularProgressIndicator()
//             : Column(
//                 children: [
//                   for (int i = 0;
//                       i <
//                           controller.allSurahMetaData.value!.data!.surahs!
//                               .references!.length;
//                       i++) ...{
//                     Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(13.0),
//                         child: MetaDataTile(i),
//                       ),
//                     ),
//                   }
//                 ],
//               );
//       })),
//     );
//   }

//   Column MetaDataTile(int i) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Text(
//               'Arabic Title: ',
//               style: headingStyle,
//             ),
//             Spacer(),
//             Text(
//               controller
//                   .allSurahMetaData.value!.data!.surahs!.references![i].name
//                   .toString(),
//               style: valueStyle,
//             ),
//           ],
//         ),
//         Divider(
//           thickness: 0.5,
//           color: Colors.amber,
//         ),
//         Row(
//           children: [
//             Text(
//               'English Title: ',
//               style: headingStyle,
//             ),
//             Spacer(),
//             Text(
//               controller.allSurahMetaData.value!.data!.surahs!.references![i]
//                   .englishName
//                   .toString(),
//               style: valueStyle,
//             ),
//           ],
//         ),
//         Divider(
//           thickness: 0.5,
//           color: Colors.amber,
//         ),
//         Row(
//           children: [
//             Text(
//               'Number of Ayats: ',
//               style: headingStyle,
//             ),
//             Spacer(),
//             Text(
//               controller.allSurahMetaData.value!.data!.surahs!.references![i]
//                   .numberOfAyahs
//                   .toString(),
//               style: valueStyle,
//             ),
//           ],
//         ),
//         Divider(
//           thickness: 0.5,
//           color: Colors.amber,
//         ),
//         Row(
//           children: [
//             Text(
//               'Surah Number: ',
//               style: headingStyle,
//             ),
//             Spacer(),
//             Text(
//               controller
//                   .allSurahMetaData.value!.data!.surahs!.references![i].number
//                   .toString(),
//               style: valueStyle,
//             ),
//           ],
//         ),
//         Divider(
//           thickness: 0.5,
//           color: Colors.amber,
//         ),
//         Row(
//           children: [
//             Text(
//               'Revelation Type: ',
//               style: headingStyle,
//             ),
//             Spacer(),
//             Text(
//               controller.allSurahMetaData.value!.data!.surahs!.references![i]
//                   .revelationType
//                   .toString(),
//               style: valueStyle,
//             ),
//           ],
//         ),
//         // Text(
//         //   controller.allSurahMetaData.value!.data!.manzils!
//         //       .references![0].name
//         //       .toString(),
//         // ),   not working

//         // Text(
//         //   controller.allSurahMetaData.value!.data!.hizbQuarters!
//         //       .references![0].numberOfAyahs
//         //       .toString(),
//         // ),
//         //  Divider(),
//       ],
//     );
//   }
// }

////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/commonController.dart';
import '../models/surah_meta_data_model.dart';

class SurahMetaDataScreen extends StatefulWidget {
  const SurahMetaDataScreen({Key? key}) : super(key: key);

  @override
  State<SurahMetaDataScreen> createState() => _SurahMetaDataScreenState();
}

class _SurahMetaDataScreenState extends State<SurahMetaDataScreen> {
  final controller = Get.put(CommonController());
  late RxBool isLoading;

  @override
  void initState() {
    isLoading = true.obs;
    callApiMethods();
    super.initState();
  }

  Future<void> callApiMethods() async {
    isLoading(true);
    controller.allSurahMetaData.value = await fetchSurahMetaData();
    isLoading(false);
  }

  final headingStyle = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.amber,
  );
  final valueStyle = const TextStyle(color: Colors.white, fontSize: 15.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //    backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text('Surah Encyclopedia'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return isLoading.isTrue
                ? const Column(
                    children: [
                      SizedBox(
                        height: 300,
                      ),
                      Center(child: CircularProgressIndicator()),
                    ],
                  )
                : SizedBox(
                    width: Get.width,
                    height: Get.height,
                    child: ListView.builder(
                      itemCount: controller.allSurahMetaData.value!.data!
                          .surahs!.references!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: MetaDataTile(index),
                          ),
                        );
                      },
                    ),
                  );
          },
        ),
      ),
    );
  }

  Column MetaDataTile(int i) {
    final reference =
        controller.allSurahMetaData.value!.data!.surahs!.references![i];
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Arabic Title: ',
              style: headingStyle,
            ),
            const Spacer(),
            Text(
              reference.name.toString(),
              style: valueStyle,
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.amber,
        ),
        Row(
          children: [
            Text(
              'English Title: ',
              style: headingStyle,
            ),
            const Spacer(),
            Text(
              reference.englishName.toString(),
              style: valueStyle,
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.amber,
        ),
        Row(
          children: [
            Text(
              'Number of Ayats: ',
              style: headingStyle,
            ),
            const Spacer(),
            Text(
              reference.numberOfAyahs.toString(),
              style: valueStyle,
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.amber,
        ),
        Row(
          children: [
            Text(
              'Surah Number: ',
              style: headingStyle,
            ),
            const Spacer(),
            Text(
              reference.number.toString(),
              style: valueStyle,
            ),
          ],
        ),
        const Divider(
          thickness: 0.5,
          color: Colors.amber,
        ),
        Row(
          children: [
            Text(
              'Revelation Type: ',
              style: headingStyle,
            ),
            const Spacer(),
            Text(
              reference.revelationType.toString(),
              style: valueStyle,
            ),
          ],
        ),
      ],
    );
  }
}
