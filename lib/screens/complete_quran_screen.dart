// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:ramazan_app_new_v1/models/complete_quran_model.dart';
// import 'package:share_plus/share_plus.dart';

// class CompleteQuranScreen extends StatefulWidget {
//   const CompleteQuranScreen({Key? key}) : super(key: key);

//   @override
//   State<CompleteQuranScreen> createState() => _CompleteQuranScreenState();
// }

// class _CompleteQuranScreenState extends State<CompleteQuranScreen> {
//   final audioPlayer = AudioPlayer();
//   late QuranCompleteModel quranCompleteModel;
//   late bool isLoading;
//   late int selectedSurahIndex;
//   late int selectedAyatIndex;

//   @override
//   void initState() {
//     super.initState();
//     isLoading = true;
//     selectedSurahIndex = -1; // Initialize selected index to -1
//     selectedAyatIndex = -1;
//     callApiMethods();
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   Future<void> callApiMethods() async {
//     quranCompleteModel = await fetchQuranComplete();
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Complete Quran'),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView.builder(
//               shrinkWrap: true,
//               itemCount: quranCompleteModel.data!.surahs!.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   //    color: selectedSurahIndex == index
//                   //      ? Colors.blue
//                   //    : Colors.white, // Change color conditionally

//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(
//                           child: Text(
//                             quranCompleteModel.data!.surahs![index].name
//                                 .toString(),
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: quranCompleteModel
//                             .data!.surahs![index].ayahs!.length,
//                         itemBuilder: (context, i) {
//                           return Row(
//                             children: [
//                               IconButton(
//                                 iconSize: 20,
//                                 color: Colors.white.withOpacity(0.5),
//                                 onPressed: () async {
//                                   setState(() {
//                                     selectedSurahIndex =
//                                         index; // Update selected index
//                                     selectedAyatIndex = i;
//                                   });
//                                   print(quranCompleteModel
//                                       .data!.surahs![index].ayahs![i].number);
//                                   audioPlayer.pause();
//                                   await audioPlayer.setUrl(
//                                       'https://cdn.islamic.network/quran/audio/128/ar.alafasy/${quranCompleteModel.data!.surahs![index].ayahs![i].number!}.mp3');
//                                   await audioPlayer.play();
//                                 },
//                                 icon: const Icon(
//                                   Icons.play_arrow,
//                                   size: 20,
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () async {
//                                   await Share.share(quranCompleteModel
//                                       .data!.surahs![index].ayahs![i].text!);
//                                 },
//                                 child: Container(
//                                   width: Get.width - 70,
//                                   child: Card(
//                                     color: selectedSurahIndex == index &&
//                                             selectedAyatIndex == i
//                                         ? Colors.amber
//                                         : Colors
//                                             .black, // Change color conditionally
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Text(
//                                         textAlign: TextAlign.right,
//                                         quranCompleteModel.data!.surahs![index]
//                                             .ayahs![i].text!,
//                                         softWrap: true,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           color: (selectedSurahIndex == index &&
//                                                   selectedAyatIndex == i)
//                                               ? Colors.black
//                                               : Colors.amber, // Ch),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:share_plus/share_plus.dart';

import 'package:ramazan_app_new_v1/models/complete_quran_model.dart';

class CompleteQuranScreen extends StatefulWidget {
  const CompleteQuranScreen({Key? key}) : super(key: key);

  @override
  State<CompleteQuranScreen> createState() => _CompleteQuranScreenState();
}

class _CompleteQuranScreenState extends State<CompleteQuranScreen> {
  late QuranCompleteModel quranCompleteModel;
  late bool isLoading;
  late int selectedSurahIndex;
  late int selectedAyatIndex;
  final AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    isLoading = true;
    selectedSurahIndex = -1;
    selectedAyatIndex = -1;
    initQuranData();
  }

  Future<void> initQuranData() async {
    quranCompleteModel = await fetchQuranComplete();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Quran'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: quranCompleteModel.data!.surahs!.length,
              // separatorBuilder: (BuildContext context, int index) =>
              //     const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return buildSurahCard(index);
              },
            ),
    );
  }

  Widget buildSurahCard(int index) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quranCompleteModel.data!.surahs![index].name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quranCompleteModel.data!.surahs![index].ayahs!.length,
            itemBuilder: (context, i) {
              return buildAyahRow(index, i);
            },
          ),
        ],
      ),
    );
  }

  Widget buildAyahRow(int surahIndex, int ayahIndex) {
    return Row(
      children: [
        IconButton(
          iconSize: 20,
          onPressed: () {
            setState(() {
              selectedSurahIndex = surahIndex;
              selectedAyatIndex = ayahIndex;
            });
            playAudio(surahIndex, ayahIndex);
          },
          icon: Icon(
            Icons.play_arrow,
            size: 20,
            color: (selectedSurahIndex == surahIndex &&
                    selectedAyatIndex == ayahIndex)
                ? Colors.amber
                : Color.fromARGB(45, 158, 158, 158),
          ),
        ),
        InkWell(
          onTap: () async {
            await Share.share(quranCompleteModel
                .data!.surahs![surahIndex].ayahs![ayahIndex].text!);
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Card(
              color: (selectedSurahIndex == surahIndex &&
                      selectedAyatIndex == ayahIndex)
                  ? Colors.amber
                  : Color.fromARGB(45, 158, 158, 158),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quranCompleteModel
                      .data!.surahs![surahIndex].ayahs![ayahIndex].text!,
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (selectedSurahIndex == surahIndex &&
                            selectedAyatIndex == ayahIndex)
                        ? Colors.black
                        : Colors.amber,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> playAudio(int surahIndex, int ayahIndex) async {
    audioPlayer.pause();
    await audioPlayer.setUrl(
        'https://cdn.islamic.network/quran/audio/128/ar.alafasy/${quranCompleteModel.data!.surahs![surahIndex].ayahs![ayahIndex].number!}.mp3');
    await audioPlayer.play();
  }
}
