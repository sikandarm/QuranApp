// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:get/get.dart';
// // // // // // import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
// // // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // // class TasbeehCounterSection extends StatefulWidget {
// // // // // //   @override
// // // // // //   _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
// // // // // // }

// // // // // // class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
// // // // // //   int _counter = 0;

// // // // // //   @override
// // // // // //   void initState() {
// // // // // //     super.initState();
// // // // // //     _loadCounter();
// // // // // //   }

// // // // // //   void _loadCounter() async {
// // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // //     setState(() {
// // // // // //       _counter = prefs.getInt('counter') ?? 0;
// // // // // //     });
// // // // // //   }

// // // // // //   void _incrementCounter() async {
// // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // //     setState(() {
// // // // // //       _counter++;
// // // // // //       prefs.setInt('counter', _counter);
// // // // // //     });
// // // // // //   }

// // // // // //   void _resetCounter() async {
// // // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // // //     setState(() {
// // // // // //       _counter = 0;
// // // // // //       prefs.setInt('counter', _counter);
// // // // // //     });
// // // // // //   }

// // // // // //   List<String> arabicZikr = [
// // // // // //     'سُبْحَانَ اللهِ',
// // // // // //     'الْحَمْدُ لِلَّهِ',
// // // // // //     'اللَّهُ أَكْبَرُ',
// // // // // //     'لَا إِلَهَ إِلَّا اللهُ',
// // // // // //     'أَسْتَغْفِرُ اللهَ',
// // // // // //     'دُرُودٌ شَرِيفٌ'
// // // // // //   ];

// // // // // //   List<String> englishZikr = [
// // // // // //     'Subhan Allah',
// // // // // //     'Alhandullilah',
// // // // // //     'Allahu Akbar',
// // // // // //     'La ilaha illalah',
// // // // // //     'Astaghfirullah',
// // // // // //     'Darood Sharif'
// // // // // //   ];

// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     final englishStyle =
// // // // // //         TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
// // // // // //     final arabicStyle = TextStyle(
// // // // // //         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: const Text('Tasbeeh'),
// // // // // //       ),
// // // // // //       body: Center(
// // // // // //         child: Column(
// // // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // // //           children: <Widget>[
// // // // // //             SizedBox(height: 11),
// // // // // //             Expanded(
// // // // // //               child: ListView.builder(
// // // // // //                 itemCount: arabicZikr.length,
// // // // // //                 itemBuilder: (context, index) {
// // // // // //                   return Container(
// // // // // //                     child: Center(
// // // // // //                       child: Card(
// // // // // //                         child: InkWell(
// // // // // //                           onTap: () {
// // // // // //                             Get.to(
// // // // // //                               TasbeehScreen(
// // // // // //                                 englishTasbeeh: englishZikr[index],
// // // // // //                                 urduTasbeeh: arabicZikr[index],
// // // // // //                               ),
// // // // // //                             );
// // // // // //                           },
// // // // // //                           child: ListTile(
// // // // // //                             leading: Chip(
// // // // // //                               //  backgroundColor: Colors.transparent,
// // // // // //                               backgroundColor: Colors.amber,
// // // // // //                               elevation: 0,
// // // // // //                               shape: RoundedRectangleBorder(
// // // // // //                                   borderRadius: BorderRadius.circular(33)),
// // // // // //                               // color: MaterialStatePropertyAll(Colors.amber),
// // // // // //                               label: Text(
// // // // // //                                 (index + 1).toString(),
// // // // // //                                 style: const TextStyle(color: Colors.black),
// // // // // //                               ),
// // // // // //                             ),
// // // // // //                             title: Row(
// // // // // //                               children: [
// // // // // //                                 Text(
// // // // // //                                   englishZikr[index],
// // // // // //                                   style: englishStyle,
// // // // // //                                 ),
// // // // // //                                 Spacer(),
// // // // // //                                 Text(
// // // // // //                                   arabicZikr[index],
// // // // // //                                   style: arabicStyle,
// // // // // //                                 ),
// // // // // //                               ],
// // // // // //                             ),
// // // // // //                           ),
// // // // // //                         ),
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   );
// // // // // //                 },
// // // // // //               ),
// // // // // //             ),
// // // // // //           ],
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // //////////////////////////////////////////////////////////////////////

// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:get/get.dart';
// // // // // import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
// // // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // // class TasbeehCounterSection extends StatefulWidget {
// // // // //   @override
// // // // //   _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
// // // // // }

// // // // // class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
// // // // //   int _counter = 0;

// // // // //   @override
// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     _loadCounter();
// // // // //   }

// // // // //   void _loadCounter() async {
// // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // //     setState(() {
// // // // //       _counter = prefs.getInt('counter') ?? 0;
// // // // //     });
// // // // //   }

// // // // //   void _incrementCounter() async {
// // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // //     setState(() {
// // // // //       _counter++;
// // // // //       prefs.setInt('counter', _counter);
// // // // //     });
// // // // //   }

// // // // //   void _resetCounter() async {
// // // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // // //     setState(() {
// // // // //       _counter = 0;
// // // // //       prefs.setInt('counter', _counter);
// // // // //     });
// // // // //   }

// // // // //   List<String> arabicZikr = [
// // // // //     'سُبْحَانَ اللهِ',
// // // // //     'الْحَمْدُ لِلَّهِ',
// // // // //     'اللَّهُ أَكْبَرُ',
// // // // //     'لَا إِلَهَ إِلَّا اللهُ',
// // // // //     'أَسْتَغْفِرُ اللهَ',
// // // // //     'دُرُودٌ شَرِيفٌ'
// // // // //   ];

// // // // //   List<String> englishZikr = [
// // // // //     'Subhan Allah',
// // // // //     'Alhamdulillah',
// // // // //     'Allahu Akbar',
// // // // //     'La ilaha illallah',
// // // // //     'Astaghfirullah',
// // // // //     'Darood Sharif'
// // // // //   ];

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final englishStyle =
// // // // //         TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
// // // // //     final arabicStyle = TextStyle(
// // // // //         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text('Tasbeeh'),
// // // // //       ),
// // // // //       body: Center(
// // // // //         child: Column(
// // // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // // //           children: <Widget>[
// // // // //             SizedBox(height: 11),
// // // // //             Expanded(
// // // // //               child: ListView.builder(
// // // // //                 itemCount: arabicZikr.length,
// // // // //                 itemBuilder: (context, index) {
// // // // //                   return Container(
// // // // //                     child: Center(
// // // // //                       child: Card(
// // // // //                         child: InkWell(
// // // // //                           onTap: () {
// // // // //                             Get.to(
// // // // //                               TasbeehScreen(
// // // // //                                 englishTasbeeh: englishZikr[index],
// // // // //                                 urduTasbeeh: arabicZikr[index],
// // // // //                               ),
// // // // //                             );
// // // // //                           },
// // // // //                           child: ListTile(
// // // // //                             leading: Chip(
// // // // //                               backgroundColor: Colors.amber,
// // // // //                               elevation: 0,
// // // // //                               shape: RoundedRectangleBorder(
// // // // //                                   borderRadius: BorderRadius.circular(33)),
// // // // //                               label: Text(
// // // // //                                 (index + 1).toString(),
// // // // //                                 style: const TextStyle(color: Colors.black),
// // // // //                               ),
// // // // //                             ),
// // // // //                             title: Row(
// // // // //                               children: [
// // // // //                                 Text(
// // // // //                                   englishZikr[index],
// // // // //                                   style: englishStyle,
// // // // //                                 ),
// // // // //                                 Spacer(),
// // // // //                                 Text(
// // // // //                                   arabicZikr[index],
// // // // //                                   style: arabicStyle,
// // // // //                                 ),
// // // // //                               ],
// // // // //                             ),
// // // // //                           ),
// // // // //                         ),
// // // // //                       ),
// // // // //                     ),
// // // // //                   );
// // // // //                 },
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //       floatingActionButton: FloatingActionButton(
// // // // //         onPressed: () {
// // // // //           showDialog(
// // // // //             context: context,
// // // // //             builder: (BuildContext context) {
// // // // //               return AlertDialog(
// // // // //                 title: Text("Enter Text"),
// // // // //                 content: Column(
// // // // //                   mainAxisSize: MainAxisSize.min,
// // // // //                   children: [
// // // // //                     TextFormField(
// // // // //                       decoration: InputDecoration(hintText: 'English'),
// // // // //                     ),
// // // // //                     SizedBox(height: 10),
// // // // //                     TextFormField(
// // // // //                       decoration: InputDecoration(hintText: 'Arabic'),
// // // // //                     ),
// // // // //                   ],
// // // // //                 ),
// // // // //                 actions: [
// // // // //                   ElevatedButton(
// // // // //                     onPressed: () async {},
// // // // //                     child: Text('Cancel'),
// // // // //                   ),
// // // // //                   ElevatedButton(
// // // // //                     onPressed: () async {},
// // // // //                     child: Text('Add'),
// // // // //                   ),
// // // // //                 ],
// // // // //               );
// // // // //             },
// // // // //           );
// // // // //         },
// // // // //         child: Icon(Icons.add),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // ///////////////////////////////////////////////////////////////////////////////

// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // // import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
// // // // import 'package:shared_preferences/shared_preferences.dart';

// // // // class TasbeehCounterSection extends StatefulWidget {
// // // //   @override
// // // //   _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
// // // // }

// // // // class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
// // // //   int _counter = 0;
// // // //   final _formKey = GlobalKey<FormState>(); // Add GlobalKey for the form

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _loadCounter();
// // // //   }

// // // //   void _loadCounter() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     setState(() {
// // // //       _counter = prefs.getInt('counter') ?? 0;
// // // //     });
// // // //   }

// // // //   void _incrementCounter() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     setState(() {
// // // //       _counter++;
// // // //       prefs.setInt('counter', _counter);
// // // //     });
// // // //   }

// // // //   void _resetCounter() async {
// // // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // // //     setState(() {
// // // //       _counter = 0;
// // // //       prefs.setInt('counter', _counter);
// // // //     });
// // // //   }

// // // //   List<String> arabicZikr = [
// // // //     'سُبْحَانَ اللهِ',
// // // //     'الْحَمْدُ لِلَّهِ',
// // // //     'اللَّهُ أَكْبَرُ',
// // // //     'لَا إِلَهَ إِلَّا اللهُ',
// // // //     'أَسْتَغْفِرُ اللهَ',
// // // //     'دُرُودٌ شَرِيفٌ'
// // // //   ];

// // // //   List<String> englishZikr = [
// // // //     'Subhan Allah',
// // // //     'Alhamdulillah',
// // // //     'Allahu Akbar',
// // // //     'La ilaha illallah',
// // // //     'Astaghfirullah',
// // // //     'Darood Sharif'
// // // //   ];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final englishStyle =
// // // //         TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
// // // //     final arabicStyle = TextStyle(
// // // //         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: const Text('Tasbeeh'),
// // // //       ),
// // // //       body: Center(
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: <Widget>[
// // // //             SizedBox(height: 11),
// // // //             Expanded(
// // // //               child: ListView.builder(
// // // //                 itemCount: arabicZikr.length,
// // // //                 itemBuilder: (context, index) {
// // // //                   return Container(
// // // //                     child: Center(
// // // //                       child: Card(
// // // //                         child: InkWell(
// // // //                           onTap: () {
// // // //                             Get.to(
// // // //                               TasbeehScreen(
// // // //                                 englishTasbeeh: englishZikr[index],
// // // //                                 urduTasbeeh: arabicZikr[index],
// // // //                               ),
// // // //                             );
// // // //                           },
// // // //                           child: ListTile(
// // // //                             leading: Chip(
// // // //                               backgroundColor: Colors.amber,
// // // //                               elevation: 0,
// // // //                               shape: RoundedRectangleBorder(
// // // //                                   borderRadius: BorderRadius.circular(33)),
// // // //                               label: Text(
// // // //                                 (index + 1).toString(),
// // // //                                 style: const TextStyle(color: Colors.black),
// // // //                               ),
// // // //                             ),
// // // //                             title: Row(
// // // //                               children: [
// // // //                                 Text(
// // // //                                   englishZikr[index],
// // // //                                   style: englishStyle,
// // // //                                 ),
// // // //                                 Spacer(),
// // // //                                 Text(
// // // //                                   arabicZikr[index],
// // // //                                   style: arabicStyle,
// // // //                                 ),
// // // //                               ],
// // // //                             ),
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   );
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //       floatingActionButton: FloatingActionButton(
// // // //         onPressed: () {
// // // //           showDialog(
// // // //             context: context,
// // // //             builder: (BuildContext context) {
// // // //               return AlertDialog(
// // // //                 title: Text("Enter Text"),
// // // //                 content: Form(
// // // //                   key: _formKey, // Assign the GlobalKey to the Form
// // // //                   child: Column(
// // // //                     mainAxisSize: MainAxisSize.min,
// // // //                     children: [
// // // //                       TextFormField(
// // // //                         decoration: InputDecoration(hintText: 'English'),
// // // //                         validator: (value) {
// // // //                           if (value!.isEmpty) {
// // // //                             return 'Please enter English text';
// // // //                           }
// // // //                           return null;
// // // //                         },
// // // //                       ),
// // // //                       SizedBox(height: 10),
// // // //                       TextFormField(
// // // //                         decoration: InputDecoration(hintText: 'Arabic'),
// // // //                         validator: (value) {
// // // //                           if (value!.isEmpty) {
// // // //                             return 'Please enter Arabic text';
// // // //                           }
// // // //                           return null;
// // // //                         },
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //                 actions: [
// // // //                   ElevatedButton(
// // // //                     onPressed: () {
// // // //                       if (_formKey.currentState!.validate()) {
// // // //                         // If the form is valid, do something
// // // //                         // For example, save the data or perform an action
// // // //                         Navigator.of(context).pop();
// // // //                       }
// // // //                     },
// // // //                     child: Text('Cancel'),
// // // //                   ),
// // // //                   ElevatedButton(
// // // //                     onPressed: () {
// // // //                       if (_formKey.currentState!.validate()) {
// // // //                         // If the form is valid, do something
// // // //                         // For example, save the data or perform an action
// // // //                         Navigator.of(context).pop();
// // // //                       }
// // // //                     },
// // // //                     child: Text('Add'),
// // // //                   ),
// // // //                 ],
// // // //               );
// // // //             },
// // // //           );
// // // //         },
// // // //         child: Icon(Icons.add),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // ////////////////////////////////////////////////////////////////////
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';

