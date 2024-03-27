import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbeehCounterSection extends StatefulWidget {
  @override
  _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
}

class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _englishController = TextEditingController();
  final TextEditingController _arabicController = TextEditingController();
  List<String> arabicZikr = [
    'سُبْحَانَ اللهِ',
    'الْحَمْدُ لِلَّهِ',
    'اللَّهُ أَكْبَرُ',
    'لَا إِلَهَ إِلَّا اللهُ',
    'أَسْتَغْفِرُ اللهَ',
    'دُرُودٌ شَرِيفٌ'
  ];
  List<String> englishZikr = [
    'Subhan Allah',
    'Alhamdulillah',
    'Allahu Akbar',
    'La ilaha illallah',
    'Astaghfirullah',
    'Darood Sharif'
  ];

  @override
  void initState() {
    super.initState();

    _loadCounter();
    _loadSavedEntries();
    removeDuplicates();
  }

  void _loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  void _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter++;
      prefs.setInt('counter', _counter);
    });
  }

  void _resetCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = 0;
      prefs.setInt('counter', _counter);
    });
  }

  void _loadSavedEntries() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedEnglishZikr = prefs.getStringList('englishZikr');
    List<String>? savedArabicZikr = prefs.getStringList('arabicZikr');
    if (savedEnglishZikr != null && savedArabicZikr != null) {
      setState(() {
        englishZikr.addAll(savedEnglishZikr);
        arabicZikr.addAll(savedArabicZikr);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const englishStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: Color(0xffff951d31),
    );
    const arabicStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Color(0xffff951d31), fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbeeh'),
      ),
      body: Center(
        child: Stack(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 11),
                Expanded(
                  child: ListView.builder(
                    itemCount: arabicZikr.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane: ActionPane(
                            motion: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      Colors.red,
                                    ),
                                    foregroundColor: MaterialStatePropertyAll(
                                      Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    // Remove the item from SharedPreferences
                                    SharedPreferences prefs =
                                        await SharedPreferences.getInstance();
                                    englishZikr.removeAt(index);
                                    arabicZikr.removeAt(index);
                                    prefs.setStringList(
                                        'englishZikr', englishZikr);
                                    prefs.setStringList(
                                        'arabicZikr', arabicZikr);
                                    setState(() {});
                                  },
                                  child: const Text('Delete')),
                            ),
                            children: []),
                        child: Container(
                          child: Center(
                            child: Card(
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                                side: const BorderSide(
                                  width: 1.3,
                                  color: Color(0xffffae2138),
                                ),
                              ),
                              color: const Color.fromARGB(146, 255, 223, 204),
                              child: InkWell(
                                onTap: () {
                                  Get.to(
                                    TasbeehScreen(
                                      englishTasbeeh: englishZikr[index],
                                      urduTasbeeh: arabicZikr[index],
                                    ),
                                  );
                                },
                                child: ListTile(
                                  minVerticalPadding: 21,
                                  leading: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/ornament.png',
                                        color: const Color(0xffff951d31),
                                      ),
                                      Positioned(
                                        top: 19.3,
                                        left:
                                            (index + 1) > 9 && (index + 1) < 100
                                                ? 20
                                                : (index + 1) > 99
                                                    ? 16
                                                    : 24,
                                        child: Text(
                                          (index + 1).toString(),
                                          style: const TextStyle(
                                            color: Color(0xffff951d31),
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title: Row(
                                    children: [
                                      Text(
                                        englishZikr[index],
                                        style: englishStyle,
                                      ),
                                      const Spacer(),
                                      Text(
                                        arabicZikr[index],
                                        style: arabicStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(
              width: 1.5,
              color: Color(0xffff951d31),
            )),
        backgroundColor: const Color.fromARGB(254, 255, 223, 204),
        foregroundColor: const Color(0xffff951d31),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                elevation: 0,
                backgroundColor: Color.fromARGB(255, 216, 200, 189),
                title: const Text(
                  "Enter Text",
                  style: TextStyle(
                    color: Color(0xffffae2138),
                  ),
                ),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _englishController,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffffae2138),
                            ),
                          ),
                          hintText: 'English',
                          hintStyle: TextStyle(
                            color: Color(0xffffae2138),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter English text';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: _arabicController,
                        decoration: const InputDecoration(
                          hintText: 'Arabic',
                          hintStyle: TextStyle(
                            color: Color(0xffffae2138),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffffae2138),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter Arabic text';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xffffae2138)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _saveData();
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 28,
        ),
      ),
    );
  }

  void removeDuplicates() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove duplicates from English Zikr list
    Set<String> englishSet =
        englishZikr.toSet(); // Convert to set to remove duplicates
    englishZikr.clear(); // Clear the original list
    englishZikr.addAll(englishSet.toList()); // Add back non-duplicate items

    // Remove duplicates from Arabic Zikr list
    Set<String> arabicSet =
        arabicZikr.toSet(); // Convert to set to remove duplicates
    arabicZikr.clear(); // Clear the original list
    arabicZikr.addAll(arabicSet.toList()); // Add back non-duplicate items

    // Save the updated lists to SharedPreferences
    prefs.setStringList('englishZikr', englishZikr);
    prefs.setStringList('arabicZikr', arabicZikr);

    setState(() {});
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String englishText = _englishController.text;
    String arabicText = _arabicController.text;

    englishZikr.add(englishText);
    arabicZikr.add(arabicText);
    prefs.setStringList('englishZikr', englishZikr);
    prefs.setStringList('arabicZikr', arabicZikr);
    setState(() {});
  }
}
