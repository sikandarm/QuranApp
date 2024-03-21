import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ramazan_app_new_v1/screens/ayat_audio_screen.dart';
import 'package:ramazan_app_new_v1/screens/ayat_image_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../controller/commonController.dart';
import '../models/surah_model.dart';
import '../utils/audio_player_dialog.dart';

class SurahScreen extends StatefulWidget {
  const SurahScreen({
    Key? key,
    required this.surahTitle,
    required this.language,
    required this.title,
    required this.surahNumber,
    required this.textDirection,
    required this.totalPreviousVerses,
  }) : super(key: key);

  final String surahTitle;
  final String language;
  final String title;
  final int surahNumber;
  final String textDirection;
  final int totalPreviousVerses;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  final CommonController controller = Get.put(CommonController());
  late RxBool isLoading;
  List<bool> playOrPauseIconList = [];
  List<bool> textColorChangeList = []; // New list to manage text color
  bool isWholeSurahAudioIsPlaying = false;

  @override
  void initState() {
    super.initState();
    isLoading = true.obs;
    callApiMethods();
  }

  Future<void> callApiMethods() async {
    isLoading(true);

    controller.surah.value = await fetchSurah(
      surahNumber: widget.surahNumber,
      language: widget.language,

      edition: widget.title,
    );
    for (var noUse in controller.surah.value.data!.ayahs!) {
      playOrPauseIconList.add(false);
      textColorChangeList.add(false); // Initialize all text color to false
    }
    isLoading(false);
print('ok: '+
    controller.surah.value.data!.ayahs![0].number.toString());
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
        title: Text(widget.surahTitle),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => AudioPlayerDialog(
                  playUrl:
                      'https://cdn.islamic.network/quran/audio-surah/128/ar.alafasy/${widget.surahNumber}.mp3',
                ),
              );
            },
            icon: Icon(
              Icons.play_arrow,
            ),
          ),
        ],
      ),
      body: Obx(() {
        return isLoading.isTrue
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(13.0),
                child: ListView.builder(
                  itemCount: controller.surah.value.data!.ayahs!.length,
                  itemBuilder: (context, index) {
                    final ayah = controller.surah.value.data!.ayahs![index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: Get.width,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(21),
                            onTap: () async {
                              Get.to(
                                AyatImageScreen(
                                  surahNumber: widget.surahNumber,
                                  ayatNumber: (index + 1),
                                ),
                              );
                            },
                            child: Card(
                              color: textColorChangeList[index]
                                  ? Colors.amber
                                  : null, // Change text color

                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    playOrPauseIconList[index]
                                        ? InkWell(
                                            onTap: () {
                                              isWholeSurahAudioIsPlaying =
                                                  false;
                                              playOrPauseIconList[index] =
                                                  !playOrPauseIconList[index];
                                              audioPlayer.pause();
                                              textColorChangeList[index] =
                                                  false; // Change text color state
                                              setState(() {});
                                            },
                                            child: Icon(
                                              Icons.pause,
                                              color: textColorChangeList[index]
                                                  ? Colors.white
                                                  : null, // Change text color
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () async {

                                              isWholeSurahAudioIsPlaying =
                                                  false;
                                              if (audioPlayer.playing) {
                                                audioPlayer.pause();
                                              }
                                              for (var i = 0;
                                                  i <
                                                      playOrPauseIconList
                                                          .length;
                                                  i++) {
                                                playOrPauseIconList[i] = false;
                                                textColorChangeList[i] =
                                                    false; // Change text color state
                                              }
                                              playOrPauseIconList[index] =
                                                  !playOrPauseIconList[index];
                                              textColorChangeList[index] =
                                                  true; // Change text color state
                                              setState(() {});
                                              print('widget.totalPreviousVerses + index + 1: '+(widget.totalPreviousVerses + index + 1).toString());
                                              print('======================================');
                                            //  controller.surah.value.data!.ayahs![0].number;
                                              await audioPlayer.setUrl(
                                                  'https://cdn.islamic.network/quran/audio/128/ar.alafasy/${(controller.surah.value.data!.ayahs![index].number)}.mp3');
                                          //    await audioPlayer.setUrl(
                                            //      'https://cdn.islamic.network/quran/audio/128/ar.alafasy/${(widget.totalPreviousVerses + index + 1)}.mp3');

                                              await audioPlayer.play();
                                            },
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: textColorChangeList[index]
                                                  ? Colors.black
                                                  : Colors
                                                      .amber, // Change text color
                                            ),
                                          ),
                                    SizedBox(width: 4),
                                    InkWell(
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                        size: 17,
                                      ),
                                      onTap: () async {
                                        await Share.share(ayah.text.toString());
                                      },
                                    ),
                                    Expanded(
                                      child: RichText(
                                        textDirection: TextDirection.rtl,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: ayah.text.toString(),
                                              style: TextStyle(
                                                fontSize: 19,
                                                color: textColorChangeList[
                                                        index]
                                                    ? Colors.black
                                                    : null, // Change text color
                                              ),
                                            ),
                                            const TextSpan(text: ' '),
                                            const TextSpan(text: ' '),
                                            TextSpan(
                                              text: '${index + 1}',
                                              style: TextStyle(
                                                color: textColorChangeList[
                                                        index]
                                                    ? Colors.black
                                                    : Colors
                                                        .amber, // Change text color
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
      }),
    );
  }
}
