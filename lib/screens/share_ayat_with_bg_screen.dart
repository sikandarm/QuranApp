import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:get/get.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareAyatWithBgScreen extends StatefulWidget {
  ShareAyatWithBgScreen({
    super.key,
    required this.text,
    required this.surahNumberOrTitle,
    required this.ayatNumber,
  });
  final String text;
  String? surahNumberOrTitle;
  int? ayatNumber;

  @override
  State<ShareAyatWithBgScreen> createState() => _ShareAyatWithBgScreenState();
}

class _ShareAyatWithBgScreenState extends State<ShareAyatWithBgScreen> {
  List<String> assetImagePaths = [
    'assets/images/frame_1.png',
    'assets/images/frame_2.png',
    'assets/images/frame_3.png',
    'assets/images/frame_4.png',
    'assets/images/frame_5.png',
    'assets/images/frame_6.png',
    'assets/images/frame_7.png',
    'assets/images/frame_8.png',
    'assets/images/frame_9.png',
    'assets/images/frame_10.png',
    'assets/images/frame_11.png',
    'assets/images/frame_12.png',
    'assets/images/frame_13.png',
    'assets/images/frame_14.png',
    'assets/images/frame_15.png',
    'assets/images/frame_16.png',
  ];

  int selectedIndex = 0;

  Uint8List? imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Greetings'),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () async {
              final image = await screenshotController.capture();

              ///////////////////////////////
              await shareScreenshot(image!.buffer.asUint8List());

////////////////////////////////////////////
              // if (image != null) {
              //   final bytes = image.buffer.asUint8List();
              //   final tempDir = Directory.systemTemp;
              //   final file = File('${tempDir.path}/screenshot.png');
              //   await file.writeAsBytes(bytes);

              //   await Share.shareFiles(
              //     [file.path],
              //     // title: 'Screenshot',
              //     mimeTypes: ['image/png'],
              //   );
              // }
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: Column(
        children: [
          Screenshot(
            controller: screenshotController,
            child: Stack(
              children: [
                Image.asset(
                  //  'assets/images/bg_1.jpg', // Replace 'assets/your_image.png' with your image path
                  assetImagePaths[selectedIndex],
                  width: MediaQuery.of(context).size.width,
                  height: 370,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 370,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Surah No ${widget.surahNumberOrTitle} : Ayat No ${widget.ayatNumber}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: Get.width,
          //   height: 150,
          //   child: InfiniteCarousel.builder(
          //     itemCount: 1,
          //     itemExtent: 150,
          //     center: false,
          //     anchor: 0.0,

          //     velocityFactor: 0.2,
          //     onIndexChanged: (index) {},
          //     //  controller: controller,
          //     axisDirection: Axis.horizontal,
          //     //  loop: true,
          //     itemBuilder: (context, itemIndex, realIndex) {
          //       return Container(
          //           //   width: 200,
          //           //  height: 200,
          //           child: Card(
          //         color: Colors.red,
          //       ));
          //     },
          //   ),
          // )
          Container(
            width: Get.width,
            height: 130,
            child: FlutterCarousel.builder(
                options: CarouselOptions(
                  scrollBehavior: const MaterialScrollBehavior(),
                  // height: 400.0,

                  aspectRatio: 16 / 9,
                  viewportFraction: 0.4,
                  initialPage: 0,
                  //    enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: false,
                  //  autoPlayInterval: const Duration(seconds: 2),
                  //  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  //  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  //  controller: CarouselController(),
                  //  onPageChanged: callbackFunction,
                  //  pageSnapping: true,
                  scrollDirection: Axis.horizontal,
                  pauseAutoPlayOnTouch: true,
                  pauseAutoPlayOnManualNavigate: true,
                  // pauseAutoPlayInFiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  disableCenter: true,
                  showIndicator: false,
                  onPageChanged: (index, reason) {
                    selectedIndex = index;
                    setState(() {});
                  },
                  // floatingIndicator = true,
                  //   slideIndicator: CircularSlideIndicator(),
                ),
                itemCount: assetImagePaths.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Container(
                    width: 200,
                    height: 130,
                    child: Card(
                      //    color: Colors.red,
                      child: Image.asset(
                        assetImagePaths[itemIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

Future<void> shareScreenshot(Uint8List imageBytes) async {
  final tempDir = Directory.systemTemp;
  final file = File('${tempDir.path}/screenshot.png');
  await file.writeAsBytes(imageBytes);

  // Use ShareXFiles for broader sharing options
  final result = await Share.shareXFiles(
    [XFile(file.path)],
    subject: 'Screenshot', // Optional title
    // Important for WhatsApp recognition
  );

  if (result.status == ShareResultStatus.success) {
    print('Screenshot shared successfully!');
  } else {
    print('Sharing failed with status: ${result.status}');
    // Handle errors (optional)
  }

  // Delete temporary file (optional)
  await file.delete();
}
