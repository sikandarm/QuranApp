import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/models/duaAzkarModel.dart';
import 'package:ramazan_app_new_v1/models/duaAzkarModelEvening.dart';

class EveningAzkarScreen extends StatefulWidget {
  const EveningAzkarScreen({super.key});

  @override
  State<EveningAzkarScreen> createState() => _MorningAzkarScreenState();
}

class _MorningAzkarScreenState extends State<EveningAzkarScreen> {
  late AzkarModelEvening? azkarDuaModel;

  Future<void> callApiMethods() async {
    azkarDuaModel = await fetchAzkarDataEvening();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    callApiMethods();
  }

  // @override
  // void didChangeDependencies() {
  //   callApiMethods();
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evening Azkar'),
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
              children: [
                for (int i = 0; i < azkarDuaModel!.content!.length; i++) ...{
                  Card(
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
                            azkarDuaModel!.content![i].zekr!,
                            textAlign: TextAlign.end,
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
                            azkarDuaModel!.content![i].translation!,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                }
              ],
            ),
          ),
        ],
      ),
    );
  }
}
