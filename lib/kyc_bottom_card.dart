import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/common/right_ans_component.dart';
import 'package:lcc_flutter_app/know_your_card.dart';

import 'common/card_ques_component.dart';
import 'common/hint_component.dart';

enum BottomView { questionOnePresented, questionOneDone, questionTwoPresented }
class KYCBottomPage extends StatefulWidget {
  final bool isLevelOneCompleted;
  final bool isLevelTwoPresented;
  const KYCBottomPage({super.key, required this.isLevelOneCompleted, required this.isLevelTwoPresented});

  @override
  State<KYCBottomPage> createState() => _KYCBottomPageState();
}

class _KYCBottomPageState extends State<KYCBottomPage> {

  bool isHintOneShown = false;
  bool isVisible = true;
  late Timer timer;
  int count = 0;



  static Widget defaultTransitionBuilder(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) => setState(() {isVisible = !isVisible;
    timer.cancel();
    }
    ));
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }


  @override
  Widget build(BuildContext context) {

    List<String> texts = ["GFG Text 1", "GFG Text 2", "GFG Text 3"];
    int currentIndex = 0; // Index to track the currently displayed text
    bool levelTwoPresented = widget.isLevelTwoPresented;

     //var currentBottomView =  widget.isLevelTwoPresented ? BottomView.questionTwoPresented : (isLevelOneCompleted ? BottomView.questionOneDone : BottomView.questionOnePresented)
    return Container(
        height: 280,
        color: Colors.white,
        child:
        Column(
          children: [
              Row(
                children: [
                  Expanded(child:
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    color: Colors.white,
                    child: Container(
                        height: 260,
                        child: widget.isLevelOneCompleted  ?
                            widget.isLevelTwoPresented ?
                            CardQuestionComponent( questionNumber: '02/03', questionDescription: 'Move around your card and find \'CVV\' number',
                                    bgColor: Color(0xFFDFBEEE), showCompletedStatus: false) :
                              Stack(children: [
                                 CardQuestionComponent( questionNumber: '01/03', questionDescription: 'Find and tap on expiry date of the card',
                          bgColor: Color(0xFFD2EAFF), showCompletedStatus: true,
                          key:UniqueKey(),),
                                Container(
                                  width: 200,
                                  height: 200,
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/animation.gif",),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ])

                            :  CardQuestionComponent( questionNumber: '01/03', questionDescription: 'Find and tap on expiry date of the card',
                    bgColor: Color(0xFFD2EAFF), showCompletedStatus: false)
                    ),

                  ),
                  ),
                ],
              ),



          ],
        )

    );

  }
}
