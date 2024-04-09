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

        color: Colors.white,
        child:
        Column(
          children: [
            Visibility( visible: (!isHintOneShown ),
              child:
              Row(
                children: [
                  Expanded(child:
                  Container(
                    margin: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Container(
                        height: 230,
                        child: widget.isLevelOneCompleted  ?

                        widget.isLevelTwoPresented  ? CardQuestionComponent( questionNumber: '02/03', questionDescription: 'Move around your card and find CVV number',
                            bgColor: Color(0xFFDFBEEE), showCompletedStatus: false) :

                        AnimatedSwitcher(
                            duration: const Duration(milliseconds: 1),
                            transitionBuilder: (Widget child, Animation<double> animation) {
                              return ScaleTransition(child: child, scale: animation);
                            },
                            child: isVisible ? CardQuestionComponent( questionNumber: '01/03', questionDescription: 'Find and tap on expiry date of the card',
                              bgColor: Color(0xFFD2EAFF), showCompletedStatus: true,
                              key:UniqueKey(),)

                                : CardQuestionComponent( questionNumber: '02/03', questionDescription: 'Move around your card and find CVV number',
                              bgColor: Color(0xFFDFBEEE), showCompletedStatus: false, key: UniqueKey(),)

                        )


                            :  CardQuestionComponent( questionNumber: '01/03', questionDescription: 'Find and tap on expiry date of the card',
                    bgColor: Color(0xFFD2EAFF), showCompletedStatus: false)
                    ),

                  ),
                  ),
                ],
              ),
            ),
            Visibility( visible: (!isHintOneShown ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(left: 20),
                      child:
                      Image(image: AssetImage('assets/images/OWL_Default.gif')),
                    ),
                    Container(
                      height: 45,
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
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onPressed: () {
                              //

                              showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  HintComponent(hintText: widget.isLevelTwoPresented ? 'The CVV is a three digit number printed on the back of the card' : 'The Expiry date is a four-digit number printed on the front of the card.',
                    onPressed: (){
                    Navigator.pop(context);
                      // setState(() {
                         isHintOneShown = false;
                      //
                      // });
                    },
                  ),
                    ],
                  ),
                ),
              );
            },
          );
          //



                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Visibility( visible: isHintOneShown,
              child: Row(children:[
                Expanded(child:
                Container(
                  height: 350,
                  child: HintComponent(hintText: widget.isLevelTwoPresented ? 'The CVV is a three digit number printed on the back of the card' : 'The Expiry date is a four-digit number printed on the front of the card.',
                    onPressed: (){
                    setState(() {
                      isHintOneShown = false;

                    });
                  },

                  ),
                )
                ),
                // ),
              ]
              ),
            ),

          ],
        )

    );
  }
}
