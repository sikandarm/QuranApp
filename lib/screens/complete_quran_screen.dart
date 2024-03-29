import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ramazan_app_new_v1/utils/shareAyatDialog.dart';
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
      body: Stack(
        children: [
          // Background image
          Image.asset(
            'assets/images/peach_bg_motorolla_new.png', // Replace with your image path
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          // Content
          Positioned.fill(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: quranCompleteModel.data!.surahs!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildSurahCard(index);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildSurahCard(int index) {
    return Card(
      margin: EdgeInsets.all(8),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Center(
              child: Text(
                quranCompleteModel.data!.surahs![index].name.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.5,
                  // color: Colors.white,
                  color: Color(0xffff951d31),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quranCompleteModel.data!.surahs![index].ayahs!.length,
            itemBuilder: (context, i) {
              return buildAyahRow(
                  index, i, quranCompleteModel.data!.surahs![index].number!);
            },
          ),
        ],
      ),
    );
  }

  Widget buildAyahRow(int surahIndex, int ayahIndex, int surahNo) {
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
                ? Colors.black
                : Color(0xffff951d31),
          ),
        ),
        InkWell(
          onTap: () async {
            //     await Share.share(quranCompleteModel
            //       .data!.surahs![surahIndex].ayahs![ayahIndex].text!);
            await showMyAyatShareDialog(
                context,
                quranCompleteModel
                    .data!.surahs![surahIndex].ayahs![ayahIndex].text!,
                surahNo.toString(),
                quranCompleteModel.data!.surahs![surahIndex].ayahs![ayahIndex]
                    .numberInSurah!);
          },
          child: Container(
            width: MediaQuery.of(context).size.width - 70,
            child: Card(
              margin: EdgeInsets.all(11),
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
              // color: (selectedSurahIndex == surahIndex &&
              //         selectedAyatIndex == ayahIndex)
              //     ? Colors.amber
              //     : Color.fromARGB(45, 158, 158, 158),

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quranCompleteModel
                      .data!.surahs![surahIndex].ayahs![ayahIndex].text!,
                  textAlign: TextAlign.right,
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: (selectedSurahIndex == surahIndex &&
                            selectedAyatIndex == ayahIndex)
                        ? Colors.black
                        : Color(0xffff951d31),
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
