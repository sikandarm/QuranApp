import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/getAllHadithBooks.dart';
import 'hadith_screen.dart';

class HadithSectionScreen extends StatefulWidget {
  const HadithSectionScreen({super.key});

  @override
  State<HadithSectionScreen> createState() => _HadithSectionScreenState();
}

class _HadithSectionScreenState extends State<HadithSectionScreen> {
  HadithBooksDataModel? hadithBooksDataModel;

  List<String> hadithBooks = [
    'Sahih Bukhari',
    'Sahih Muslim',
    'Jami\' Al-Tirmirdhi',
    'Sunan Abu Dawood',
    'Sunan Ibn-e-Majah',
    'Sunan An-Nasa`i',
    'Mishkat Al-Masabih',
  ];

  List<String> hadithBooksArabic = [
    'صحيح البخاري',
    'صحيح مسلم',
    'جامع الترمذي',
    'سنن أبو داود',
    'سنن ابن ماجه',
    'سنن النسائي',
    'مشكاة المصابيح',
  ];
  List<String> hadithBooksSlugs = [
    'sahih-bukhari',
    'sahih-muslim',
    'al-tirmidhi',
    'abu-dawood',
    'ibn-e-majah',
    'sunan-nasai',
    'mishkat',
  ];
  @override
  void initState() {
    getHadithData();
    super.initState();
  }

  Future<void> getHadithData() async {
    hadithBooksDataModel = await fetchAllHadithBooks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const valueStyle = TextStyle(
      color: Color(0xffffae2138),
      fontWeight: FontWeight.bold,
      fontSize: 14.5,
    );

    const subTitleStyle = TextStyle(
      color: Color(0xffffae2138),
      fontSize: 13,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      //   backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Hadith Section'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: Get.width,
            child: Image.asset(
              'assets/images/peach_bg_motorolla_new.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 17),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 11.0,
                    vertical: 4.5,
                  ),
                  child: GridView.builder(
                    itemCount: hadithBooks.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0,
                      childAspectRatio: 2 / 1.5,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            print('going to HadithScreen');
                            Get.to(HadithScreen(
                              bookTitle:
                                  hadithBooksDataModel!.books![index].bookName!,
                              bookSlug: hadithBooksSlugs[index],
                            ));
                          },
                          child: HadithEditionTileCard(
                              valueStyle, index, subTitleStyle));
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget HadithEditionTileCard(
      TextStyle headingStyle, int i, TextStyle valueStyle) {
    return Container(
      width: 165,
      height: 160,
      child: Card(
        margin: EdgeInsets.zero,
        color: Color.fromARGB(110, 216, 200, 189),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                hadithBooks[i],
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: headingStyle,
              ),
              Text(
                hadithBooksArabic[i],
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: valueStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
