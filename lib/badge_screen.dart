import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lcc_flutter_app/levelcompletion_video_screen.dart';


class BadgeScreen extends StatefulWidget {
   const BadgeScreen(  {super.key,required this.msgTextTop,required this.msgTextBottom,required this.image,required this.flag});

  final String msgTextTop,msgTextBottom,image,flag ;


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
          builder: (context) =>  VideoPlayerScreen(levelComlpetionText: widget.flag=="Level_1"?'Level 1 Completed':'Level 2 Completed',),
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
             Text(
              widget.msgTextTop,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
Stack(
  children: [
    Container(
      width: 350,
      height: 300,
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.image),
          // fit: BoxFit.fill,
        ),
      ),
    ),
    Positioned(
      left: 0,
      right: 0,
      top:0,
      child: Image.asset(
        'assets/images/Animation_badge_completion.gif',
        fit: BoxFit.cover,
      ),
    ),
    //Image.asset('assets/images/Animation_badge_completion.gif')
  ],
),

            const SizedBox(height: 100,),
             Text(
              widget.msgTextBottom,
              textAlign: TextAlign.center,
              style: const TextStyle(
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
