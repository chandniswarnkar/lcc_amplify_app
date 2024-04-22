import 'dart:async';
import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/start_level2_page.dart';
import 'package:video_player/video_player.dart';
import 'level3/start_level3_page.dart';
import 'level4/start_level4_page.dart';
import 'level4/start_level5_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.levelComlpetionText});
  final String levelComlpetionText;
  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  int _secondsElapsed = 0;
  int secondsToDisplay = 0;
  int secondsToStop = 0;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();


    if (widget.levelComlpetionText == "Level 1 Completed") {

    secondsToDisplay = 10;
    secondsToStop =110;
    } else if (widget.levelComlpetionText == "Level 2 Completed") {
      secondsToDisplay = 20;
      secondsToStop =120;
    } else if (widget.levelComlpetionText == "Level 3 Completed") {
      secondsToDisplay = 50;
      secondsToStop =150;
    } else if (widget.levelComlpetionText == "Level 4 Completed") {
      secondsToDisplay = 30;
      secondsToStop =130;
    } else if (widget.levelComlpetionText == "Level 5 Completed") {
      secondsToDisplay = 0;
      secondsToStop = 0;
    }

    _controller =
        VideoPlayerController.asset('assets/images/Level_Completion_blank.mp4')
          ..initialize().then((_) {
            _controller.play();

            setState(() {
// Start the timer when the video starts playing
              _timer =
                  Timer.periodic(const Duration(milliseconds: 70), (timer) {
                setState(() {
                  secondsToDisplay++;
                  _secondsElapsed++;

                  if (_secondsElapsed >= 100 && secondsToDisplay >= secondsToStop) {
                    _timer.cancel();
                  }
                });

              });

            });
          });

    _controller.addListener(() {
      Duration duration = _controller.value.duration;
      Duration position = _controller.value.position;

      if (!_controller.value.isPlaying &&
          _controller.value.isInitialized &&
          (_controller.value.duration == _controller.value.position )) {

        if (widget.levelComlpetionText == "Level 1 Completed") {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => const StartLevel2Page(),
            ),
          );
        } else if (widget.levelComlpetionText == "Level 2 Completed") {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => const StartLevel3Page(),
            ),
          );
        } else if (widget.levelComlpetionText == "Level 3 Completed") {
            Navigator.of(context).push(
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => const StartLevel4Page(),
              ),
            );

        } else if (widget.levelComlpetionText == "Level 4 Completed") {
            Navigator.of(context).push(
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => const StartLevel5Page(),
              ),
            );

        }

// Need to add the code to navigate to the next level
        _controller.removeListener(() {});
      }
    });
  }

  addCurrentLevelToSF(String stringValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(stringValue, "currentLevel");
    print(prefs.getString('currentLevel'));
  }

  @override
  void dispose() {
// Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Colors.orangeAccent,
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.black,
      ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/first_image.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: AspectRatio(
                  aspectRatio: 1 / 2.20, //_controller.value.aspectRatio,
// Use the VideoPlayer widget to display the video.
                  child:  VideoPlayer(_controller),
                ) ,
              ) ,
              Positioned(
                top: 30.0,
                child: Container(
                  child: Text(
                    widget.levelComlpetionText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 550),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/coin 2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(secondsToDisplay> secondsToStop ? '$secondsToStop' :'$secondsToDisplay',

                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
    );
  }
}
