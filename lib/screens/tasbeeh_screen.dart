import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen(
      {super.key, required this.englishTasbeeh, required this.urduTasbeeh});
  final String englishTasbeeh;
  final String urduTasbeeh;

  @override
  State<TasbeehScreen> createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _controller2;
  late Animation<double> _animation2;

  int count = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation2 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.ease,
      ),
    );

    // Fetch count from SharedPreferences
    _fetchCount();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  void _fetchCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = prefs.getInt(widget.englishTasbeeh) ?? 0;
    });
  }

  void _handleTap() {
    print(widget.urduTasbeeh);
    setState(() {
      count++;
    });
    _saveCount(count);
    _controller.reset();
    _controller.forward();
    Timer(const Duration(milliseconds: 200), () {
      _controller.reset();
    });
  }

  void _handleTap2() {
    // print(widget.urduTasbeeh);
    // setState(() {
    //   count++;
    // });
    // _saveCount(count);
    _controller2.reset();
    _controller2.forward();
    Timer(const Duration(milliseconds: 200), () {
      _controller2.reset();
    });
  }

  void _saveCount(int count) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(widget.englishTasbeeh, count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.englishTasbeeh),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: Get.width * 0.5,
                    child: Image.asset(
                      'assets/images/bismillah_png.png',
                      scale: 0.5,
                      color: Color(0xffff951d31),
                    ),
                  ),
                ),
                const Divider(
                  color: Color(0xffff951d31),
                ),
                const Text(
                  'Arabic-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.5,
                    color: Color(0xffff951d31),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.englishTasbeeh == 'Darood Sharif'
                      ? "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ، اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ، كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ، إِنَّكَ حَمِيدٌ مَجِيدٌ"
                      : widget.urduTasbeeh,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Color(0xffff951d31),
                ),
                const Text(
                  'English-',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.5,
                    color: Color(0xffff951d31),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.englishTasbeeh,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                    height: widget.englishTasbeeh == 'Darood Sharif'
                        ? 10
                        : Get.height * 0.15),
                const Divider(
                  color: Color(0xffff951d31),
                ),
                const SizedBox(height: 21),
                const Center(
                  child: Text(
                    'Count',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xffff951d31),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 50,
                    ),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Center(
                          child: IconButton(
                            color: Color(0xffff951d31),
                            icon: const Icon(FlutterIslamicIcons.tasbihHand),
                            iconSize: 45.0 * _animation.value,
                            onPressed: _handleTap,
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    AnimatedBuilder(
                      animation: _animation2,
                      builder: (context, child) {
                        return Center(
                          child: IconButton(
                            color: Color(0xffff951d31),
                            icon: const Icon(Icons.restore_sharp),
                            iconSize: 45.0 * _animation2.value,
                            onPressed: () async {
                              _handleTap2();
                              clearSharedPreferencesKey(widget.englishTasbeeh);
                              count = 0;
                              setState(() {});
                            },
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> clearSharedPreferencesKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
