// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:hijri/hijri_calendar.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:ramazan_app_new_v1/models/get_prayer_times_by_city.dart';

// // // class HomeScreen extends StatefulWidget {
// // //   const HomeScreen({Key? key}) : super(key: key);

// // //   @override
// // //   State<HomeScreen> createState() => _HomeScreenState();
// // // }

// // // class _HomeScreenState extends State<HomeScreen> {
// // //   PrayerTimeApiByCity? prayerTimeApiByCity;
// // //   @override
// // //   void initState() {
// // //     WidgetsBinding.instance!.addPostFrameCallback((_) async {
// // //       final map = await _showMyDialog(context);
// // //       callApiMethods(map!);
// // //     });

// // //     super.initState();
// // //   }

// // //   Future<void> callApiMethods(Map<String, dynamic> mapData) async {
// // //     // final mapData = await _showMyDialog(context);
// // //     // print('mapData: ' + mapData.toString());
// // //     prayerTimeApiByCity = await fetchDataPrayerTimesByCityAndCountry(
// // //         city: mapData!['city'], countryName: mapData!['country']);

// // //     print('=========================================');
// // //     print(prayerTimeApiByCity!.data.toList().toString());

// // //     // final dateTime = DateTime.now();
// // //     // // Extract time components
// // //     // int hour = dateTime.hour;
// // //     // int minute = dateTime.minute;
// // //     // int second = dateTime.second;
// // //     // int millisecond = dateTime.millisecond;

// // //     // // Format time as a string
// // //     // String currentTime = DateFormat.Hms().format(dateTime);

