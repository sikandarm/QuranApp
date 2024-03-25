import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
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

  double overlaySliderValue = 0.3;
  bool isAppOverlaySliderVisible = true;

  double textFontSize = 14.0;
  Color ayatTextColor = Colors.white;

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
        title: const Text('Share Ayat'),
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/peach_bg_motorolla.png',
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Screenshot(
                controller: screenshotController,
                child: Stack(
                  children: [
                    Image.asset(
                      //  'assets/images/bg_1.jpg', // Replace 'assets/your_image.png' with your image path
                      assetImagePaths[selectedIndex],
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      fit: BoxFit.cover,
                    ),
                    Visibility(
                      visible: isAppOverlaySliderVisible,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 340,
                          color: Colors.black.withOpacity(overlaySliderValue),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 340,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Surah No ${widget.surahNumberOrTitle} : Ayat No ${widget.ayatNumber}',
                              style: TextStyle(
                                  //  color: Colors.white,
                                  color: ayatTextColor),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: ayatTextColor,
                                fontSize: textFontSize,
                              ),
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
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 1),
                decoration: BoxDecoration(
                    color: ui.Color.fromARGB(93, 255, 223, 204),
                    border: Border.all(color: Color(0xffffae2138), width: 2)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        //     height: 11,
                        ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 0),
                      child: Row(
                        children: [
                          Text(
                            'Apply Overlay',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Color(0xffffae2138),
                            ),
                          ),
                          Spacer(),
                          // Switch.adaptive(value: true, onChanged: (val) {}),
                          Container(
                            child: Switch(
                              inactiveTrackColor:
                                  const ui.Color.fromARGB(131, 255, 255, 255),
                              //   inactiveThumbColor: Colors.white,

                              trackOutlineColor:
                                  MaterialStatePropertyAll(Color(0xffffae2138)),
                              //  inactiveThumbImage: ,
                              activeTrackColor: Color(0xffffae2138),
                              activeColor: Color(0xffffdfcc),
                              // thumbColor: MaterialStatePropertyAll(
                              //   Color(0xffffdfcc),
                              // ),
                              inactiveThumbColor: Color(0xffffae2138),
                              value: isAppOverlaySliderVisible,
                              onChanged: (val) {
                                isAppOverlaySliderVisible = val;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      // slider for apply overlay
                      data: const SliderThemeData(
                        thumbColor: Color(0xffffae2138),
                        activeTrackColor: Color(0xffffae2138),
                        trackHeight: 1.3,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 7.5),
                      ),
                      child: Slider(
                          min: 0,
                          max: 1,
                          value: overlaySliderValue,
                          onChanged: (val) {
                            overlaySliderValue = val;
                            setState(() {});
                          }),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: Get.width,
                      height: 70,
                      child: FlutterCarousel.builder(
                          options: CarouselOptions(
                            indicatorMargin: 0,
                            padEnds: false,

                            scrollBehavior: const MaterialScrollBehavior(),
                            // height: 400.0,

                            //aspectRatio: 3 / 2,
                            viewportFraction: 0.25,
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
                            pauseAutoPlayOnTouch: false,
                            pauseAutoPlayOnManualNavigate: false,
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
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return InkWell(
                              onTap: () {
                                selectedIndex = itemIndex;
                                setState(() {});
                              },
                              child: Container(
                                //  width: 200,
                                // height: 130,
                                child: Card(
                                  margin: EdgeInsets.zero,

                                  //    color: Colors.red,
                                  child: Image.asset(
                                    assetImagePaths[itemIndex],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 11),
                      child: Text(
                        'Font Size',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xffffae2138),
                        ),
                      ),
                    ),
                    SliderTheme(
                      data: const SliderThemeData(
                        thumbColor: Color(0xffffae2138),
                        activeTrackColor: Color(0xffffae2138),
                        trackHeight: 1.3,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 7.5),
                      ),
                      child: Slider(
                        min: 12,
                        max: 26,
                        value: textFontSize,
                        onChanged: (val) {
                          textFontSize = val;
                          setState(() {});
                        },
                      ),
                    ),
                    Center(
                      child: IconButton(
                        color: Color(0xffffae2138),
                        iconSize: 34,
                        onPressed: () async {
                          //  ayatTextColor = await colorPickerDialog(context);
                          //  setState(() {});
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pick a color'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    //       pickerColor: currentColor,
                                    // onColorChanged: changeColor,
                                    onColorChanged: (value) {
                                      ayatTextColor = value;
                                      setState(() {});
                                    },
                                    //     showLabel: true,
                                    //   pickerAreaHeightPercent: 0.8,
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('OK'))
                                  // FlatButton(
                                  //   child: Text('OK'),
                                  //   onPressed: () {
                                  //
                                  //   },
                                  // ),
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.color_lens),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> shareScreenshot(Uint8List imageBytes) async {
  final tempDir = Directory.systemTemp;
  final file = File('${tempDir.path}/ayat.png');
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

Future<dynamic> colorPickerDialog(BuildContext context) async {
  return ColorPicker(
    // Use the dialogPickerColor as start color.
    //  color: dialogPickerColor,
    // Update the dialogPickerColor using the callback.
    //  onColorChanged: (Color color) => setState(() => dialogPickerColor = color),
    onColorChanged: (value) {
      print(value);
      Navigator.pop(context, value);
    },
    width: 40,
    height: 40,
    borderRadius: 4,
    spacing: 5,
    runSpacing: 5,
    wheelDiameter: 155,
    heading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Select Color',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    ),
    subheading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Select Color Shade',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    ),
    wheelSubheading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    ),
    // showMaterialName: true,
    // showColorName: true,
    //   showColorCode: true,
    copyPasteBehavior: const ColorPickerCopyPasteBehavior(
      longPressMenu: true,
    ),
    materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
    colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
    colorCodeTextStyle: Theme.of(context).textTheme.bodySmall,
    pickersEnabled: const <ColorPickerType, bool>{
      ColorPickerType.both: false,
      ColorPickerType.primary: true,
      ColorPickerType.accent: true,
      ColorPickerType.bw: false,
      ColorPickerType.custom: true,
      ColorPickerType.wheel: true,
    },
    customColorSwatchesAndNames: colorsNameMap,
  ).showPickerDialog(
    context,
    // New in version 3.0.0 custom transitions support.
    transitionBuilder: (BuildContext context, Animation<double> a1,
        Animation<double> a2, Widget widget) {
      final double curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
      return Transform(
        transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
        child: Opacity(
          opacity: a1.value,
          child: widget,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 100),
    constraints:
        const BoxConstraints(minHeight: 460, minWidth: 300, maxWidth: 320),
  );
}

// Define custom colors. The 'guide' color values are from
// https://material.io/design/color/the-color-system.html#color-theme-creation
const Color guidePrimary = Color(0xFF6200EE);
const Color guidePrimaryVariant = Color(0xFF3700B3);
const Color guideSecondary = Color(0xFF03DAC6);
const Color guideSecondaryVariant = Color(0xFF018786);
const Color guideError = Color(0xFFB00020);
const Color guideErrorDark = Color(0xFFCF6679);
const Color blueBlues = Color(0xFF174378);

// Make a custom ColorSwatch to name map from the above custom colors.
final Map<ColorSwatch<Object>, String> colorsNameMap =
    <ColorSwatch<Object>, String>{
  ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
  ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
  ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
  ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
  ColorTools.createPrimarySwatch(guideError): 'Guide Error',
  ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
  ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
};
