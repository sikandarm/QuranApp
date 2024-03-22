import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/utils/audio_player_dialog.dart';

import 'screens/main_screen.dart';
import 'screens/quran_section_screen.dart';
import 'theme/themeData.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      title: 'Ramazan App',
      //  theme: ThemeData(
      //    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //    useMaterial3: true,
      //  ),
      //  home: QuranSectionScreen(),
      ///////////////////////////////////////////////////////////
      home: MainScreen(),
      // home: AudioSettingsPage()
      /////////////////////////////////////////////////////////////
      // home: QuranSurahsScreen(),
    );
  }
}
