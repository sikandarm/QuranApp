import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/dua_azkar_screen.dart';

class RamadanDuaScreen extends StatelessWidget {
  const RamadanDuaScreen({super.key, required this.title});
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
            for (int i = 0; i < ramadanDua.length; i++) ...{
              Container(
                width: Get.width,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      children: [
                        Text(
                          ramadanDua[i],
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: Colors.amber,
                            fontSize: 17.5,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          ramadanDuaEnglish[i],
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

List<String> ramadanDua = [
  'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي رَبَّنَا وَتَقَبَّلْ دُعَاءِ . رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ',
  'رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ وَاجْعَلْنَا لِلْمُتَّقِينَ إِمَامًا',
  'الْلَّهُمَّ اِنَّكَ عَفُوٌّ تُحِبُّ الْعَفْوَ فَاعْفُ عَنِّي',
  'ذَهَبَ الظَّمَأُ وَابْتَلَّتِ الْعُرُوقُ وَثَبَتَ الأَجْرُ إِنْ شَاءَ اللَّهُ',
  'اللَّهُمَّ إِنِّي أَسْأَلُكَ الهُدَى وَ التُّقَى وَ العَفَافَ وَ الغِنَى',
  'اللَّهُمَّ اهْدِني ، وسَدِّدْنِي',
  'اللَّهُمَّ انْفَعْنِي بِمَا عَلَّمْتَنِي وَ عَلِّمْنِي مَا يَنْفَعُنِي وَ زِدْنِي عِلْمًا',
];

List<String> ramadanDuaEnglish = [
  'My Lord! Make me steadfast in the Prayer, and also my children, our Lord. And do accept my supplication. Our Lord! Forgive me and my parents — and all the believers — on the day the reckoning arises',
  'Our Lord! Grant us in our spouses and our children the joy of our eyes. Moreover, make us an exemplar of goodness for the God-fearing',
  'O Allah, You are the Most forgiving, and You love to forgive, so forgive me.',
  'Thirst has gone, the arteries are moist, and the reward is sure, if Allah wills.',
  'O Allah, I ask You for guidance andpiety, and abstinence (from the unlawful) and modesty, and contentment and sufficiency.',
  'O Allah! Direct me to the Right Path and make me adhere to the Straight Path.',
  'O Allah, benefit me with what You have taught me, and teach me that which will benefit me, and increase me in knowledge.',
];
