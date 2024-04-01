import 'dart:async';

import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/start_level2_page.dart';
import 'package:video_player/video_player.dart';

import 'level3/start_level3_page.dart';

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
        setState(() {

          // Start the timer when the video starts playing
          _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
            setState(() {
              _secondsElapsed++;
              if (_secondsElapsed >= 100) {

                timer.cancel();

              }
            });

          });
        });
      });
    _controller.addListener(() {
      Duration duration = _controller.value.duration;
      Duration position = _controller.value.position;

     // if (_controller.value.position == _controller.value.duration)  {
      if (!_controller.value.isPlaying &&_controller.value.isInitialized &&
          (_controller.value.duration ==_controller.value.position)) {
      print("video completed");

        if (widget.levelComlpetionText == "Level 1 Completed") {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>  const StartLevel2Page(),
            ),
          );
        } else if (widget.levelComlpetionText == "Level 2 Completed") {
          Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) =>  const StartLevel3Page(),
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
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            child:  AspectRatio(
      aspectRatio: 1 / 2.05, //_controller.value.aspectRatio,
        // Use the VideoPlayer widget to display the video.
        child: VideoPlayer(_controller),
      ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
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
    );
  }
}
