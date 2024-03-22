// import 'package:flutter/material.dart';
// import '../models/getAllBookHadiths.dart';

// class HadithScreen extends StatefulWidget {
//   const HadithScreen({Key? key, required this.bookTitle}) : super(key: key);
//   final String bookTitle;

//   @override
//   State<HadithScreen> createState() => _HadithScreenState();
// }

// class _HadithScreenState extends State<HadithScreen> {
//   @override
//   void initState() {
//     getRespectiveHaidth();
//     super.initState();
//   }

//   List<HadithDataModel>? hadithDataModel;

//   Future<void> getRespectiveHaidth() async {
//     hadithDataModel = await fetchAllBooksHadith();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.bookTitle),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             if (hadithDataModel != null)
//               for (int i = 0; i < hadithDataModel!.length; i++)
//                 // Center(
//                 //   child: Text(i.toString()),
//                 // )
//                 ...{
//                 for (int j = 0; j < hadithDataModel!.length; j++) ...{
//                   Card(
//                     child: Padding(
//                       padding: const EdgeInsets.all(17.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             hadithDataModel![i]
//                                 .hadiths!
//                                 .data![j]
//                                 .hadithArabic
//                                 .toString(),
//                           ),
//                           Divider(),
//                           Text(
//                             hadithDataModel![i]
//                                 .hadiths!
//                                 .data![j]
//                                 .hadithUrdu
//                                 .toString(),
//                           ),
//                           Divider(),
//                           Text(
//                             hadithDataModel![i]
//                                 .hadiths!
//                                 .data![j]
//                                 .hadithEnglish
//                                 .toString(),

//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 },
//               }
//             else
//               Center(
//                 child: CircularProgressIndicator(), // or any placeholder widget
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

//////////////////////////////////////

import 'package:flutter/material.dart';
import '../models/getAllBookHadiths.dart';
import '../models/hadithStaticModel.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen(
      {Key? key, required this.bookTitle, required this.bookSlug})
      : super(key: key);
  final String bookTitle;
  final String bookSlug;

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  void initState() {
    getRespectiveHadith();
    super.initState();
  }

  List<HadithDataModel>? hadithDataModel;

  Future<void> getRespectiveHadith() async {
    hadithDataModel = await fetchAllBooksHadith(bookSlug: widget.bookSlug);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const valueStyleArabic = TextStyle(
      color: Colors.amber,
      fontSize: 18,
      //  fontWeight: FontWeight.bold,
    );
    const valueStyleUrdu = TextStyle(
      color: Colors.white,
      fontSize: 17,
      //  fontWeight: FontWeight.bold,
    );
    const valueStyleEnglish = TextStyle(
      color: Colors.white,
      fontSize: 17,
      //  fontWeight: FontWeight.bold,
    );

    return Scaffold(
      //  backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.bookTitle),
      ),
      body: hadithDataModel != null
          ? ListView.builder(
              itemCount: hadithDataModel!.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    for (var hadith in hadithDataModel![i].hadiths!.data!)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(17.0),
                          child: Column(
                            children: [
                              Text(
                                hadith.hadithArabic.toString(),
                                textAlign: TextAlign.right,
                                style: valueStyleArabic,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              //   const Divider(
                              //     color: Colors.white,
                              //  ),
                              // const SizedBox(
                              //   height: 4,
                              // ),
                              // Text(
                              //   hadith.hadithUrdu.toString(),
                              //   style: valueStyleUrdu,
                              // ),
                              // const SizedBox(
                              //   height: 4,
                              // ),
                              const Divider(
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                hadith.hadithEnglish.toString(),
                                textAlign: TextAlign.left,
                                style: valueStyleEnglish,
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              Text(
                                hadith.book!.bookName.toString(),
                                style: const TextStyle(color: Colors.amber),
                                //    style: valueStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(), // or any placeholder widget
            ),
    );
  }
}
