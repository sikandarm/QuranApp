import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
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

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('city', mapData['city']);
    prefs.setString('country', mapData['country']);
  }

  final cardColor = Color.fromARGB(110, 216, 200, 189);
  final cardBorderColor = const Color(0xffffae2138);

  double cardElevation = 0.5;
  double cardBorderWidth = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/prayers_time_top_image_light.png',
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 270,
                        color: Colors.black.withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(21.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 50),
                              const Text(
                                'Quran App',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21,
                                ),
                              ),
                              const SizedBox(height: 21),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                              const SizedBox(height: 21),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 11),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  Expanded(
                    //   width: Get.width,
                    child: Stack(
                      children: [
                        Container(
                          width: Get.width,
                          child: Image.asset(
                            'assets/images/peach_bg_motorolla_new.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 21),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/prayer_mat_icon.png',
                                    width: 40,
                                    height: 40,
                                    color: Color(0xffffae2138),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Today\'s Prayer Times',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19,
                                      color: Color(0xffffae2138),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 19),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrayerTimeCard(
                                    'assets/icons/fajar_prayer_icon.png',
                                    'Fajr',
                                    prayerTimeApiByCity!),
                                PrayerTimeCard('assets/icons/sunrise.png',
                                    'Sunrise', prayerTimeApiByCity!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrayerTimeCard(
                                    'assets/icons/dhuhar_prayer_icon.png',
                                    'Dhuhr',
                                    prayerTimeApiByCity!),
                                PrayerTimeCard(
                                    'assets/icons/asar_prayer_icon2.png',
                                    'Asr',
                                    prayerTimeApiByCity!),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PrayerTimeCard(
                                    'assets/icons/maghrib_prayer_icon.png',
                                    'Maghrib',
                                    prayerTimeApiByCity!),
                                PrayerTimeCard(
                                    'assets/icons/isha_prayer_icon.png',
                                    'Isha',
                                    prayerTimeApiByCity!),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget PrayerTimeCard(String iconPath, String prayerName,
      PrayerTimeApiByCity prayerTimeApiByCity) {
    final date = DateTime.now();

    return Container(
      width: 160,
      height: 100,
      child: Card(
        elevation: 0,
        color: cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              8,
            ),
            side: const BorderSide(
              width: 1.3,
              color: Color(0xffffae2138),
            )),
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath,
                    width: 30,
                    height: 30,
                    color: Color(0xffffae2138),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    prayerName,
                    style: const TextStyle(
                      color: Color(0xffffae2138),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Center(
                child: Text(
                  prayerName == 'Fajr'
                      ? prayerTimeApiByCity.data[date.day].timings.Fajr
                      : prayerName == 'Sunrise'
                          ? prayerTimeApiByCity.data[date.day].timings.Sunrise
                          : prayerName == 'Dhuhr'
                              ? prayerTimeApiByCity.data[date.day].timings.Dhuhr
                              : prayerName == 'Asr'
                                  ? prayerTimeApiByCity
                                      .data[date.day].timings.Asr
                                  : prayerName == 'Maghrib'
                                      ? prayerTimeApiByCity
                                          .data[date.day].timings.Maghrib
                                      : prayerName == 'Sunset'
                                          ? prayerTimeApiByCity
                                              .data[date.day].timings.Sunset
                                          : prayerTimeApiByCity
                                              .data[date.day].timings.Isha,
                  style: const TextStyle(
                    color: Color(0xffffae2138),
                    fontSize: 16,
                  ),
                ),
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
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 216, 200, 189),
          title: const Text(
            'Enter Your Information',
            style: TextStyle(
              color: Color(0xffffae2138),
            ),
          ),
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
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffffae2138),
                        ), // Change bottom border color here
                      ),
                      labelText: 'Country',
                      labelStyle: TextStyle(
                        color: Color(0xffffae2138),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.trim().isEmpty) {
                        return 'Enter your city!';
                      }
                      return null;
                    },
                    controller: textController2,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffffae2138),
                        ), // Change bottom border color here
                      ),
                      labelText: 'City',
                      labelStyle: TextStyle(
                        color: Color(0xffffae2138),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xffffae2138),
                  )),
              child: const Text('Submit'),
              onPressed: () {
                if (!formKey.currentState!.validate()) {
                  return;
                }

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
