import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < azkarDuaModel!.content!.length; i++) ...{
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    children: [
                      Text(
                        azkarDuaModel!.content![i].zekr!,
                        textAlign: TextAlign.end,
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
                      Text(azkarDuaModel!.content![i].translation!,
                          textAlign: TextAlign.start,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
