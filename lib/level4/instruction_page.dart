import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/level4/verification_code_page.dart';
import '../common/hint_component.dart';
import '../common/right_ans_component.dart';
import '../common/wrong_ans_component.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({Key? key}) : super(key: key);

  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

enum BottomBarComponent {
  HINT_PANEL,
  NO_HINT_PANEL,
  WRONG_ANSWER_VIEW,
  HINT_VIEW,
  VIEW_OPTION_BUTTON_VIEW,
  EARN_COINS_VIEW,
}

class _InstructionPageState extends State<InstructionPage> {
  bool isToContainer = true;
  bool isViewButtonVisible = true;
  int coinText = 0;
  double _currentSliderValue = 10;
  String _currentQuesValue = '';
  String textFormFieldValue = '';
  String _currentAnsValue = '';
  int _quesIndex = 0;
  bool isSelected = false;

  late List<String> questions;
  late List<String> answers;
  late List<String> answers1;

  bool _textContainerVisible = true;
  bool showHintView = false;
  bool isOptionContainerVisible = false;
  bool isDescriptionContainerVisible = false;
  String _hintText = '';
  String hintTextone = 'Select Your account number';
  BottomBarComponent _currentBottomBarComponent =
      BottomBarComponent.VIEW_OPTION_BUTTON_VIEW;

  Map<String, String> linkBankQuizData = {
    'From': '10719035',
    'Amount': '100 Coins',
    'Frequency': 'One time',
    'Transfer Date': '01/01/2024',
  };

  Map<String, List<String>> secondLinkBankQuizData = {
    'Description': ['Charity Payment', 'gift', 'Rent', 'Deposit']
  };

