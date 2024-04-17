import 'dart:async';

import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/start_level2_page.dart';
import 'package:video_player/video_player.dart';

import 'level3/start_level3_page.dart';
import 'level4/start_level4_page.dart';
import 'level4/start_level5_page.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key,required this.levelComlpetionText});
  final String levelComlpetionText;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  int _secondsElapsed = 0;


  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/images/Level_Completion_blank.mp4')
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized

          if (widget.levelComlpetionText == "Level 1 Completed") {
            _secondsElapsed = 10;
            // Start the timer when the video starts playing
            _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
              setState(() {

                _secondsElapsed++;
                if (_secondsElapsed >= 110) {

                  timer.cancel();
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>  const StartLevel2Page(),
                    ),
                  );


                }
              });

            });
          }
          else if (widget.levelComlpetionText == "Level 2 Completed") {
            _secondsElapsed = 20;
            // Start the timer when the video starts playing
            _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
              setState(() {

                _secondsElapsed++;
                if (_secondsElapsed >= 120) {

                  timer.cancel();
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>  const StartLevel3Page(),
                    ),
                  );

                }
              });

            });
          }
          else if (widget.levelComlpetionText == "Level 3 Completed") {
            _secondsElapsed = 50;
            // Start the timer when the video starts playing
            _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
              setState(() {

                _secondsElapsed++;
                if (_secondsElapsed >= 150) {

                  timer.cancel();
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>  const StartLevel4Page(),
                    ),
                  );

                }
              });

            });
          }
          else if (widget.levelComlpetionText == "Level 4 Completed") {
            _secondsElapsed = 30;
            // Start the timer when the video starts playing
            _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
              setState(() {

                _secondsElapsed++;
                if (_secondsElapsed >= 130) {

                  timer.cancel();
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) =>  const StartLevel5Page(),
                    ),
                  );

                }
              });

            });
          }


      });
    _controller.addListener(() {
      Duration duration = _controller.value.duration;
      Duration position = _controller.value.position;

     // if (_controller.value.position == _controller.value.duration)  {
      if (!_controller.value.isPlaying &&_controller.value.isInitialized &&
          (_controller.value.duration ==_controller.value.position)) {
      print("video completed");

        if (widget.levelComlpetionText == "Level 1 Completed" && _secondsElapsed == 110 ) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>  const StartLevel2Page(),
            ),
          );
        } else if (widget.levelComlpetionText == "Level 2 Completed" && _secondsElapsed == 120) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>  const StartLevel3Page(),
            ),
          );
        }else if (widget.levelComlpetionText == "Level 3 Completed" && _secondsElapsed == 150) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>  const StartLevel4Page(),
            ),
          );
        }else if (widget.levelComlpetionText == "Level 4 Completed" && _secondsElapsed == 130) {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>  const StartLevel5Page(),
            ),
          );
        }


     // Need to add the code to navigate to the next level
        _controller.removeListener(() { });
      }

    });


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
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body:ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child:  AspectRatio(
                  aspectRatio: 1 / 2.20, //_controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_controller),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Positioned(
                    top: 10.0,
                    child: Container(
                      child:  Text(widget.levelComlpetionText,
                    
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


                      Text('$_secondsElapsed',
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold
                        ),),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

    );
  }
}
