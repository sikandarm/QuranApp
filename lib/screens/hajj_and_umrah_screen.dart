import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/dua_azkar_screen.dart';

class HajjAndUmrahScreen extends StatelessWidget {
  const HajjAndUmrahScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            child: Image.asset(
              'assets/images/peach_bg_motorolla_new.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < hajjAndUmrahDua.length; i++) ...{
                  Container(
                    width: Get.width,
                    child: Card(
                      margin: EdgeInsets.all(9),
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
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Column(
                          children: [
                            Text(
                              hajjAndUmrahDua[i],
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                fontSize: 17.5,
                                color: Color(0xffff951d31),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Divider(
                              color: Color(0xffff951d31),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              hajjAndUmrahDuaEnglish[i],
                              textAlign: TextAlign.left,
                              style: const TextStyle(color: Colors.black),
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
        ],
      ),
    );
  }
}

List<String> hajjAndUmrahDua = [
  'اَللّٰہُمَّ الْبَیْتُ بَیْتُکَ وَ الْعَبْدُ عَبْدُکَ وَ ہٰذَا مَقَامُ الْعَائِذِ بِکَ مِنَ النَّارِ اَللّٰہُمَّ مِنْ قِبَلِکَ الرَّوْحُ وَ الْفَرَجُ وَ الْعَافِیَۃُ اَللّٰہُمَّ اِنَّ عَمَلِیْ ضَعِیْفٌ فَضَاعِفْہُ لِیْ وَ اغْفِرْ لِیْ مَا اطَّلَعْتَ عَلَیْہِ مِنِّیْ وَ خَفِيَ عَلٰی خَلْقِکَ اَسْتَجِیْرُ بِاللّٰہِ مِنَ النَّارِ',
  'اَلْحَمْدُ لِلہِ الَّذِیْ رَزَقَنِیْ مَا اُوَارِیْ بِہٖ عَوْرَتِیْ وَ اُؤَدِّیْ فِیْہِ فَرْضِیْ وَ اَعْبُدُ فِیْہِ رَبِّیْ وَ اَنْتَہِیْ فِیْہِ اِلٰی مَا اَمَرَنِیْ اَلْحَمْدُ لِلہِ الَّذِیْ قَصَدْتُہٗ فَبَلَّغَنِیْ وَ اَرِدْتُہٗ فَاَعَانَنِیْ وَ قَبِلَنِیْ وَ لَمْ یَقْطَعْ بِیْ وَ وَجْہَہٗ اَرَدْتُ فَسَلَّمَنِیْ فَہُوَ حِصْنِیْ وَ کَہْفِیْ وَ حِرْزِیْ وَ ظَہْرِیْ وَ مَلاَذِیْ وَ رَجَآئِیْ وَ مَنْجَایَ وَ ذُخْرِیْ وَ عُدَّتِیْ فِیْ شِدَّتِیْ وَ رَخَآئِیْ',
  'اَللّٰہُمَّ اِنِّی اَسْأَلُکَ اَنْ تَجْعَلَنِی مِمَّنْ اسْتَجَابَ لَکَ وَ آمَنَ بِوَعْدِکَ وَاتَّبَعَ اَمْرَکَ فَاِنِّیْ عَبْدُکَ وَ فِی قَبْضَتِکَ لاَ اُوْقیٰ اِلاَّ مَا وَقَیْتَ وَ لاَ آخُذُ اِلاَّ مَا اَعْطَیْتَ وَ قَدْ ذَکَرْتَ الحَجَّ فَاَسْئَلُکَ اَنْ تَعْزِمَ لِیْ عَلَیْہِ عَلیٰ کِتَابِکَ وَ سُنَّۃِ نَبِیِّکَ صَلَوَاتُکَ عَلَہْہِ وَ آلِہٖ وَ تُقَوِّیَنِیْ عَلیٰ مَا ضَعُفْتُ عَنْہُ وَ تُسَلِّمَ مِنِّیْ مَنَاسِکِی فِیْ یُسْرٍ مِنْکَ وَ عَافِیَۃٍ وَاجْعَلْنِی مِنْ وَفْدِکَ الَّذِیْ رَضِیْتَ وَارْتَضَیْتَ وَ سَمَّیْتَ وَ کَتَبْتَ اَللّٰہُمَّ اِنِّیْ خَرَجْتُ مِنْ شُقَّۃٍ بَعِیْدَۃٍ وَ اَنْفَقْتُ مَالِیْ اِبْتِغَآءَ مَرْضَاتِکَ اَللّٰہُمَّ فَتَمِّمْ لِیْ حَجَّتِیْ وَ عُمْرَتِیْ اَللّٰہُمَّ اِنِّیْ اُرِیْدُ التَّمَتُّعَ بِالْعُمْرَۃِ اِلٰی الحَجِّ عَلٰی کِتَابِکَ وَ سُنَّۃِ نَبِیِّکَ صَلَوَاتُکَ عَلَیْہِ وَ آلِہٖ فَاِنْ عَرَضَ لِی عَارِضٌ یَحْبِسُنِیْ فَحَلَّنِی حَیْثُ حَبَسْتَنِی بِقَدَرِکَ الَّذِیْ قَدَّرْتَ عَلَیَّ اَللّٰہُمَّ اِنْ لَمْ تَکُنْ حَجَّۃً فَعُمْرَۃً اُحْرِمُ لَکَ شَعْرِی وَ بَشَرِیْ وَ لَحْمِیْ وَ دَمِیْ وَ عِظَامِیْ وَ مُخِّیْ وَ عَصَبِیْ مِنَ النِسَآءِ وَ الْثِّیَابِ وَ الطِّیْبِ اَبْتَغِیْ بِذَلٰکَ وَجْہَکَ وَ الدَّارَ الآخِرَۃِ',
  'اَللّٰہُمَّ قَنِّعْنِیْ بِمَا رَزَقْتَنِیْ وَ بَارِکْ لِیْ فِیْمَا آتَیْتَنِیْ',
  'بِسْمِ اللّٰہِ وَ بِاللّٰہِ اَللّٰہُمَّ اجْعَلْہُ لِیْ نُوْرًا وَ طَہُوْرًا وَ حِرْزًا وَ اَمْنًا مِنْ کُلِّ خَوْفٍ وَ شِفَآءً مِنْ کُلِّ دَآءٍ وَ سُقْمٍ اَللّٰہُمَّ طَہِّرْنِیْ وَ طَہِّرْ لِیْ قَلْبِیْ وَ اشْرَحْ لِیْ صَدْرِیْ وَ اَجْرِ عَلٰی لِسَانِیْ مَحَبَّتَکَ وَ مِدْحَتَکَ وَ الثَّنَآءَ عَلَیْکَ فَاِنَّہٗ لاَ قُوَّۃً لِیْ اِلاَّ بِکَ وَ قَدْ عَلِمْتُ اَنَّ قِوَامَ دِیْنِیْ التَّسْلِیْمُ لِاَمْرِکَ وَ الْاِتِّبَاعُ لِسُنَّۃِ نَبِیِّکَ صَلَوَاتُکَ عَلَیْہِ وَ آلِہٖ',
];

List<String> hajjAndUmrahDuaEnglish = [
  'O God, the house is your house and the servant is your servant and this is the place of the one who seeks refuge with you from the fire. O God, from your soul, relief and well-being. Oh God, my deed is weak, so double it for me and forgive me for what you have revealed to me and what is hidden from your creation. I seek refuge in God. From the fire',
  'Praise be to God who has provided me with what is concealed of my private parts, and in which I fulfill my duty, and in it I worship my Lord, and in it I complete my duty. Whatever He commanded me, praise be to God. I went to it and it reached me, and I wanted it. He helped me and accepted me and did not break off from my face. ہٗ I wanted, but He handed me over, and He is my fortress, my shelter, my guard, my back, and my refuge. And my hope and my refuge and my reserve and my equipment in my hardship and my prosperity.',
  'O Allah, I ask You to make me among those who respond to You, believe in Your promise, and follow Your command. For I am Your servant, and in Your grasp, I am unable to escape except what You allow, and I take only what You give. You have mentioned Hajj, so I ask You to enable me to perform it according to Your Book and the Sunnah of Your Prophet, may Your blessings be upon him and his family. Strengthen me in what I have become weak and accept from me my rituals with ease and well-being. Make me among Your chosen ones, whom You are pleased with and have chosen and named. O Allah, I have come from a distant place and spent my wealth seeking Your pleasure. O Allah, complete my Hajj and Umrah for me. O Allah, I desire to enjoy life until the time of Hajj, according to Your Book and the Sunnah of Your Prophet, may Your blessings be upon him and his family. If anything obstructs me, grant me a solution wherever I may be, according to Your decree. O Allah, if it\'s not Hajj, then let it be Umrah, and I vow to abstain from cutting my hair, nails, and wearing perfumes, seeking thereby Your countenance and the ultimate abode.',
  'Oh God, satisfy me with what You have provided me with and bless me with what You have given me.',
  'In the name of God and in the name of God, O God, make it a light, purity, protection, and security from every fear, and a cure from every illness and disease. O God, purify me and purify my heart for me and expand my breast for me and reward my tongue with your love and praise and praise for you. There is no strength except in You And I have learned that the foundation of my religion is submission to your command and following the Sunnah of your Prophet, may your prayers and peace be upon him and his family.',
];
