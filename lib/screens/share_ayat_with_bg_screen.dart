import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareAyatWithBgScreen extends StatefulWidget {
  const ShareAyatWithBgScreen({super.key, required this.text});
  final String text;

  @override
  State<ShareAyatWithBgScreen> createState() => _ShareAyatWithBgScreenState();
}

class _ShareAyatWithBgScreenState extends State<ShareAyatWithBgScreen> {
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
              shareScreenshot(image!.buffer.asUint8List());

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
                  'assets/images/bg_1.jpg', // Replace 'assets/your_image.png' with your image path
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
