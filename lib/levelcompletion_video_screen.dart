import 'dart:async';

import 'package:countup/countup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/start_level2_page.dart';
import 'package:video_player/video_player.dart';

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
      if (duration.compareTo(position) != 1) {
        print("video completed");
        Navigator.of(context).push(
                CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) =>  const StartLevel2Page(),
                ),
              );
      }
      // if (_controller.value.position >= _controller.value.duration) {
      //   // Video has completed playing
      //   Navigator.of(context).push(
      //     CupertinoPageRoute(
      //       fullscreenDialog: true,
      //       builder: (context) =>  const StartLevel2Page(),
      //     ),
      //   );
      //   print('Video completed');
      // }
    });

   /* // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller =
        VideoPlayerController.asset('assets/images/Level_Completion_blank.mp4');

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
    _controller.play();

    // Start the timer when the video starts playing
    _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
      setState(() {
        _secondsElapsed++;
        if (_secondsElapsed >= 100) {
          timer.cancel();
        }
      });

    });
  //  _controller.addListener(checkVideo);*/



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
          FutureBuilder(
            future: _controller.initialize(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: 1 / 2.05, //_controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_controller),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
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

                 /* Countup(
                    begin: 0,
                    end: 100,
                    duration: const Duration(seconds: 12),
                    separator: ',',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
