import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hadith/classes.dart';
import 'package:hadith/hadith.dart';

import '../models/getAllHadithBooks.dart';
import 'hadith_screen.dart';

class HadithSectionScreen extends StatefulWidget {
  const HadithSectionScreen({super.key});

  @override
  State<HadithSectionScreen> createState() => _HadithSectionScreenState();
}

class _HadithSectionScreenState extends State<HadithSectionScreen> {
  List<Collection>? collections;
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
    collections = getCollections();
    hadithBooksDataModel = await fetchAllHadithBooks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const headingStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.amber,
    );
    const valueStyle = TextStyle(
      color: Colors.white,
      //  fontWeight: FontWeight.bold,
    );

    return Scaffold(
      //   backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Hadith Section'),
      ),
      body: Column(
        children: [
          SizedBox(height: 21),
          Expanded(
            child: GridView.builder(
              itemCount: hadithBooks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
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
                    child:
                        HadithEditionTileCard(headingStyle, index, valueStyle));
              },
            ),
          ),
        ],
      ),
    );
  }

  Card HadithEditionTileCard(
      TextStyle headingStyle, int i, TextStyle valueStyle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        // side: BorderSide(
        //   color: Colors.amber,
        // ),
      ),
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
              style: valueStyle,
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
    );
  }
}