  @override
  void initState() {
    super.initState();
    questions = linkBankQuizData.keys.toList();
    answers = linkBankQuizData.values.toList();
    answers1 = secondLinkBankQuizData.values.expand((list) => list).toList();
  }

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
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(8),
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
                Expanded(
                  child: Slider(
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
                      child: Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    }),
              ]),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Bank Transfer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  // height: 0.07,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Tap and choose ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    // height: 0.07,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'the \ncorresponding details in the \nform to initiate fund transfer',
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
              SizedBox(
                height: 60,
              ),
              Visibility(
                visible: isToContainer,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'To',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: Text(
                            'Alex Wood \n10719035',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _textContainerVisible,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        coinText >= 20 ? "Description" : questions[_quesIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          // height: 0.07,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //GestureDetector(
                      // child:
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                        decoration: ShapeDecoration(
                          color: isSelected == true
                              ? const Color(0xFFD9FFDB)
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                            child: Row(
                          children: [
                            Text(
                              textFormFieldValue == ''
                                  ? hintTextone
                                  : textFormFieldValue,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: textFormFieldValue == ''
                                    ? Colors.grey
                                    : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Visibility(
                                visible: isSelected,
                                child: Image.asset('assets/images/tic.png')),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isOptionContainerVisible,
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(30),
                  decoration: ShapeDecoration(
                    color: Color(0xFFD2EAFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
                            childAspectRatio: 3,
                            children: List.generate(
                              answers.length,
                              (ansIndex) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (answers.length > 0) {
                                        _currentAnsValue = answers[ansIndex];
                                        isSelected = true;
                                        if (_currentAnsValue ==
                                            linkBankQuizData[
                                                questions[_quesIndex]]) {
                                          textFormFieldValue = _currentAnsValue;
                                          Timer(Duration(seconds: 1), () {
                                            coinText = coinText + 5;
                                            _currentSliderValue =
                                                _currentSliderValue + 15;
                                            if (coinText == 20) {
                                              isOptionContainerVisible = false;
                                              isDescriptionContainerVisible =
                                                  true;
                                            }
                                            hideCurrentQuestion();
                                          });
                                        } else {
                                          if (questions[_quesIndex] == 'From') {
                                            _hintText =
                                                'The Account number is an \n8-digit number';
                                          }
                                          _currentBottomBarComponent =
                                              BottomBarComponent
                                                  .WRONG_ANSWER_VIEW;
                                          isSelected = false;
                                          showModalBottomSheet<void>(
                                            context: context,
                                            isDismissible: false,
                                            enableDrag: false,
                                            builder: (BuildContext context) {
                                              return  Container(
                                                  width: double.infinity,
                                                  height:350,
                                                  color: Colors.transparent,
                                                  child: Container(
                                                    height: 350,
                                                    child: WrongAnswerComponent( errorText: 'Oops! \nWrong Answer', onRetryPressed: () {
                                                      // setState(() {
                                                      //  // _currentBottomBarComponent = _hintPanelVisible ? BottomBarComponent.HINT_PANEL : BottomBarComponent.NO_HINT_PANEL;
                                                      // });
                                                      Navigator.pop(context);
                                                    }, onHintPressed: () {  },
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
                                    margin: EdgeInsets.symmetric(vertical: 7,horizontal: 20),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        answers[ansIndex],
                                        style: TextStyle(
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
                      )
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: isDescriptionContainerVisible,
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.all(30),
                  decoration: ShapeDecoration(
                    color: Color(0xFFF1D4FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 8),
        child: Text(
          'For example',
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
            childAspectRatio: 3,
            children: List.generate(
              answers1.length,
                  (ansIndex) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      coinText = 25;
                      _currentSliderValue = 80;
                      if (answers1.length > 0) {
                        _currentAnsValue = answers1[ansIndex];
                        isSelected = true;
        
                        textFormFieldValue = _currentAnsValue;
        
                        _currentBottomBarComponent =
                            BottomBarComponent.EARN_COINS_VIEW;

                        showModalBottomSheet<void>(
                          context: context,
                          isDismissible: false,
                          enableDrag: false,

                          builder: (BuildContext context) {
                            return  Container(
                                width: double.infinity,
                                height:350,
                                color: Colors.transparent,
                                child: RightAnswerComponent(successText: "You earned \n 20 coins", onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationCodePage()));
                                })

                            );


                          },
                        );
                      }
                    });
                  },
                  child: Container(
                    // height: 40,
                    margin: const EdgeInsets.all(7),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        answers1[ansIndex],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
      )
      
    ],
    ),


                ),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        bottomNavigationBar: currentBottomBarView(context));
  }

  Widget ViewOptionButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 30),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              setState(() {
                _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
                isToContainer = false;
                isOptionContainerVisible = true;
              });
            },
            child: const Text(
              'View Options',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                // height: 0.07,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarWithHintPanel(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(left: 20),
            child:
                const Image(image: AssetImage('assets/images/OWL_Default.gif')),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
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
                  child: Text(
                    "Give me a Hint",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (questions[_quesIndex] == 'From') {
                        _hintText = 'The Account number is an \n8-digit number';
                      }
                     // _currentBottomBarComponent = BottomBarComponent.HINT_VIEW;
                    });
                    showModalBottomSheet<void>(
                      context: context,
                      isDismissible: false,
                      enableDrag: false,
                      builder: (BuildContext context) {
                        return  Container(
                          width: double.infinity,
                          height:350,
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
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomBarWithWrongAnswerView(BuildContext context) {
    return Container(
      height: 350,
      child: Row(children: [
        Expanded(
            child: Container(
          height: 320,
          child: WrongAnswerComponent(
            errorText: 'Oops\n Wrong Answer',
            onHintPressed: () {
              setState(() {
                _currentBottomBarComponent = BottomBarComponent.HINT_VIEW;
              });
            },
            onRetryPressed: () {
              setState(() {
                _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
              });
            },
          ),
        ))
      ]),
    );
  }

  Widget bottomBarWithHintView(BuildContext context) {
    return Container(
      height: 350,
      child: Row(children: [
        Expanded(
            child: Container(
          height: 320,
          child: HintComponent(
            hintText: _hintText,
            onPressed: () {
              setState(() {
                _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
              });
            },
          ),
        ))
      ]),
    );
  }

  Widget bottomBarWithoutHintPanel(BuildContext context) {
    return Container(
      height: 90,
      color: Colors.white,
    );
  }

  Widget bottomEarnedHint(BuildContext context) {
    return Container(
      height: 330,
      child: RightAnswerComponent(
        successText: 'You earned \n25 Coins',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => VerificationCodePage()));
        },
      ),
    );
  }

  Widget currentBottomBarView(BuildContext context) {
    switch (_currentBottomBarComponent) {
      case BottomBarComponent.HINT_PANEL:
        return bottomBarWithHintPanel(context);
      // case BottomBarComponent.HINT_VIEW:
      //   return bottomBarWithHintView(context);
      case BottomBarComponent.NO_HINT_PANEL:
       return bottomBarWithoutHintPanel(context);
      // case BottomBarComponent.WRONG_ANSWER_VIEW:
      //   return bottomBarWithWrongAnswerView(context);
      // case BottomBarComponent.VIEW_OPTION_BUTTON_VIEW:
      //   return ViewOptionButton(context);
      // case BottomBarComponent.EARN_COINS_VIEW:
      //   return bottomEarnedHint(context);
      default:
        return bottomBarWithoutHintPanel(context);
    }
  }

  Future<void> hideCurrentQuestion() async {
    Timer(Duration(milliseconds: 40), () {
      setState(() {
        _textContainerVisible = false;
        movingToNextQuestion();
      });
    });
  }

  Future<void> movingToNextQuestion() async {
    setState(() {
      isSelected = false;
      hintTextone = '';
      _textContainerVisible = true;
      textFormFieldValue = '';
      if (answers.length > 1) {
        _quesIndex++;
        answers.remove(_currentAnsValue);
        _currentQuesValue = questions[_quesIndex];
        switch (_currentQuesValue) {
          case "From":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText = 'The Account number is an \n8-digit number';
            // _hintPanelVisible = true;
            break;
          case "Amount":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText = 'Amount is the number of coins \nyou wish to transfer';
            //_hintPanelVisible = true;
            break;
          case "Frequency":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText = 'Frequency can be one time \nor recurring';
            //  _hintPanelVisible = true;
            break;
          case "Transfer Date":
            _currentBottomBarComponent = BottomBarComponent.HINT_PANEL;
            _hintText =
                'Date is represented in \nDD/MM/YYYY. You cannot \nmiss it!';
            //   _hintPanelVisible = true;
            break;
          default:
            _currentBottomBarComponent = BottomBarComponent.NO_HINT_PANEL;
          //  _hintPanelVisible = false;
          // showHintView = false;
        }
      } else {
        /* Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BadgeScreen(msgTextTop: 'You are a \n Sharp Scholar',msgTextBottom: 'Badge:\nSharp Scholar',image: "assets/images/curious_explorer_badge.gif",flag: 'Level_3',),
            )
        );*/
      }
    });
  }
}
