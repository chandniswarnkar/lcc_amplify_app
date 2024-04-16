
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../badge_screen.dart';
import '../common/hint_component.dart';
import '../common/right_ans_component.dart';
import '../common/wrong_ans_component.dart';
import '../common/wrong_ans_component_retry_btn.dart';

class LinkBankQuizPage extends StatefulWidget {
  const LinkBankQuizPage({ super.key });

  @override
  State<LinkBankQuizPage> createState() => LinkBankQuizPageState();
}

enum BottomBarComponent {
  HINT_PANEL,
  NO_HINT_PANEL,
  WRONG_ANSWER_VIEW,
  HINT_VIEW
}

class LinkBankQuizPageState extends State<LinkBankQuizPage> {

  int coinText = 20;
  double _currentSliderValue = 20;
  String _currentQuesValue = '';
  String textFormFieldValue = '';
  String _currentAnsValue = '';
  int _quesIndex = 0;
  int _answerCount = 5;
  late List<String> questions ;
  late List<String> answers;
  bool _textContainerVisible = true;
  bool showHintView = false;
  String _hintText = '';
  bool _hintPanelVisible = false;
  bool isAnswerCorrect = false;

  BottomBarComponent _currentBottomBarComponent = BottomBarComponent.NO_HINT_PANEL;

  Map<String, String> linkBankQuizData = {'Name of the bank': 'HSBC Bank', 'Account Holder Name': 'Alex Wood','Sort Code': '400515','Branch Code': '0515', 'Account Number' : '10719035'};


