import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/badge_screen.dart';
import 'package:lcc_flutter_app/common/hint_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component.dart';
import 'package:lcc_flutter_app/levelcompletion_video_screen.dart';
import 'dart:math' as math;
import 'common/card_flip_component.dart';
import 'common/right_ans_component.dart';
import 'expertise_page.dart';
import 'kyc_bottom_card.dart';
import 'lesson_one_final_quiz_page.dart';

class LessonOneFinalQuizPage extends StatefulWidget {
  LessonOneFinalQuizPage({super.key});

  @override
  State<LessonOneFinalQuizPage> createState() => _LessonOneFinalQuizPageState();
//bool showCorrectAnswer = false;
}

class _LessonOneFinalQuizPageState extends State<LessonOneFinalQuizPage> {
  double _currentSliderValue = 20;
  List<Widget> cardPageList = [];
  bool isAnswerWrong = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(
            child: Row(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 60,
                height: 40,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                decoration: ShapeDecoration(
                  color: Color(0xFFE9ECED),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                      //  color: Colors.deepOrange,
                        image: DecorationImage(
                          image: AssetImage('assets/images/coin 2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const Text(
                      '0',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  // label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ),
              Container(
                width: 34.60,
                height: 34.60,
                margin: const EdgeInsets.all(10),
                decoration: const ShapeDecoration(
                  color: Colors.grey,
                  shape: OvalBorder(),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });

                  },
                  child: const Text('X'
                  ),
                ),
              ),
            ]),
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Know your\n Credit/Debit Card',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                // height: 0.07,
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Visibility( visible: !isAnswerWrong,
            child:
          Row(
           // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
               //
                width: 350,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFD2EAFF),
                ),
                child: Column(
                 // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.44,
                            child: Container(
                              width: 120,
                              height: 49,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE9ECED),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                              height: 120,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/OWL_Default.gif'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      //width: 280,
                      child: const Text(
                        'What would you do?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                     // width: 266.63,
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Text(
                        'A stranger calls you and requests you to share your CVV number for an urgent verification process.\nWhat would you do?',
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          // height: 0.07,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(onPressed : () {
                                  isAnswerWrong = true;
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (BuildContext context) =>  VideoPlayerScreen()));
                                }
                                  , child:
                                const Text(
                                  'I’ll Share the CVV',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                   // height: 0.09,
                                  ),
                                ),
    ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [ TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>  BadgeScreen()));
                                },
                                child:
                                const Text(
                                  'I’ll  never Share the CVV',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              ],

                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),

          Visibility(visible: isAnswerWrong,
            child:
          Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                //
                width: 350,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFBD4CF),
                ),
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Opacity(
                            opacity: 0.44,
                            child: Container(
                              width: 120,
                              height: 49,
                              decoration: ShapeDecoration(
                                color: Color(0xFFE9ECED),
                                shape: OvalBorder(),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 120,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                AssetImage('assets/images/OWL_Default.gif'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      //width: 280,
                      child: const Text(
                        'Wrong Answer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      // width: 266.63,
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Text(
                        "Never share your CVV with strangers; it's a vital security code for card transactions.",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          // height: 0.07,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(26),
                              ),
                            ),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextButton(onPressed : () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>  VideoPlayerScreen()));
                                }
                                  , child:
                                  const Text(
                                    'Done',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      // height: 0.09,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    ),
        ],
      ),
    );
  }
}
