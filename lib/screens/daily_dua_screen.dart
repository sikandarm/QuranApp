import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/dua_azkar_screen.dart';

class DailyDuaScreen extends StatelessWidget {
  const DailyDuaScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          //  crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int i = 0; i < dailyDuas.length; i++) ...{
              Container(
                width: Get.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [
                        Text(
                          dailyDuas[i],
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.amber, fontSize: 17.5),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Divider(),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          dailyDuasEnglish[i],
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            }
          ],
        ),
      ),
    );
  }
}

List<String> dailyDuas = [
  'رَبَّنَآ ءَامَنَّا بِمَآ أَنزَلۡتَ وَٱتَّبَعۡنَا ٱلرَّسُولَ فَٱكۡتُبۡنَا مَعَ ٱلشَّٰهِدِينَ',
  'رَبَّنَا اغْفِرْ لَنَا ذُنُوْبَنَا وَ اِسْرَافَنَا فِيْٓ اَمْرِنَا وَثَبِّتْ اَقْدَامَنَا وَانْصُرْنَا عَلَي الْقَوْمِ الْكٰفِرِيْنَ',
  'رَبَّنَا افْتَحْ بَيْنَنَا وَبَيْنَ قَوْمِنَا بِالْحَقِّ وَأَنتَ خَيْرُ الْفَاتِحِينَ',
  'رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَتَوَفَّنَا مُسْلِمِينَ',
  'عَلَى اللَّهِ تَوَكَّلْنَا رَبَّنَا لَا تَجْعَلْنَا فِتْنَةً لِلْقَوْمِ الظَّالِمِينَ وَنَجِّنَا بِرَحْمَتِكَ مِنَ الْقَوْمِ الْكَافِرِينَ',
  'رَبَّنَا إِنَّكَ تَعْلَمُ مَا نُخْفِي وَمَا نُعْلِنُ وَمَا يَخْفَى عَلَى اللّهِ مِن شَيْءٍ فَي الأَرْضِ وَلاَ فِي السَّمَاء',
];

List<String> dailyDuasEnglish = [
  'Our Lord! We believe in what Thou hast revealed, and we follow the Messenger. Then write us down among those who bear witness.',
  'Our Lord! Forgive us our sins and our transgressions (in keeping our duties to You), establish our feet firmly, and give us victory over the disbelieving folk.',
  'Our Lord! Decide Thou between us and our people in truth, for Thou art the best to decide.',
  'Our Lord! pour out on us patience, and cause us to die as Muslims.',
  'Upon Allah do we rely. Our Lord, make us not [objects of] trial for the wrongdoing people. And save us by Your mercy from the disbelieving people.',
  'O our Lord! Truly Thou dost know what we conceal and what we reveal: for nothing whatever is hidden from Allah, whether on earth or in heaven',
];