  @override
  void initState() {
    super.initState();
    questions = linkBankQuizData.keys.toList();
    answers = linkBankQuizData.values.toList();
    answers.shuffle();
  }

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
                      coinText.toString(),
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
                    child: Icon( Icons.close,
                      color: Colors.grey, ),

                  ),
                  onTap: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  }
              ),

            ]
            ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Link a Bank Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      // height: 0.07,
                    ),
                  ),
                  SizedBox(height: 20,),

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Tap and choose ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        // height: 0.07,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text:
                          'the corresponding \ndetails of Alex\'s bank account details',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            // height: 0.07,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30,),
                  Visibility(visible : _textContainerVisible,

                    child:
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Text(
                            questions[_quesIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              // height: 0.07,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(   padding: const EdgeInsets.all(20),
                            child:
                            TextField(
                              textAlign: TextAlign.center,

                            readOnly: true,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                // height: 0.07,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                borderSide: BorderSide(
                                color: Colors.black, width: 3.0),
                                ),
                                contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.3),

                               // hintText: 'Enter value from below  options',
                                labelText: textFormFieldValue,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,

                                  // height: 0.07,
                                ),
                                filled: true,
                                fillColor: isAnswerCorrect ? Color(0xFFD9FFDB) : Colors.white,
                                suffixIcon : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: isAnswerCorrect ? Image.asset(
                                    'assets/images/green_tick.png',
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.fill,
                                  ) : null,
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                  SizedBox(height: 30,),

                  Container(
                    height: 300,
                    margin: const EdgeInsets.all(20),

                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color:   Color(0xFFD2EAFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 0, 8),
                          child: Text(
                            'Options',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 2.5,
                              children: List.generate(answers.length, (ansIndex) {
                                return
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {

                                        if(answers.length > 0) {
                                          _currentAnsValue = answers[ansIndex];
                                          if (_currentAnsValue ==
                                              linkBankQuizData[questions[_quesIndex]]) {
                                            textFormFieldValue = _currentAnsValue;
                                            isAnswerCorrect = true;
                                            _currentSliderValue = _currentSliderValue + 10;
                                            Timer(Duration(seconds: 1), () {
                                              coinText = coinText + 5;
                                              hideCurrentQuestion();
                                            });

                                          } else {
                                            _currentBottomBarComponent = BottomBarComponent.WRONG_ANSWER_VIEW;
                                            showModalBottomSheet<void>(
                                              context: context,
                                              isDismissible: false,
                                              enableDrag: false,
                                              builder: (BuildContext context) {
                                                return  Container(
                                                    width: double.infinity,
                                                    height:420,
                                                    color: Colors.transparent,
                                                    child: _hintPanelVisible ? Container(
                                                      height: 420,
                                                      child: WrongAnswerComponent( errorText: 'Oops! \nWrong Answer', onRetryPressed: () {
                                                        setState(() {
                                                          _currentBottomBarComponent = _hintPanelVisible ? BottomBarComponent.HINT_PANEL : BottomBarComponent.NO_HINT_PANEL;
                                                        });
                                                        Navigator.pop(context);
                                                      }, onHintPressed: () {
                                                        Navigator.pop(context);
                                                        showHintViewBottomSheet();

                                                      },
                                                      ),
                                                    )

                                                    : Container(
                                                      height: 420,
                                                      child: WrongAnswerComponentRetryBtn( errorText: 'Oops! \nWrong Answer', onRetryPressed: () {
                                                        setState(() {
                                                          _currentBottomBarComponent = _hintPanelVisible ? BottomBarComponent.HINT_PANEL : BottomBarComponent.NO_HINT_PANEL;
                                                        });
                                                        Navigator.pop(context);
                                                      }, onHintPressed: () {


                                                      },
                                                      ),
                                                    )

                                                );
                                              },
                                            );

                                          }
                                        }

                                      });

                                    },
                                    child: Container(
                                      // color: Colors.white,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      child: Center(
                                        child: Text(
                                          answers[ansIndex],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                      ),
                                    ),

                                  );
                              },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                  )

                ]
            ),
            const SizedBox(height: 20,),
          ],
        ),
        bottomNavigationBar: currentBottomBarView(context)

    );
  }

  Widget currentBottomBarView(BuildContext context) {

    switch(_currentBottomBarComponent) {
      case BottomBarComponent.HINT_PANEL:
        return bottomBarWithHintPanel(context);
      // case BottomBarComponent.HINT_VIEW:
      //   return bottomBarWithHintView(context);
      case BottomBarComponent.NO_HINT_PANEL:
        return bottomBarWithoutHintPanel(context);
      // case BottomBarComponent.WRONG_ANSWER_VIEW:
      //   return bottomBarWithWrongAnswerView(context);
      default:
        return bottomBarWithoutHintPanel(context);
    }



  }


  Widget bottomBarWithoutHintPanel(BuildContext context) {
    return Container(height: 90,color: Colors.white,);
  }



  Widget bottomBarWithHintPanel(BuildContext context) {
    return   Container(
      height: 120,
      color: Colors.white,
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 75,
            height: 75,
            margin: const EdgeInsets.all(20),
            child:
            Image(image: AssetImage('assets/images/OWL_Default.gif')),
          ),
          Container(
            // color: Colors.blue,
            margin: const EdgeInsets.only(right: 20),
            // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text(
                    "Give me a Hint",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {

                    setState(() {
                      _currentBottomBarComponent = BottomBarComponent.HINT_VIEW;
                    });
                    showHintViewBottomSheet();

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showHintViewBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return  Container(
          width: double.infinity,
          height:400,
          color: Colors.transparent,
          child: HintComponent(hintText: _hintText, onPressed: () {
            setState(() {
              _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;

            });
            Navigator.pop(context);
          },
          ),


        );
      },
    );
  }
  // Widget bottomBarWithWrongAnswerView(BuildContext context) {
  //   return
  //     Container( height: 350,
  //       child: Row(children:[
  //         Expanded( child :
  //         Container(
  //           height: 320,
  //           child: WrongAnswerComponentRetryBtn( errorText: 'Oops! \nWrong Answer', onRetryPressed: () {
  //             setState(() {
  //               _currentBottomBarComponent = _hintPanelVisible ? BottomBarComponent.HINT_PANEL : BottomBarComponent.NO_HINT_PANEL;
  //             });
  //             Navigator.pop(context);
  //           }, onHintPressed: () {
  //             Navigator.pop(context);
  //             showHintViewBottomSheet();
  //
  //           },
  //           ) ,
  //         )
  //         )
  //       ]
  //       ),
  //     );
  // }

  // Widget bottomBarWithHintView(BuildContext context) {
  //   return Container( height: 350,
  //     child: Row(children:[
  //       Expanded( child :
  //       Container(
  //         height: 320,
  //         child: HintComponent(hintText: _hintText, onPressed: () {
  //           setState(() {
  //             _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
  //
  //           });
  //
  //         },
  //         ),
  //       )
  //       )
  //     ]
  //     ),
  //   );
  //
  // }

  Future<void> hideCurrentQuestion() async {
    isAnswerCorrect = false;
    Timer(Duration(seconds: 1), () {
      setState(() {
        _textContainerVisible = false;
        movingToNextQuestion();
      });

    });


  }

  Future<void> movingToNextQuestion() async {
    setState(() {

      _textContainerVisible = true;
      textFormFieldValue = '';
      if (answers.length > 1) {
        _quesIndex++;
        answers.remove(_currentAnsValue);
        _currentQuesValue = questions[_quesIndex];
        switch (_currentQuesValue) {
          case "Account Number":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText = 'The Account number is a 8 digit number';
            _hintPanelVisible = true;
            break;
          case "Sort Code":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText = 'The Sort code is a 6 digit number';
            _hintPanelVisible = true;
            break;
          case "Branch Code":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText = 'The Branch code is a 4 digit number';
            _hintPanelVisible = true;
            break;
          default :
            _currentBottomBarComponent = BottomBarComponent.NO_HINT_PANEL;
            _hintPanelVisible = false;
        // showHintView = false;

        }
      }
      else {

        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          enableDrag: false,

          builder: (BuildContext context) {
            return  Container(
                width: double.infinity,
                height:420,
                color: Colors.transparent,
                child: RightAnswerComponent(successText: "You earned \n 20 coins", onPressed: (){

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BadgeScreen(msgTextTop: 'You are a \n Sharp Scholar',msgTextBottom: 'Badge:\nSharp Scholar',image: "assets/images/curious_explorer_badge.gif",flag: 'Level_3',),
                      )
                  );

                })

            );


          },
        );


      }
    });
  }
}