// // //     // final nextNamazTime = getNextPrayerTime(
// // //     //   [
// // //     //     prayerTimeApiByCity!.data[dateTime.day].timings.Fajr,
// // //     //     prayerTimeApiByCity!.data[dateTime.day].timings.Asr,
// // //     //     prayerTimeApiByCity!.data[dateTime.day].timings.Dhuhr,
// // //     //     prayerTimeApiByCity!.data[dateTime.day].timings.Maghrib,
// // //     //     prayerTimeApiByCity!.data[dateTime.day].timings.Isha,
// // //     //   ],
// // //     //   DateTime.now(),
// // //     // );
// // //     // print(nextNamazTime);
// // //     setState(() {});
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: () async {
// // //           await _showMyDialog(context);
// // //         },
// // //         child: const Icon(Icons.add),
// // //       ),
// // //       appBar: AppBar(
// // //         title: const Text('Ramadan Kareem'),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(0.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               //    for (int i = 0; i < prayerTimeApiByCity!.data.length; i++) ...{
// // //               //      Text(prayerTimeApiByCity!.data[i].date.readable),
// // //               //      Text(prayerTimeApiByCity!.data[i].timings.Fajr),
// // //               //      Text(i.toString()),
// // //               //    },
// // //               Container(
// // //                 width: Get.width,
// // //                 height: 200,
// // //                 color: Colors.black,
// // //                 child: Padding(
// // //                   padding: const EdgeInsets.all(11.0),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       const Text(
// // //                         'Zabi',
// // //                         style: TextStyle(
// // //                           color: Colors.white,
// // //                           fontWeight: FontWeight.bold,
// // //                           fontSize: 19,
// // //                         ),
// // //                       ),
// // //                       const Row(
// // //                         children: [
// // //                           Icon(
// // //                             Icons.location_on_outlined,
// // //                             color: Colors.grey,
// // //                           ),
// // //                           Text(
// // //                             'Lahore',
// // //                             style: TextStyle(
// // //                               color: Colors.grey,
// // //                               fontWeight: FontWeight.bold,
// // //                               fontSize: 13,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                       // Text(
// // //                       //   'Next Paryer',
// // //                       //   style: TextStyle(
// // //                       //     color: Colors.white,
// // //                       //     fontWeight: FontWeight.bold,
// // //                       //     fontSize: 15,
// // //                       //   ),
// // //                       // ),
// // //                       Row(
// // //                         children: [
// // //                           const Icon(
// // //                             Icons.calendar_month,
// // //                             color: Colors.grey,
// // //                           ),
// // //                           const SizedBox(width: 4),
// // //                           Column(
// // //                             crossAxisAlignment: CrossAxisAlignment.start,
// // //                             children: [
// // //                               Text(
// // //                                 DateFormat('E, MMM d, y').format(
// // //                                   DateTime.now(),
// // //                                 ),
// // //                                 style: const TextStyle(color: Colors.grey),
// // //                               ),
// // //                               Container(
// // //                                 width: 100,
// // //                                 child: const Divider(
// // //                                   height:
// // //                                       1, // Increase the height of the Divider
// // //                                   color: Colors.grey,
// // //                                 ),
// // //                               ),
// // //                               Text(
// // //                                 HijriCalendar.fromDate(DateTime.now())
// // //                                     .toFormat('dd MMMM yyyy'),
// // //                                 style: const TextStyle(
// // //                                   color: Colors.grey,
// // //                                 ),
// // //                               )
// // //                             ],
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 15),
// // //               Padding(
// // //                 padding: const EdgeInsets.all(13.0),
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     const Text(
// // //                       'Today\'s Prayer Times in city',
// // //                       style: TextStyle(
// // //                         fontWeight: FontWeight.bold,
// // //                         fontSize: 17,
// // //                         color: Colors.amber,
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 11),
// // //                     Row(
// // //                       children: [
// // //                         PrayerTimeCard('Fajar', prayerTimeApiByCity!),
// // //                         PrayerTimeCard('Sunrise', prayerTimeApiByCity!),
// // //                       ],
// // //                     ),
// // //                     Row(
// // //                       children: [
// // //                         PrayerTimeCard('Dhuhar', prayerTimeApiByCity!),
// // //                         PrayerTimeCard('Asar', prayerTimeApiByCity!),
// // //                       ],
// // //                     ),
// // //                     Row(
// // //                       children: [
// // //                         PrayerTimeCard('Maghrib', prayerTimeApiByCity!),
// // //                         PrayerTimeCard('Sunset', prayerTimeApiByCity!),
// // //                       ],
// // //                     ),
// // //                     PrayerTimeCard('Isha', prayerTimeApiByCity!),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget PrayerTimeCard(
// // //       String prayerName, PrayerTimeApiByCity prayerTimeApiByCity) {
// // //     final date = DateTime.now();
// // //     print('day in date:' + date.day.toString());