// // // class TasbeehCounterSection extends StatefulWidget {
// // //   @override
// // //   _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
// // // }

// // // class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
// // //   int _counter = 0;
// // //   final _formKey = GlobalKey<FormState>(); // Add GlobalKey for the form
// // //   TextEditingController _englishController = TextEditingController();
// // //   TextEditingController _arabicController = TextEditingController();

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadCounter();
// // //   }

// // //   void _loadCounter() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       _counter = prefs.getInt('counter') ?? 0;
// // //     });
// // //   }

// // //   void _incrementCounter() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       _counter++;
// // //       prefs.setInt('counter', _counter);
// // //     });
// // //   }

// // //   void _resetCounter() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     setState(() {
// // //       _counter = 0;
// // //       prefs.setInt('counter', _counter);
// // //     });
// // //   }

// // //   List<String> arabicZikr = [
// // //     'سُبْحَانَ اللهِ',
// // //     'الْحَمْدُ لِلَّهِ',
// // //     'اللَّهُ أَكْبَرُ',
// // //     'لَا إِلَهَ إِلَّا اللهُ',
// // //     'أَسْتَغْفِرُ اللهَ',
// // //     'دُرُودٌ شَرِيفٌ'
// // //   ];

// // //   List<String> englishZikr = [
// // //     'Subhan Allah',
// // //     'Alhamdulillah',
// // //     'Allahu Akbar',
// // //     'La ilaha illallah',
// // //     'Astaghfirullah',
// // //     'Darood Sharif'
// // //   ];

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final englishStyle =
// // //         TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
// // //     final arabicStyle = TextStyle(
// // //         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Tasbeeh'),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             SizedBox(height: 11),
// // //             Expanded(
// // //               child: ListView.builder(
// // //                 itemCount: arabicZikr.length,
// // //                 itemBuilder: (context, index) {
// // //                   return Container(
// // //                     child: Center(
// // //                       child: Card(
// // //                         child: InkWell(
// // //                           onTap: () {
// // //                             Get.to(
// // //                               TasbeehScreen(
// // //                                 englishTasbeeh: englishZikr[index],
// // //                                 urduTasbeeh: arabicZikr[index],
// // //                               ),
// // //                             );
// // //                           },
// // //                           child: ListTile(
// // //                             leading: Chip(
// // //                               backgroundColor: Colors.amber,
// // //                               elevation: 0,
// // //                               shape: RoundedRectangleBorder(
// // //                                   borderRadius: BorderRadius.circular(33)),
// // //                               label: Text(
// // //                                 (index + 1).toString(),
// // //                                 style: const TextStyle(color: Colors.black),
// // //                               ),
// // //                             ),
// // //                             title: Row(
// // //                               children: [
// // //                                 Text(
// // //                                   englishZikr[index],
// // //                                   style: englishStyle,
// // //                                 ),
// // //                                 Spacer(),
// // //                                 Text(
// // //                                   arabicZikr[index],
// // //                                   style: arabicStyle,
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () {
// // //           showDialog(
// // //             context: context,
// // //             builder: (BuildContext context) {
// // //               return AlertDialog(
// // //                 title: Text("Enter Text"),
// // //                 content: Form(
// // //                   key: _formKey, // Assign the GlobalKey to the Form
// // //                   child: Column(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     children: [
// // //                       TextFormField(
// // //                         controller: _englishController,
// // //                         decoration: InputDecoration(hintText: 'English'),
// // //                         validator: (value) {
// // //                           if (value!.isEmpty) {
// // //                             return 'Please enter English text';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                       SizedBox(height: 10),
// // //                       TextFormField(
// // //                         controller: _arabicController,
// // //                         decoration: InputDecoration(hintText: 'Arabic'),
// // //                         validator: (value) {
// // //                           if (value!.isEmpty) {
// // //                             return 'Please enter Arabic text';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //                 actions: [
// // //                   ElevatedButton(
// // //                     onPressed: () {
// // //                       Navigator.of(context).pop();
// // //                     },
// // //                     child: Text('Cancel'),
// // //                   ),
// // //                   ElevatedButton(
// // //                     onPressed: () {
// // //                       if (_formKey.currentState!.validate()) {
// // //                         // If the form is valid, save the data to SharedPreferences
// // //                         _saveData();
// // //                         Navigator.of(context).pop();
// // //                       }
// // //                     },
// // //                     child: Text('Add'),
// // //                   ),
// // //                 ],
// // //               );
// // //             },
// // //           );
// // //         },
// // //         child: Icon(Icons.add),
// // //       ),
// // //     );
// // //   }

// // //   void _saveData() async {
// // //     SharedPreferences prefs = await SharedPreferences.getInstance();
// // //     String englishText = _englishController.text;
// // //     String arabicText = _arabicController.text;
// // //     // Save data to SharedPreferences
// // //     prefs.setString('englishText', englishText);
// // //     prefs.setString('arabicText', arabicText);
// // //   }
// // // }

// // //////////////////////////////////////////////////////////

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class TasbeehCounterSection extends StatefulWidget {
// //   @override
// //   _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
// // }

// // class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
// //   int _counter = 0;
// //   final _formKey = GlobalKey<FormState>(); // Add GlobalKey for the form
// //   TextEditingController _englishController = TextEditingController();
// //   TextEditingController _arabicController = TextEditingController();
// //   List<String> arabicZikr = [
// //     'سُبْحَانَ اللهِ',
// //     'الْحَمْدُ لِلَّهِ',
// //     'اللَّهُ أَكْبَرُ',
// //     'لَا إِلَهَ إِلَّا اللهُ',
// //     'أَسْتَغْفِرُ اللهَ',
// //     'دُرُودٌ شَرِيفٌ'
// //   ];

// //   List<String> englishZikr = [
// //     'Subhan Allah',
// //     'Alhamdulillah',
// //     'Allahu Akbar',
// //     'La ilaha illallah',
// //     'Astaghfirullah',
// //     'Darood Sharif'
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadCounter();
// //     _loadSavedEntries();
// //   }

// //   void _loadCounter() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _counter = prefs.getInt('counter') ?? 0;
// //     });
// //   }

// //   void _incrementCounter() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _counter++;
// //       prefs.setInt('counter', _counter);
// //     });
// //   }

// //   void _resetCounter() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _counter = 0;
// //       prefs.setInt('counter', _counter);
// //     });
// //   }

// //   void _loadSavedEntries() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     List<String>? savedEnglishZikr = prefs.getStringList('englishZikr');
// //     List<String>? savedArabicZikr = prefs.getStringList('arabicZikr');
// //     if (savedEnglishZikr != null && savedArabicZikr != null) {
// //       setState(() {
// //         englishZikr = savedEnglishZikr;
// //         arabicZikr = savedArabicZikr;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final englishStyle =
// //         TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
// //     final arabicStyle = TextStyle(
// //         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Tasbeeh'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             SizedBox(height: 11),
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: arabicZikr.length,
// //                 itemBuilder: (context, index) {
// //                   return Container(
// //                     child: Center(
// //                       child: Card(
// //                         child: InkWell(
// //                           onTap: () {
// //                             Get.to(
// //                               TasbeehScreen(
// //                                 englishTasbeeh: englishZikr[index],
// //                                 urduTasbeeh: arabicZikr[index],
// //                               ),
// //                             );
// //                           },
// //                           child: ListTile(
// //                             leading: Chip(
// //                               backgroundColor: Colors.amber,
// //                               elevation: 0,
// //                               shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(33)),
// //                               label: Text(
// //                                 (index + 1).toString(),
// //                                 style: const TextStyle(color: Colors.black),
// //                               ),
// //                             ),
// //                             title: Row(
// //                               children: [
// //                                 Text(
// //                                   englishZikr[index],
// //                                   style: englishStyle,
// //                                 ),
// //                                 Spacer(),
// //                                 Text(
// //                                   arabicZikr[index],
// //                                   style: arabicStyle,
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           showDialog(
// //             context: context,
// //             builder: (BuildContext context) {
// //               return AlertDialog(
// //                 title: Text("Enter Text"),
// //                 content: Form(
// //                   key: _formKey, // Assign the GlobalKey to the Form
// //                   child: Column(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       TextFormField(
// //                         controller: _englishController,
// //                         decoration: InputDecoration(hintText: 'English'),
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'Please enter English text';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                       SizedBox(height: 10),
// //                       TextFormField(
// //                         controller: _arabicController,
// //                         decoration: InputDecoration(hintText: 'Arabic'),
// //                         validator: (value) {
// //                           if (value!.isEmpty) {
// //                             return 'Please enter Arabic text';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 actions: [
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       Navigator.of(context).pop();
// //                     },
// //                     child: Text('Cancel'),
// //                   ),
// //                   ElevatedButton(
// //                     onPressed: () {
// //                       if (_formKey.currentState!.validate()) {
// //                         // If the form is valid, save the data to SharedPreferences
// //                         _saveData();
// //                         Navigator.of(context).pop();
// //                       }
// //                     },
// //                     child: Text('Add'),
// //                   ),
// //                 ],
// //               );
// //             },
// //           );
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }

// //   void _saveData() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String englishText = _englishController.text;
// //     String arabicText = _arabicController.text;
// //     // Save data to SharedPreferences
// //     englishZikr.add(englishText);
// //     arabicZikr.add(arabicText);
// //     prefs.setStringList('englishZikr', englishZikr);
// //     prefs.setStringList('arabicZikr', arabicZikr);
// //   }
// // }

// /////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TasbeehCounterSection extends StatefulWidget {
  @override
  _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
}

class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>(); // Add GlobalKey for the form
  TextEditingController _englishController = TextEditingController();
  TextEditingController _arabicController = TextEditingController();
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
    final englishStyle =
        TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
    final arabicStyle = TextStyle(
        fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasbeeh'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 11),
            Expanded(
              child: ListView.builder(
                itemCount: arabicZikr.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Center(
                      child: Card(
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
                            leading: Chip(
                              backgroundColor: Colors.amber,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(33)),
                              label: Text(
                                (index + 1).toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  englishZikr[index],
                                  style: englishStyle,
                                ),
                                Spacer(),
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Enter Text"),
                content: Form(
                  key: _formKey, // Assign the GlobalKey to the Form
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _englishController,
                        decoration: InputDecoration(hintText: 'English'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter English text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _arabicController,
                        decoration: InputDecoration(hintText: 'Arabic'),
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
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, save the data to SharedPreferences
                        _saveData();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String englishText = _englishController.text;
    String arabicText = _arabicController.text;
    // Save data to SharedPreferences
    englishZikr.add(englishText);
    arabicZikr.add(arabicText);
    prefs.setStringList('englishZikr', englishZikr);
    prefs.setStringList('arabicZikr', arabicZikr);
    setState(() {});
  }
}

////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ramazan_app_new_v1/screens/tasbeeh_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class TasbeehCounterSection extends StatefulWidget {
//   @override
//   _TasbeehCounterSectionState createState() => _TasbeehCounterSectionState();
// }

// class _TasbeehCounterSectionState extends State<TasbeehCounterSection> {
//   int _counter = 0;
//   final _formKey = GlobalKey<FormState>(); // Add GlobalKey for the form
//   TextEditingController _englishController = TextEditingController();
//   TextEditingController _arabicController = TextEditingController();
//   List<String> arabicZikr = [
//     'سُبْحَانَ اللهِ',
//     'الْحَمْدُ لِلَّهِ',
//     'اللَّهُ أَكْبَرُ',
//     'لَا إِلَهَ إِلَّا اللهُ',
//     'أَسْتَغْفِرُ اللهَ',
//     'دُرُودٌ شَرِيفٌ'
//   ];
//   List<String> englishZikr = [
//     'Subhan Allah',
//     'Alhamdulillah',
//     'Allahu Akbar',
//     'La ilaha illallah',
//     'Astaghfirullah',
//     'Darood Sharif'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadCounter();
//     _loadSavedEntries();
//   }

//   void _loadCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = prefs.getInt('counter') ?? 0;
//     });
//   }

//   void _incrementCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter++;
//       prefs.setInt('counter', _counter);
//     });
//   }

//   void _resetCounter() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = 0;
//       prefs.setInt('counter', _counter);
//     });
//   }

//   void _loadSavedEntries() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? savedEnglishZikr = prefs.getStringList('englishZikr');
//     List<String>? savedArabicZikr = prefs.getStringList('arabicZikr');
//     if (savedEnglishZikr != null && savedArabicZikr != null) {
//       setState(() {
//         englishZikr.addAll(savedEnglishZikr);
//         arabicZikr.addAll(savedArabicZikr);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final englishStyle =
//         TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
//     final arabicStyle = TextStyle(
//         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tasbeeh'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             SizedBox(height: 11),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: arabicZikr.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       Get.to(TasbeehScreen(
//                           englishTasbeeh: englishZikr[index],
//                           urduTasbeeh: arabicZikr[index]));
//                     },
//                     child: Card(
//                       child: ListTile(
//                         leading: Chip(
//                           backgroundColor: Colors.amber,
//                           elevation: 0,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(33)),
//                           label: Text(
//                             (index + 1).toString(),
//                             style: const TextStyle(color: Colors.black),
//                           ),
//                         ),
//                         title: Row(
//                           children: [
//                             Text(
//                               englishZikr[index],
//                               style: englishStyle,
//                             ),
//                             Spacer(),
//                             Text(
//                               arabicZikr[index],
//                               style: arabicStyle,
//                             ),
//                           ],
//                         ),
//                         // trailing: IconButton(
//                         //   icon: Icon(Icons.delete),
//                         //   onPressed: () {
//                         //     _deleteEntry(index);
//                         //   },
//                         // ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: Text("Add your zikr"),
//                 content: Form(
//                   key: _formKey, // Assign the GlobalKey to the Form
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       TextFormField(
//                         controller: _englishController,
//                         decoration: InputDecoration(hintText: 'English'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter English text';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _arabicController,
//                         decoration: InputDecoration(hintText: 'Arabic'),
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter Arabic text';
//                           }
//                           return null;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: Text('Cancel'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // If the form is valid, save the data to SharedPreferences
//                         _saveData();
//                         Navigator.of(context).pop();
//                       }
//                     },
//                     child: Text('Add'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   void _saveData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String englishText = _englishController.text;
//     String arabicText = _arabicController.text;
//     // Save data to SharedPreferences
//     englishZikr.add(englishText);
//     arabicZikr.add(arabicText);
//     prefs.setStringList('englishZikr', englishZikr);
//     prefs.setStringList('arabicZikr', arabicZikr);
//   }

//   void _deleteEntry(int index) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       englishZikr.removeAt(index);
//       arabicZikr.removeAt(index);
//       prefs.setStringList('englishZikr', englishZikr);
//       prefs.setStringList('arabicZikr', arabicZikr);
//     });
//   }
// }




