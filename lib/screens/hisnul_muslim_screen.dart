import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/dua_azkar_screen.dart';

class HisnulMuslimScreen extends StatelessWidget {
  const HisnulMuslimScreen({super.key, required this.title});
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
            for (int i = 0; i < hisnulMuslim.length; i++) ...{
              Container(
                width: Get.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [
                        Text(
                          hisnulMuslim[i],
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.amber, fontSize: 17.5),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          hisnulMuslimEnglish[i],
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white),
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

List<String> hisnulMuslim = [
  'لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شَـريكَ له، لهُ المُلـكُ ولهُ الحَمـد، وهوَ على كلّ شيءٍ قدير، سُـبْحانَ اللهِ، والحمْـدُ لله ، ولا إلهَ إلاّ اللهُ واللهُ أكبَر، وَلا حَولَ وَلا قوّة إلاّ باللّهِ العليّ العظيم',
  '(بِسْمِ الله ) اللّهُـمَّ إِنِّـي أَعـوذُ بِـكَ مِـنَ الْخُـبْثِ وَالْخَبائِث',
  'غُفْـرانَك',
  'اللّهُـمَّ اجْعَـلْ في قَلْبـي نورا ، وَفي لِسـاني نورا، وَاجْعَـلْ في سَمْعي نورا، وَاجْعَـلْ في بَصَري نورا، وَاجْعَـلْ مِنْ خَلْفي نورا، وَمِنْ أَمامـي نورا، وَاجْعَـلْ مِنْ فَوْقـي نورا ، وَمِن تَحْتـي نورا .اللّهُـمَّ أَعْطِنـي نورا',
  'التَّحِيّـاتُ للهِ وَالصَّلَـواتُ والطَّيِّـبات ، السَّلامُ عَلَيـكَ أَيُّهـا النَّبِـيُّ وَرَحْمَـةُ اللهِ وَبَرَكـاتُه ، السَّلامُ عَلَيْـنا وَعَلـى عِبـادِ كَ الصَّـالِحـين . أَشْـهَدُ أَنْ لا إِلـهَ إِلاّ الله ، وَأَشْـهَدُ أَنَّ مُحَمّـداً عَبْـدُهُ وَرَسـولُه',
  'اللّهُـمَّ أَنْـتَ السَّلامُ ، وَمِـنْكَ السَّلام ، تَبارَكْتَ يا ذا الجَـلالِ وَالإِكْـرام',
];

List<String> hisnulMuslimEnglish = [
  'None has the right to be worshipped except Allah, alone without associate, to Him belongs sovereignty and praise and He is over all things wholly capable. How perfect Allah is, and all praise is for Allah, and none has the right to be worshipped except Allah, Allah is the greatest and there is no power nor might except with Allah, The Most High, The Supreme. O my Lord forgive me.',
  '(In the name of Allah). O Allah, I take refuge with you from all evil and evil-doers.',
  'I ask You (Allah) for forgiveness.',
  'O Allah, place within my heart light, and upon my tongue light, and within my ears light, and within my eyes light, and place behind me light and in front of me light and above me light and beneath me light. O Allah, bestow upon me light.',
  'At-tahiyyat is for Allah. All acts of worship and good deeds are for Him. Peace and the mercy and blessings of Allah be upon you O Prophet. Peace be upon us and all of Allah\'s righteous servants. I bear witness that none has the right to be worshipped except Allah and I bear witness that Muhammad is His slave and Messenger. At-tahiyyat: all words which indicate the glorification of Allah. His eternal existence, His perfection and His sovereignty.',
  'O Allah, You are As-Salam and from You is all peace, blessed are You, O Possessor of majesty and honour. AS-Salam: The One Who is free from all defects and deficiencies.',
];
