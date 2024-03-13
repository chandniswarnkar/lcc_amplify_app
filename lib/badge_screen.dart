import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lcc_flutter_app/levelcompletion_video_screen.dart';


class BadgeScreen extends StatefulWidget {
  const BadgeScreen({Key? key}) : super(key: key);

  @override
  State<BadgeScreen> createState() => _BadgeScreenState();
}



class _BadgeScreenState extends State<BadgeScreen> {

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const VideoPlayerScreen(),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF99369B)),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 150,),
            const Text(
              'Awesome!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),

            const SizedBox(height: 20,),
            const Text(
              'You are a\nQuick Learner',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),

            Container(
              width: 350,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Badge_01.gif"),
                 // fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 100,),
            const Text(
              'Badge:\nQuick Learner',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),

          ],
        ),
      ),

    );

  }
}