// // //     return Container(
// // //       width: 150,
// // //       child: Card(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(11.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(
// // //                 prayerName,
// // //                 style: const TextStyle(
// // //                   color: Colors.amber,
// // //                   fontWeight: FontWeight.bold,
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 3),
// // //               if (prayerName == 'Fajar') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Fajr,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               } else if (prayerName == 'Sunrise') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Sunrise,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               } else if (prayerName == 'Dhuhar') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Dhuhr,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               } else if (prayerName == 'Asar') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Asr,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               } else if (prayerName == 'Maghrib') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Maghrib,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               } else if (prayerName == 'Sunset') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Sunset,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               } else if (prayerName == 'Isha') ...{
// // //                 Text(
// // //                   prayerTimeApiByCity.data[date.day].timings.Isha,
// // //                   style: const TextStyle(color: Colors.white),
// // //                 )
// // //               }
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Future<Map<String, dynamic>?> _showMyDialog(BuildContext context) async {
// // //     TextEditingController textController1 = TextEditingController();
// // //     TextEditingController textController2 = TextEditingController();
// // //     final formKey = GlobalKey<FormState>();

// // //     return showDialog<Map<String, dynamic>?>(
// // //       context: context,
// // //       barrierDismissible: false,
// // //       builder: (BuildContext context) {
// // //         return AlertDialog(
// // //           title: const Text('Enter Your Information'),
// // //           content: SingleChildScrollView(
// // //             child: Form(
// // //               key: formKey,
// // //               child: Column(
// // //                 children: <Widget>[
// // //                   TextFormField(
// // //                     validator: (value) {
// // //                       if (value!.trim().isEmpty) {
// // //                         return 'Enter your country!';
// // //                       }
// // //                       return null;
// // //                     },
// // //                     controller: textController1,
// // //                     decoration: const InputDecoration(labelText: 'Country'),
// // //                   ),
// // //                   TextFormField(
// // //                     validator: (value) {
// // //                       if (value!.trim().isEmpty) {
// // //                         return 'Enter your city!';
// // //                       }
// // //                       return null;
// // //                     },
// // //                     controller: textController2,
// // //                     decoration: const InputDecoration(labelText: 'City'),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           actions: <Widget>[
// // //             TextButton(
// // //               child: const Text('Cancel'),
// // //               onPressed: () {
// // //                 Navigator.of(context).pop();
// // //               },
// // //             ),
// // //             ElevatedButton(
// // //               child: const Text('Submit'),
// // //               onPressed: () {
// // //                 if (!formKey.currentState!.validate()) {
// // //                   return;
// // //                 }

// // //                 // Process data here

// // //                 print('Text 1: ${textController1.text}');
// // //                 print('Text 2: ${textController2.text}');

// // //                 Navigator.of(context).pop({
// // //                   'city': textController2.text.trim(),
// // //                   'country': textController1.text.trim()
// // //                 });
// // //               },
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }

// // //   String getNextPrayerTime(List<String> prayerTimes, DateTime currentTime) {
// // //     // Convert current time to minutes
// // //     int currentMinutes = currentTime.hour * 60 + currentTime.minute;

// // //     // Iterate over prayer times
// // //     for (String time in prayerTimes) {
// // //       // Split time into hours and minutes
// // //       List<String> parts = time.split(':');
// // //       int hour = int.parse(parts[0]);
// // //       int minute = int.parse(parts[1]);

// // //       // Convert prayer time to minutes
// // //       int prayerTime = hour * 60 + minute;

// // //       // Check if the prayer time is in the future
// // //       if (prayerTime > currentMinutes) {
// // //         return time;
// // //       }
// // //     }

// // //     // If no future prayer time found, return the first prayer time of the next day
// // //     return prayerTimes[0];
// // //   }
// // // }

