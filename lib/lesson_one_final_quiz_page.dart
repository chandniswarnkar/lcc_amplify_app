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
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 70,
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
                        '10',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),

                    child:
                    LinearProgressIndicator(
                      backgroundColor: Color(0xFFE9ECED),
                      value: _currentSliderValue * 0.01,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),


                    ),

                  ),
                ),

                GestureDetector(
                    child: Container(
                      width: 34.60,
                      height: 34.60,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFE9ECED),
                        shape: OvalBorder(),
                      ),
                      child: Icon( Icons.close,
                        color: Colors.black, ),

                    ),
                    onTap: (){
                      setState(() {
                        Navigator.pop(context);
                      });
                    }
                ),
              ]),
            ),
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
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
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
                          // Opacity(
                          //   opacity: 0.1,
                          //   child: Container(
                          //     width: 180,
                          //     height: 50,
                          //     margin: const EdgeInsets.only(top: 70),
                          //     decoration: ShapeDecoration(
                          //       color: Colors.grey,
                          //       shape: OvalBorder(),
                          //     ),
                          //   ),
                          // ),
                          Container(
                            width: 100,
                              height: 100,
                           // margin: const EdgeInsets.only( left: 30),
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
                        'A stranger calls you and \nrequests you to share your \nCVV number for an urgent \nverification process.\nWhat would you do?',
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
                                  setState(() {
                                    isAnswerWrong = true;
                                  });

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
                                          builder: (BuildContext context) =>  const BadgeScreen(msgTextTop: 'You are a\nQuick Learner',msgTextBottom: 'Badge:\nQuick Lerner',image: "assets/images/Badge_01.gif",flag: 'Level_1',)));
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
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFFFBD4CF),
                ),
                child: Column(
                   mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [

                          // Opacity(
                          //   opacity: 0.1,
                          //   child: Container(
                          //     width: 180,
                          //     height: 50,
                          //     alignment: Alignment.center,
                          //     margin: const EdgeInsets.only(top: 110),
                          //     decoration: ShapeDecoration(
                          //       color: Colors.grey,
                          //       shape: OvalBorder(),
                          //     ),
                          //   ),
                         // ),

                          Container(

                            width: 120,
                            height: 120,
                            alignment: Alignment.center,
                           margin: const EdgeInsets.only(top: 40,),
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
                                          builder: (BuildContext context) =>  const VideoPlayerScreen(levelComlpetionText: 'Level 1 Completed',)));
                                }
                                  , child:
                                  const Text(
                                    'Done',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
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
