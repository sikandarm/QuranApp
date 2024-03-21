import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AyatAudioScreen extends StatefulWidget {
  const AyatAudioScreen({
    super.key,
    required this.verseNumberInWholeQuran,
  });
  final int verseNumberInWholeQuran;

  @override
  State<AyatAudioScreen> createState() => _AyatAudioScreenState();
}

class _AyatAudioScreenState extends State<AyatAudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    // await audioPlayer.setUrl(
    //     'https://cdn.islamic.network/quran/audio/128/ar.alafasy/6236.mp3');
    await audioPlayer.setUrl(
        'https://cdn.islamic.network/quran/audio/128/ar.alafasy/${widget.verseNumberInWholeQuran}.mp3');
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
        title: const Text('Ayat Audio Screen'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await audioPlayer.play();
      }),
      body: Column(
        children: [],
      ),
    );
  }
}
