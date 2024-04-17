import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/common/hint_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component_retry_btn.dart';
import 'package:video_player/video_player.dart';
import 'dart:math' as math;
import 'common/card_flip_component.dart';
import 'common/right_ans_component.dart';
import 'expertise_page.dart';
import 'kyc_bottom_card.dart';
import 'lesson_one_final_quiz_page.dart';

class QuizStatus {
  static int currentStatus = 0; //For initial Launch
/*
  * 1- For Correct Answer
  * */
}

class KnowYourCardPage extends StatefulWidget {

  KnowYourCardPage({ super.key});
  @override
  State<KnowYourCardPage> createState() => _KnowYourCardPageState();

}

class _KnowYourCardPageState extends State<KnowYourCardPage> {
  double _currentSliderValue = 0;
  List<Widget> cardPageList = [];
  bool showMainView = true;
  bool showQuizView = false;
  bool showCorrectAnswerView = false;
  bool showWrongAnswerView = false;
  bool showHintView = false;
  bool isQuestionOneDone = false;
  bool isQuestionTwoPresented = false;
  bool isQuestionTwoDone = false;
  String coinText = "0";
  bool isNextButtonPressed = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    // _controller = VideoPlayerController.asset('assets/images/Blue_Card_reveal.mp4')..initialize().then((_) {
    //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   setState(() {});
    // });;

    super.initState();
    // _controller = VideoPlayerController.asset('assets/images/Blue_Card_reveal.mp4')
    //   ..initialize().then((_) {
    //     // _controller.play();
    //     // _controller.setLooping(false);
    //     // Ensure the first frame is shown after the video is initialized
    //     setState(() {
    //
    //       // Start the timer when the video starts playing
    //
    //     });
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(child:
          Row(children: [
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(
                  top: 8, left: 8, right: 8, bottom: 8),
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
                      // color: Colors.deepOrange,
                      image: DecorationImage(
                        image: AssetImage('assets/images/coin 2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    coinText,
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
            Expanded(child:
            Slider(
              value: _currentSliderValue,
              activeColor: Colors.green,
              // thumbColor: Colors.white,
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
            GestureDetector(
                child: Container(
                  width: 34.60,
                  height: 34.60,
                  margin: const EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFE9ECED),
                    shape: OvalBorder(),
                  ),
                  child: Icon(Icons.close,
                    color: Colors.grey,),

                ),
                onTap: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                }
            ),
          ]
          ),
          ),

        //  const SizedBox(height: 10,),
          const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
              ]
          ),
         // const SizedBox(height: 5,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,

                  height: 290,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child:
                  //isNextButtonPressed ?
                  FlipCardComponent(isTappingRequired: true,
                    frontWidget: FrontTappableWidget(dateValueSetter: () {
                      if (isNextButtonPressed) {

                          if (isQuestionOneDone) {
                            showWrongAnswerBottomView();
                          } else {
                                coinText = "5";
                               showRightAnswerBottomView();
                          }


                      }
                    }, wrongDateValueSetter: () {
                      if (isNextButtonPressed) {
                        print("here i am ");
                        showWrongAnswerBottomView();
                      }


                    },
                    ),
                    backWidget: BackTappableWidget(cvvValueSetter: () {
                      if (isNextButtonPressed) {

                         // isQuestionTwoPresented = true;
                          if (isQuestionOneDone) {
                            showRightAnswerBottomView();
                            isQuestionTwoDone = true;
                          } else {
                            showWrongAnswerBottomView();
                          }

                      }
                    },
                    ),
                  )
                    //   : Container(
                    // height: 290,
                    // child: AspectRatio(
                    //   aspectRatio: 1 / 2.05, //_controller.value.aspectRatio,
                    //   // Use the VideoPlayer widget to display the video.
                    //   child: VideoPlayer(_controller),
                    // ),)
                )
              ]
          ),
          Visibility(visible: showQuizView,
            child:
            Row(
                children: [ Container(
                  height: 300,
                  width:MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: KYCBottomPage(isLevelOneCompleted: isQuestionOneDone,
                    isLevelTwoPresented: isQuestionTwoPresented,),
                ),
                ]
            ),
          ),

          SizedBox(height: 10,),
          Visibility(visible: showMainView,
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'You have been given a new virtual \ncredit card that you can use in this \nApp. Use your finger to drag and \nexplore your card around.',
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        // height: 0.07,
                      ),
                    ),
                  ),
                ),
                ]
            ),
          ),

          /// testing row

        ],
      ),
      bottomNavigationBar: !isNextButtonPressed ?

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Container(

            margin: EdgeInsets.symmetric(vertical: 60),
            child:
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isNextButtonPressed = true;
                  showMainView = false;
                  showQuizView = true;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 100),
                child: const Text('Next', style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
                ),
              ),
            ),
          ),
        ],
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 100,
            margin: const EdgeInsets.only(left: 20),
            child:
            Image(image: AssetImage('assets/images/OWL_Default.gif')),
          ),
          Container(
            // color: Colors.blue,
            height: 60,
            margin: const EdgeInsets.only(right: 20),
            // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: const Text(
                      "Give me a Hint",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  onPressed: () {
                    showHintBottomModalView();
                  },
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }

  void showHintBottomModalView() {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: HintComponent(hintText: isQuestionOneDone
              ? 'The CVV is a three digit number printed on the back of the card'
              : 'The Expiry date is a four-digit number printed on the front of the card.',
            onPressed: () {
              setState(() {
                showHintView = false;
                Navigator.pop(context);
              });
            },),
        );
      },
    );
  }

  void showRightAnswerBottomView() {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,

      builder: (BuildContext context) {
        return Container(
            width: double.infinity,
            height: 420,
            color: Colors.transparent,
            child: RightAnswerComponent(
                successText: "You earned \n 5 coins", onPressed: ()
        {
          Navigator.pop(context);

          _currentSliderValue = _currentSliderValue + 5;
            if (isQuestionTwoDone == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>  LessonOneFinalQuizPage()));
            } else {
              Timer(Duration(seconds: 1), ()
              {

                setState(() {
                  isQuestionOneDone = true;
                  isQuestionTwoPresented = false;

                  Timer(Duration(seconds: 2), ()
                  {

                    setState(() {
                      isQuestionTwoPresented = true;
                    });
                  });
                });
              });


            }



        }),

        );
      },
    );
  }

  void showWrongAnswerBottomView() {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,

      builder: (BuildContext context) {
        return Container(
            width: double.infinity,
            height: 420,
            color: Colors.transparent,
            child: WrongAnswerComponent(
                errorText: 'Oops! \nWrong Answer',
                onRetryPressed: () {
                  Navigator.pop(context);
                }
                ,
                onHintPressed: () {
                  Navigator.pop(context);
                  showHintBottomModalView();
                })

        );
      },
    );

  }
}

