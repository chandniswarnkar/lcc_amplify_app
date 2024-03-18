import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/common/hint_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component.dart';
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
//bool showCorrectAnswer = false;
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(child:
          Row( children:[
            SizedBox(height: 20,),
            Container(

              width: 60,
              height: 40,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
              decoration: ShapeDecoration(
                color: Color(0xFFE9ECED),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
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
          ]
          ),
          ),
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
          const SizedBox(height: 20,),
          Row( mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Container(
                  alignment: Alignment.center,
                  height: 280,
                  width: 320, //MediaQuery.of(context).size.width,//Tochange
                  child: FlipCardComponent(isTappingRequired: true,frontWidget: FrontTappableWidget(dateValueSetter: () {
               if  (isNextButtonPressed) {
                    setState(() {
                      if (isQuestionOneDone) {
                      showCorrectAnswerView =  false;
                      showWrongAnswerView =  true;
                      _currentSliderValue = 5;
                        isQuestionTwoPresented = true;

                      } else {
                        showCorrectAnswerView =  true;
                        isQuestionOneDone = true;

                        coinText = "5";
                      }
                         showHintView = false;
                        showQuizView =  false;

                    });
                    }
                  }, wrongDateValueSetter: () {
                    if (isNextButtonPressed) {
                    setState(() {

                      if (isQuestionOneDone) {
                        showCorrectAnswerView =  false;
                        showWrongAnswerView =  true;
                        isQuestionTwoPresented = true;

                      } else {
                        showCorrectAnswerView =  true;
                       // isQuestionOneDone = true;

                      }
                      showQuizView = false;
                      showCorrectAnswerView = false;
                      showHintView = false;
                      showWrongAnswerView = true;
                      isQuestionTwoDone = false;

                    });
                    }

                  },
                  ),backWidget: BackTappableWidget(cvvValueSetter: () {
                    if (isNextButtonPressed) {
                      setState(() {
                        isQuestionTwoPresented = true;
                        showCorrectAnswerView =
                        isQuestionOneDone ? true : false;
                        showHintView = false;
                        showWrongAnswerView = isQuestionOneDone ? false : true;
                        showQuizView = false;
                        isQuestionTwoDone = true;
                        showHintView = false;
                      });
                    }
                  },
                  ),
                  ),
                )
              ]
          ),
          Visibility(visible: showMainView,
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: const Text(
                      'You have been given a new virtual credit card that you can use in this App. Use your finger to drag and explore your card around.',
                      maxLines:5 ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
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
          Visibility(visible: showQuizView ,
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Expanded(
                  child: KYCBottomPage(isLevelOneCompleted: isQuestionOneDone, isLevelTwoPresented: isQuestionTwoPresented,),
                ),
                ]
            ),
          ),
          Visibility( visible: showCorrectAnswerView,
            child: Row(children:[
              Expanded( child :
              Container(
                height: 320,
                child: RightAnswerComponent(successText: 'You have got 5 coins',onPressed: () {
                  if (isQuestionTwoDone) {

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>  LessonOneFinalQuizPage()));
                  } else {
                    setState(() {
                      showCorrectAnswerView = false;
                      showQuizView = true;
                    });
                  }


                },

                ),
              )
              )
            ]
            ),
          ),

          Visibility( visible: showWrongAnswerView,
            child: Row(children:[
              Expanded( child :
              Container(
                height: 320,
                child: WrongAnswerComponent(errorText: 'Oops\n Wrong Answer', onHintPressed: () {

                  setState(() {
                    showHintView = true;
                    showWrongAnswerView = false;
                  });
                }, onRetryPressed: () {
                  setState(() {
                    showWrongAnswerView = false;
                    showQuizView = true;
                  });
                },


                ),
              )
              )
            ]
            ),
          ),

          Visibility( visible: showHintView,
            child: Row(children:[
              Expanded( child :
              Container(
                height: 320,
                child: HintComponent(hintText: 'The Expiry date is a four-digit number printed on the front of the card.', onPressed: () {
                  setState(() {
                    showHintView = false;
                    showQuizView = true;
                  });


                }, ),
              )
              )
            ]
            ),
          ),
          /////
          SizedBox(height: 10,),
          Visibility(visible: showMainView,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [ Container(
                width: 250,
                height: 70,
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
                  child: const Text('Next', style:TextStyle(
                    color: Colors.white ,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    // height: 0.07,
                  ),
                  ),
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
            // fit: BoxFit.cover,
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
            Row( mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  GestureDetector(
                    child:
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        '1234 5678 1234 5678',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          //  height: 0,
                        ),
                      ),

                    ),
                    onTap: wrongDateValueSetter,
                  ),
                ]

            ),
            SizedBox(height: 20,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  GestureDetector(
                    child:
                    Container(
                      margin: EdgeInsets.all(10),
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
                            '08/30',
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

