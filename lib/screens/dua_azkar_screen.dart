import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/evening_azkar_screen.dart';
import 'package:ramazan_app_new_v1/screens/morning_azkar_screen.dart';

class DuaAzkarScreen extends StatelessWidget {
  DuaAzkarScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 1,
      ),
      body: Column(
        children: [
          const SizedBox(height: 11),
          InkWell(
            onTap: () {
              Get.to(MorningAzkarScreen());
            },
            child: Container(
              height: 80,
              child: const Card(
                child: Center(
                  child: ListTile(
                    title: Text(
                      'Morning Azkar',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 0),
          InkWell(
            onTap: () {
              Get.to(EveningAzkarScreen());
            },
            child: Container(
              height: 80,
              child: const Card(
                child: Center(
                  child: ListTile(
                    title: Text(
                      'Evening Azkar',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: arabicAzkarDua.length,
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: Padding(
          //           padding: const EdgeInsets.all(13.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               const SizedBox(height: 4),
          //               Text(
          //                 arabicAzkarDua[index],
          //                 textAlign: TextAlign.end,
          //                 style: const TextStyle(
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               const SizedBox(height: 7),
          //               const Divider(
          //                 color: Colors.amber,
          //               ),
          //               const SizedBox(height: 7),
          //               Text(
          //                 englisAzkarDua[index],
          //                 style: const TextStyle(color: Colors.white),
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////
List<String> arabicAzkarDua = [
  'رَبَّنَا تَقَبَّلْ مِنَّا إِنَّكَ أَنْتَ السَّمِيعُ العَلِيمُ',
  'رَبَّنَا وَاجْعَلْنَا مُسْلِمَيْنِ لَكَ وَمِن ذُرِّيَّتِنَا أُمَّةً مُّسْلِمَةً لَّكَ وَأَرِنَا مَنَاسِكَنَا وَتُبْ عَلَيْنَآ إِنَّكَ أَنتَ التَّوَّابُ الرَّحِيمُ',
  'رَبَّنَآ اٰتِنَا فِي الدُّنْيَا حَسَنَةً وَّفِي الْاٰخِرَةِ حَسَـنَةً وَّقِنَا عَذَابَ النَّارِ',
  'رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْراً وَثَبِّتْ أَقْدَامَنَا وَانصُرْنَا عَلَى القَوْمِ الكَافِرِينَ',
  'ۭرَبَّنَا لَا تُؤَاخِذْنَآ اِنْ نَّسِيْنَآ اَوْ اَخْطَاْنَا ۚ رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَآ اِصْرًا كَمَا حَمَلْتَهٗ عَلَي الَّذِيْنَ مِنْ قَبْلِنَا ۚ رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهٖ ۚ وَاعْفُ عَنَّا ۪ وَاغْفِرْ لَنَا ۪ وَارْحَمْنَا ۪ اَنْتَ مَوْلٰىنَا فَانْــصُرْنَا عَلَي الْقَوْمِ الْكٰفِرِيْنَ',
  'رَبَّنَا لَا تُزِغْ قُلُوْبَنَا بَعْدَ اِذْ ھَدَيْتَنَا وَھَبْ لَنَا مِنْ لَّدُنْكَ رَحْمَةً ۚ اِنَّكَ اَنْتَ الْوَھَّابُ',
];
List<String> englisAzkarDua = [
  'Our Lord! Accept (this service) from us: For Thou art the All-Hearing, the All-knowing.',
  'Our Lord! Make of us Muslims, bowing to Thy (Will), and of our progeny a people Muslim, bowing to Thy (will); and show us our place for the celebration of (due) rites; and turn unto us (in Mercy); for Thou art the Oft-Returning, Most Merciful.',
  'Our Lord! Give us in this world that which is good and in the Hereafter that which is good, and save us from the torment of the Fire!',
  'Our Lord! Bestow on us endurance, make our foothold sure, and give us help against the disbelieving folk.',
  'Allah burdens not a person beyond his scope. He gets reward for that (good) which he has earned, and he is punished for that (evil) which he has earned. "Our Lord! Punish us not if we forget or fall into error, our Lord! Lay not on us a burden like that which You did lay on those before us; our Lord! Put not on us a burden greater than we have strength to bear. Pardon us and grant us Forgiveness. Have mercy on us. You are our Maula (Patron, Supporter and Protector, etc.) and give us victory over the disbelieving people.',
  'Our Lord! Let not our hearts deviate (from the truth) after You have guided us, and grant us mercy from You. Truly, You are the Bestower.',
];
////////////////////////////////////////////////////////////