class FrontTappableWidget extends StatelessWidget {
  final VoidCallback? dateValueSetter;
  final VoidCallback? wrongDateValueSetter;

  const FrontTappableWidget({Key? key,  this.dateValueSetter, this.wrongDateValueSetter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          //color: Colors.blue,
          image: DecorationImage(
            image: AssetImage("assets/images/card_front_blank.png"),
             fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // color: Colors.deepOrange,
                  margin: EdgeInsets.all(20.0),
                  padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),
                  height: 20,
                  child: const Text(
                    'BANK',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      //  height: 0,
                    ),
                  ),

                ),

              ],
            ),
            SizedBox(height: 30,),
            Row( mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  GestureDetector(
                    child:
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: const Text(
                        '1234 5678 1234 5678',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          //  height: 0,
                        ),
                      ),

                    ),
                    onTap: wrongDateValueSetter,
                  ),
                ]

            ),
            SizedBox(height: 30,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  GestureDetector(
                    child:
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: const EdgeInsets.fromLTRB(20, 0, 5, 0),
                      child: const Text(
                        'JOHN SENIOR',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                    onTap: wrongDateValueSetter,
                  ),

                  GestureDetector(
                    child:
                    Container( margin: EdgeInsets.all(10),
                        padding: const EdgeInsets.fromLTRB(5, 0, 20, 0),

                        child: const Row(children: [
                          Text(
                            'VALID\n THRU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Text(
                            ' 08/30',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          )
                        ],)

                    ),
                    onTap:  dateValueSetter,
                  )
                ]

            ),


          ] ,
        )
    );
  }
}

class BackTappableWidget extends StatelessWidget {
  final VoidCallback cvvValueSetter;
  const BackTappableWidget({Key? key, required this.cvvValueSetter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right:30),
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/card_back_blank.png"),
            // fit: BoxFit.cover,
          )
      ),
      child:GestureDetector(
        child:
        Container(
          // color: Colors.deepOrange,
          margin: const EdgeInsets.all(10),
          child: const Text(
            '123',
            //textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
        onTap: cvvValueSetter,
      ) ,
    );

  }
}