// // ////////////////////////////////////////////////////////////////////////////////////////
// // ///
// // ///
// // ///
// // ///
// // ///import 'package:flutter/material.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:hijri/hijri_calendar.dart';
// // import 'package:intl/intl.dart';
// // import 'package:ramazan_app_new_v1/models/get_prayer_times_by_city.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({Key? key}) : super(key: key);

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   PrayerTimeApiByCity? prayerTimeApiByCity;
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance!.addPostFrameCallback((_) async {
// //       final map = await _showMyDialog(context);
// //       if (map != null) {
// //         callApiMethods(map);
// //       }
// //     });
// //   }

// //   Future<void> callApiMethods(Map<String, dynamic> mapData) async {
// //     setState(() {
// //       isLoading = true;
// //     });
// //     prayerTimeApiByCity = await fetchDataPrayerTimesByCityAndCountry(
// //         city: mapData['city'], countryName: mapData['country']);

// //     setState(() {
// //       isLoading = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () async {
// //           final map = await _showMyDialog(context);
// //           if (map != null) {
// //             callApiMethods(map);
// //           }
// //         },
// //         child: const Icon(Icons.add),
// //       ),
// //       appBar: AppBar(
// //         title: const Text('Ramadan Kareem'),
// //       ),
// //       body: isLoading
// //           ? Center(child: CircularProgressIndicator()) // Show loader
// //           : SingleChildScrollView(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(0.0),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Container(
// //                       width: Get.width,
// //                       height: 200,
// //                       color: Colors.black,
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(11.0),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             const Text(
// //                               'Zabi',
// //                               style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 19,
// //                               ),
// //                             ),
// //                             const Row(
// //                               children: [
// //                                 Icon(
// //                                   Icons.location_on_outlined,
// //                                   color: Colors.grey,
// //                                 ),
// //                                 Text(
// //                                   'Lahore',
// //                                   style: TextStyle(
// //                                     color: Colors.grey,
// //                                     fontWeight: FontWeight.bold,
// //                                     fontSize: 13,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                             Row(
// //                               children: [
// //                                 const Icon(
// //                                   Icons.calendar_month,
// //                                   color: Colors.grey,
// //                                 ),
// //                                 const SizedBox(width: 4),
// //                                 Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     Text(
// //                                       DateFormat('E, MMM d, y').format(
// //                                         DateTime.now(),
// //                                       ),
// //                                       style:
// //                                           const TextStyle(color: Colors.grey),
// //                                     ),
// //                                     Container(
// //                                       width: 100,
// //                                       child: const Divider(
// //                                         height: 1,
// //                                         color: Colors.grey,
// //                                       ),
// //                                     ),
// //                                     Text(
// //                                       HijriCalendar.fromDate(DateTime.now())
// //                                           .toFormat('dd MMMM yyyy'),
// //                                       style: const TextStyle(
// //                                         color: Colors.grey,
// //                                       ),
// //                                     )
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 15),
// //                     Padding(
// //                       padding: const EdgeInsets.all(13.0),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           const Text(
// //                             'Today\'s Prayer Times in city',
// //                             style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 17,
// //                               color: Colors.amber,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 11),
// //                           Row(
// //                             children: [
// //                               PrayerTimeCard('Fajar', prayerTimeApiByCity!),
// //                               PrayerTimeCard('Sunrise', prayerTimeApiByCity!),
// //                             ],
// //                           ),
// //                           Row(
// //                             children: [
// //                               PrayerTimeCard('Dhuhar', prayerTimeApiByCity!),
// //                               PrayerTimeCard('Asar', prayerTimeApiByCity!),
// //                             ],
// //                           ),
// //                           Row(
// //                             children: [
// //                               PrayerTimeCard('Maghrib', prayerTimeApiByCity!),
// //                               PrayerTimeCard('Sunset', prayerTimeApiByCity!),
// //                             ],
// //                           ),
// //                           PrayerTimeCard('Isha', prayerTimeApiByCity!),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //     );
// //   }

// //   Widget PrayerTimeCard(
// //       String prayerName, PrayerTimeApiByCity prayerTimeApiByCity) {
// //     final date = DateTime.now();
// //     print('day in date:' + date.day.toString());

// //     return Container(
// //       width: 150,
// //       child: Card(
// //         child: Padding(
// //           padding: const EdgeInsets.all(11.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 prayerName,
// //                 style: const TextStyle(
// //                   color: Colors.amber,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //               const SizedBox(height: 3),
// //               if (prayerName == 'Fajar') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Fajr,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               } else if (prayerName == 'Sunrise') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Sunrise,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               } else if (prayerName == 'Dhuhar') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Dhuhr,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               } else if (prayerName == 'Asar') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Asr,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               } else if (prayerName == 'Maghrib') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Maghrib,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               } else if (prayerName == 'Sunset') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Sunset,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               } else if (prayerName == 'Isha') ...{
// //                 Text(
// //                   prayerTimeApiByCity.data[date.day].timings.Isha,
// //                   style: const TextStyle(color: Colors.white),
// //                 )
// //               }
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<Map<String, dynamic>?> _showMyDialog(BuildContext context) async {
// //     TextEditingController textController1 = TextEditingController();
// //     TextEditingController textController2 = TextEditingController();
// //     final formKey = GlobalKey<FormState>();

// //     return showDialog<Map<String, dynamic>?>(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: const Text('Enter Your Information'),
// //           content: SingleChildScrollView(
// //             child: Form(
// //               key: formKey,
// //               child: Column(
// //                 children: <Widget>[
// //                   TextFormField(
// //                     validator: (value) {
// //                       if (value!.trim().isEmpty) {
// //                         return 'Enter your country!';
// //                       }
// //                       return null;
// //                     },
// //                     controller: textController1,
// //                     decoration: const InputDecoration(labelText: 'Country'),
// //                   ),
// //                   TextFormField(
// //                     validator: (value) {
// //                       if (value!.trim().isEmpty) {
// //                         return 'Enter your city!';
// //                       }
// //                       return null;
// //                     },
// //                     controller: textController2,
// //                     decoration: const InputDecoration(labelText: 'City'),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           actions: <Widget>[
// //             // TextButton(
// //             //   child: const Text('Cancel'),
// //             //   onPressed: () {
// //             //     Navigator.of(context).pop();
// //             //   },
// //             // ),
// //             ElevatedButton(
// //               child: const Text('Submit'),
// //               onPressed: () {
// //                 if (!formKey.currentState!.validate()) {
// //                   return;
// //                 }

// //                 // Process data here

// //                 print('Text 1: ${textController1.text}');
// //                 print('Text 2: ${textController2.text}');

// //                 Navigator.of(context).pop({
// //                   'city': textController2.text.trim(),
// //                   'country': textController1.text.trim()
// //                 });
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }

// //////////////////////////////////////////////////////////////////////////////////////
// ///
// ///
// import 'package:flutter/material.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ramazan_app_new_v1/models/get_prayer_times_by_city.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   PrayerTimeApiByCity? prayerTimeApiByCity;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final savedCity = prefs.getString('city');
//     final savedCountry = prefs.getString('country');

//     if (savedCity != null && savedCountry != null) {
//       await callApiMethods({'city': savedCity, 'country': savedCountry});
//     } else {
//       final map = await _showMyDialog(context);
//       if (map != null) {
//         callApiMethods(map);
//       }
//     }
//   }

//   Future<void> callApiMethods(Map<String, dynamic> mapData) async {
//     setState(() {
//       isLoading = true;
//     });
//     prayerTimeApiByCity = await fetchDataPrayerTimesByCityAndCountry(
//         city: mapData['city'], countryName: mapData['country']);
//     setState(() {
//       isLoading = false;
//     });

//     // Save data to SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('city', mapData['city']);
//     prefs.setString('country', mapData['country']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ramadan Kareem'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 200,
//                     color: Colors.black,
//                     child: Padding(
//                       padding: const EdgeInsets.all(11.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text(
//                             'Zabi',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 19,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           const Row(
//                             children: [
//                               Icon(
//                                 Icons.location_on_outlined,
//                                 color: Colors.grey,
//                               ),
//                               Text(
//                                 'Lahore',
//                                 style: TextStyle(
//                                   color: Colors.grey,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 13,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
//                               const Icon(
//                                 Icons.calendar_today,
//                                 color: Colors.grey,
//                               ),
//                               const SizedBox(width: 5),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     DateFormat('E, MMM d, y').format(
//                                       DateTime.now(),
//                                     ),
//                                     style: const TextStyle(color: Colors.grey),
//                                   ),
//                                   Container(
//                                     width: 100,
//                                     child: const Divider(
//                                       height: 1,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                   Text(
//                                     HijriCalendar.fromDate(DateTime.now())
//                                         .toFormat('dd MMMM yyyy'),
//                                     style: const TextStyle(
//                                       color: Colors.grey,
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.all(13.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'Today\'s Prayer Times in city',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 17,
//                             color: Colors.amber,
//                           ),
//                         ),
//                         const SizedBox(height: 11),
//                         Row(
//                           children: [
//                             PrayerTimeCard('Fajr', prayerTimeApiByCity!),
//                             PrayerTimeCard('Sunrise', prayerTimeApiByCity!),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             PrayerTimeCard('Dhuhr', prayerTimeApiByCity!),
//                             PrayerTimeCard('Asr', prayerTimeApiByCity!),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             PrayerTimeCard('Maghrib', prayerTimeApiByCity!),
//                             PrayerTimeCard('Sunset', prayerTimeApiByCity!),
//                           ],
//                         ),
//                         PrayerTimeCard('Isha', prayerTimeApiByCity!),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   Widget PrayerTimeCard(
//       String prayerName, PrayerTimeApiByCity prayerTimeApiByCity) {
//     final date = DateTime.now();

//     return Container(
//       width: 150,
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(11.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 prayerName,
//                 style: const TextStyle(
//                   color: Colors.amber,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 3),
//               Text(
//                 prayerName == 'Fajr'
//                     ? prayerTimeApiByCity.data[date.day].timings.Fajr
//                     : prayerName == 'Sunrise'
//                         ? prayerTimeApiByCity.data[date.day].timings.Sunrise
//                         : prayerName == 'Dhuhr'
//                             ? prayerTimeApiByCity.data[date.day].timings.Dhuhr
//                             : prayerName == 'Asr'
//                                 ? prayerTimeApiByCity.data[date.day].timings.Asr
//                                 : prayerName == 'Maghrib'
//                                     ? prayerTimeApiByCity
//                                         .data[date.day].timings.Maghrib
//                                     : prayerName == 'Sunset'
//                                         ? prayerTimeApiByCity
//                                             .data[date.day].timings.Sunset
//                                         : prayerTimeApiByCity
//                                             .data[date.day].timings.Isha,
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<Map<String, dynamic>?> _showMyDialog(BuildContext context) async {
//     TextEditingController textController1 = TextEditingController();
//     TextEditingController textController2 = TextEditingController();
//     final formKey = GlobalKey<FormState>();

//     return showDialog<Map<String, dynamic>?>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Enter Your Information'),
//           content: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: <Widget>[
//                   TextFormField(
//                     validator: (value) {
//                       if (value!.trim().isEmpty) {
//                         return 'Enter your country!';
//                       }
//                       return null;
//                     },
//                     controller: textController1,
//                     decoration: const InputDecoration(labelText: 'Country'),
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value!.trim().isEmpty) {
//                         return 'Enter your city!';
//                       }
//                       return null;
//                     },
//                     controller: textController2,
//                     decoration: const InputDecoration(labelText: 'City'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             ElevatedButton(
//               child: const Text('Submit'),
//               onPressed: () {
//                 if (!formKey.currentState!.validate()) {
//                   return;
//                 }

//                 // Process data here

//                 print('Text 1: ${textController1.text}');
//                 print('Text 2: ${textController2.text}');

//                 Navigator.of(context).pop({
//                   'city': textController2.text.trim(),
//                   'country': textController1.text.trim()
//                 });
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ramazan_app_new_v1/models/get_prayer_times_by_city.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PrayerTimeApiByCity? prayerTimeApiByCity;
  bool isLoading = true;
  String? cityName;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedCity = prefs.getString('city');
    final savedCountry = prefs.getString('country');

    if (savedCity != null && savedCountry != null) {
      await callApiMethods({'city': savedCity, 'country': savedCountry});
    } else {
      final map = await _showMyDialog(context);
      if (map != null) {
        callApiMethods(map);
      }
    }
  }

  Future<void> callApiMethods(Map<String, dynamic> mapData) async {
    setState(() {
      isLoading = true;
    });
    prayerTimeApiByCity = await fetchDataPrayerTimesByCityAndCountry(
        city: mapData['city'], countryName: mapData['country']);
    setState(() {
      isLoading = false;
      cityName = mapData['city'];
    });

    // Save data to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', mapData['city']);
    prefs.setString('country', mapData['country']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Ramadan Kareem - ${cityName ?? ''}'),
      //  ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //       width: MediaQuery.of(context).size.width,
                  //       height: 220,
                  //       child: Image.asset(
                  //         'assets/images/bg_2.jpeg',
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/bg_1.jpg', // Replace 'assets/your_image.png' with your image path
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        color: Colors.black.withOpacity(
                            0.5), // Adding opacity to the container color
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              const Text(
                                'Islamic App',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                              const SizedBox(height: 10),
                              if (cityName != null) ...{
                                InkWell(
                                  onTap: () async {
                                    final mapData =
                                        await _showMyDialog(context);
                                    if (mapData != null) {
                                      callApiMethods(mapData);
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        width: 11,
                                      ),
                                      Text(
                                        cityName!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              },
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 11),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat('E, MMM d, y').format(
                                          DateTime.now(),
                                        ),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Container(
                                        width: 130,
                                        child: const Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        HijriCalendar.fromDate(DateTime.now())
                                            .toFormat('dd MMMM yyyy'),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Today\'s Prayer Times',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const SizedBox(height: 11),
                        Row(
                          children: [
                            PrayerTimeCard('Fajr', prayerTimeApiByCity!),
                            PrayerTimeCard('Sunrise', prayerTimeApiByCity!),
                          ],
                        ),
                        Row(
                          children: [
                            PrayerTimeCard('Dhuhr', prayerTimeApiByCity!),
                            PrayerTimeCard('Asr', prayerTimeApiByCity!),
                          ],
                        ),
                        Row(
                          children: [
                            PrayerTimeCard('Maghrib', prayerTimeApiByCity!),
                            PrayerTimeCard('Sunset', prayerTimeApiByCity!),
                          ],
                        ),
                        PrayerTimeCard('Isha', prayerTimeApiByCity!),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget PrayerTimeCard(
      String prayerName, PrayerTimeApiByCity prayerTimeApiByCity) {
    final date = DateTime.now();

    return Container(
      width: 150,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prayerName,
                style: const TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                prayerName == 'Fajr'
                    ? prayerTimeApiByCity.data[date.day].timings.Fajr
                    : prayerName == 'Sunrise'
                        ? prayerTimeApiByCity.data[date.day].timings.Sunrise
                        : prayerName == 'Dhuhr'
                            ? prayerTimeApiByCity.data[date.day].timings.Dhuhr
                            : prayerName == 'Asr'
                                ? prayerTimeApiByCity.data[date.day].timings.Asr
                                : prayerName == 'Maghrib'
                                    ? prayerTimeApiByCity
                                        .data[date.day].timings.Maghrib
                                    : prayerName == 'Sunset'
                                        ? prayerTimeApiByCity
                                            .data[date.day].timings.Sunset
                                        : prayerTimeApiByCity
                                            .data[date.day].timings.Isha,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>?> _showMyDialog(BuildContext context) async {
    TextEditingController textController1 = TextEditingController();
    TextEditingController textController2 = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return showDialog<Map<String, dynamic>?>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Your Information'),
          content: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter your country!';
                      }
                      return null;
                    },
                    controller: textController1,
                    decoration: const InputDecoration(labelText: 'Country'),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter your city!';
                      }
                      return null;
                    },
                    controller: textController2,
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // TextButton(
            //   child: const Text('Cancel'),
            //   onPressed: () {
            //     Navigator.of(context).pop();
            //   },
            // ),
            ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                // Process data here

                print('Text 1: ${textController1.text}');
                print('Text 2: ${textController2.text}');

                Navigator.of(context).pop({
                  'city': textController2.text.trim(),
                  'country': textController1.text.trim()
                });
              },
            ),
          ],
        );
      },
    );
  }
}
