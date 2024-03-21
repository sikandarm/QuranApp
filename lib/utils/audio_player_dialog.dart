// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioPlayerDialog extends StatefulWidget {
//   late String playUrl;

//   AudioPlayerDialog({super.key, required this.playUrl});

//   @override
//   State<AudioPlayerDialog> createState() => _AudioPlayerDialogState();
// }

// class _AudioPlayerDialogState extends State<AudioPlayerDialog> {
//   late AudioPlayer _audioPlayer;
//   bool isLoading = false;

//   @override
//   void initState() {
//     callMethods();
//     super.initState();
//   }

//   Future<void> callMethods() async {
//     isLoading = true;
//     _audioPlayer = AudioPlayer();

//     await _audioPlayer.setUrl(
//       widget.playUrl,
//     );
//     _audioPlayer.play();
//     isLoading = false;
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: isLoading
//           ? Container(
//               width: 100,
//               height: 100,
//               child: const Center(
//                   child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 7),
//                   Text('Loading...'),
//                 ],
//               )))
//           : Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   title: const Text('Audio Player'),
//                   trailing: IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//                 StreamBuilder<Duration>(
//                   stream: _audioPlayer.positionStream,
//                   builder: (context, snapshot) {
//                     final position = snapshot.data ?? Duration.zero;
//                     return Column(
//                       children: [
//                         Slider(
//                           value: position.inSeconds.toDouble(),
//                           onChanged: (value) {
//                             _audioPlayer.seek(Duration(seconds: value.toInt()));
//                           },
//                           min: 0.0,
//                           max: _audioPlayer.duration!.inSeconds.toDouble(),
//                         ),
//                         TimeStreamWidget(
//                           currentPosition: position,
//                           totalDuration: _audioPlayer.duration!,
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.play_arrow),
//                       onPressed: () {
//                         _audioPlayer.play();
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.pause),
//                       onPressed: () {
//                         _audioPlayer.pause();
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.stop),
//                       onPressed: () {
//                         _audioPlayer.stop();
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//     );
//   }
// }

// class TimeStreamWidget extends StatelessWidget {
//   final Duration currentPosition;
//   final Duration totalDuration;

//   TimeStreamWidget(
//       {required this.currentPosition, required this.totalDuration});

//   @override
//   Widget build(BuildContext context) {
//     int currentSeconds = currentPosition.inSeconds;
//     int currentHours = currentSeconds ~/ 3600;
//     int currentMinutes = (currentSeconds % 3600) ~/ 60;
//     int displayCurrentSeconds = currentSeconds % 60;

//     String formattedCurrentTime =
//         '${currentHours.toString().padLeft(2, '0')}:${currentMinutes.toString().padLeft(2, '0')}:${displayCurrentSeconds.toString().padLeft(2, '0')}';

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Current Time: $formattedCurrentTime'),
//         DurationWidget(
//           hours: totalDuration.inHours,
//           minutes: totalDuration.inMinutes,
//           seconds: totalDuration.inSeconds,
//         ),
//       ],
//     );
//   }
// }

// class DurationWidget extends StatelessWidget {
//   final int hours;
//   final int minutes;
//   final int seconds;

//   DurationWidget(
//       {required this.hours, required this.minutes, required this.seconds});

//   @override
//   Widget build(BuildContext context) {
//     int totalSeconds = hours * 3600 + minutes * 60 + seconds;
//     int displayHours = totalSeconds ~/ 3600;
//     int displayMinutes = (totalSeconds % 3600) ~/ 60;
//     int displaySeconds = totalSeconds % 60;

//     String formattedTime =
//         '${displayHours.toString().padLeft(2, '0')}:${displayMinutes.toString().padLeft(2, '0')}:${displaySeconds.toString().padLeft(2, '0')}';

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Total Duration: $formattedTime'),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerDialog extends StatefulWidget {
  late String playUrl;

  AudioPlayerDialog({super.key, required this.playUrl});

  @override
  State<AudioPlayerDialog> createState() => _AudioPlayerDialogState();
}

class _AudioPlayerDialogState extends State<AudioPlayerDialog> {
  late AudioPlayer _audioPlayer;
  bool isLoading = false;

  @override
  void initState() {
    callMethods();
    super.initState();
  }

  Future<void> callMethods() async {
    isLoading = true;
    _audioPlayer = AudioPlayer();

    await _audioPlayer.setUrl(
      widget.playUrl,
    );
    _audioPlayer.play();
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: isLoading
          ? Container(
              width: 100,
              height: 100,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 7),
                    Text('Loading...'),
                  ],
                ),
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Audio Player'),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                StreamBuilder<Duration>(
                  stream: _audioPlayer.positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data ?? Duration.zero;
                    return Column(
                      children: [
                        Slider(
                          value: position.inSeconds.toDouble(),
                          onChanged: (value) {
                            _audioPlayer.seek(Duration(seconds: value.toInt()));
                          },
                          min: 0.0,
                          max: _audioPlayer.duration!.inSeconds.toDouble(),
                        ),
                        TimeStreamWidget(
                          currentPosition: position,
                          totalDuration: _audioPlayer.duration!,
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        _audioPlayer.play();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () {
                        _audioPlayer.pause();
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: () {
                        _audioPlayer.stop();
                      },
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class TimeStreamWidget extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;

  TimeStreamWidget(
      {required this.currentPosition, required this.totalDuration});

  @override
  Widget build(BuildContext context) {
    int currentSeconds = currentPosition.inSeconds;
    int currentHours = currentSeconds ~/ 3600;
    int currentMinutes = (currentSeconds % 3600) ~/ 60;
    int displayCurrentSeconds = currentSeconds % 60;

    String formattedCurrentTime =
        '${currentHours.toString().padLeft(2, '0')}:${currentMinutes.toString().padLeft(2, '0')}:${displayCurrentSeconds.toString().padLeft(2, '0')}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Current Time: $formattedCurrentTime'),
        DurationWidget(
          totalDuration: totalDuration,
        ),
      ],
    );
  }
}

class DurationWidget extends StatelessWidget {
  final Duration totalDuration;

  DurationWidget({required this.totalDuration});

  @override
  Widget build(BuildContext context) {
    int totalSeconds = totalDuration.inSeconds;
    int displayHours = totalSeconds ~/ 3600;
    int displayMinutes = (totalSeconds % 3600) ~/ 60;
    int displaySeconds = totalSeconds % 60;

    String formattedTime =
        '${displayHours.toString().padLeft(2, '0')}:${displayMinutes.toString().padLeft(2, '0')}:${displaySeconds.toString().padLeft(2, '0')}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total Duration: $formattedTime'),
      ],
    );
  }
}
