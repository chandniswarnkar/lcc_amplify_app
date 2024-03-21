
import 'package:flutter/material.dart';

import '../badge_screen.dart';

class LinkBankQuizPage extends StatefulWidget {
  const LinkBankQuizPage({ super.key });

  @override
  State<LinkBankQuizPage> createState() => LinkBankQuizPageState();
}

class LinkBankQuizPageState extends State<LinkBankQuizPage> {
  String coinText = '0';
  double _currentSliderValue = 0;
  // List <String> questions = ['Name of your bank','Account Holder Name','Sort Code','Branch Code','Account Number'];
  // List <String> answers = ['HSBC Bank','Alex Wood','400515','0515','10719035'];
  String _currentQuesValue = '';
  String textFormFieldValue = '';
  String _currentAnsValue = '';
  int _quesIndex = 0;
  int _answerCount = 5;
 late List<String> questions ;
 late List<String> answers;
  bool _textContainerVisible = true;

  Map<String, String> linkBankQuizData = {'Name of your bank': 'HSBC Bank', 'Account Holder Name': 'Alex Wood','Sort Code': '400515','Branch Code': '0515', 'Account Number' : '10719035'};

  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
     questions = linkBankQuizData.keys.toList();
     answers = linkBankQuizData.values.toList();
    print(linkBankQuizData);
    print(questions);
    print(answers);
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

              width: 80,
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
                    fontSize: 26,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    // height: 0.07,
                  ),
                ),
                SizedBox(height: 20,),
                const Text(
                  'Tap and choose the corresponding details of Alexs bank account details',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    // height: 0.07,
                  ),
                ),
                SizedBox(height: 20,),
                AnimatedOpacity( opacity:opacityLevel,
                  duration: const Duration(seconds: 3),
                  // transitionBuilder: (Widget child, Animation<double> animation) {
                  //   return ScaleTransition(scale: animation, child: child);
                  //
                  // },
                 // key: ValueKey<String>(_currentQuesValue),

                child:
                Container(
                  color: Colors.orangeAccent,
                  child: Column(
                    children: [
                    Text(
                      questions[_quesIndex],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      // height: 0.07,
                    ),
                    ),
                      SizedBox(height: 20,),
                      Container(   padding: const EdgeInsets.all(20),
                        child:
                      TextField(

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a search term',
                          labelText: textFormFieldValue,
                        ),
                      ),
    ),
                    ],
                  ),

                ),
    ),
                Container(
                  height: 400,
                margin: const EdgeInsets.all(20),
                color: Colors.orangeAccent,
                child: GridView.count(
            crossAxisCount: 2,
                  childAspectRatio: 2.5,
            children: List.generate(answers.length, (ansIndex) {
            return GestureDetector(
              onTap: (){
                setState(() {
                     if(answers.length > 0) {
                       _currentAnsValue = answers[ansIndex];
                       if (_currentAnsValue ==
                           linkBankQuizData[questions[_quesIndex]]) {
                         textFormFieldValue = _currentAnsValue;
                         coinText = '10';
                         _textContainerVisible = false;


                         // Future.delayed(Duration(milliseconds: 20), () {
                         //   _textContainerVisible = true;
                         //  //  _quesIndex++;
                         // });


                         if (answers.length > 1) {
                           _quesIndex++;
                           answers.remove(_currentAnsValue);
                         }
                          else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BadgeScreen(msgTextTop: 'You are a \n Sharp Scholar',msgTextBottom: 'Badge:\nSharp Scholar',image: "assets/images/curious_explorer_badge.gif",flag: 'Level_3',),
                            )
                            );
                          }
                       }
                     }

                });

              },
              child: Container(
              height: 50,
            color: Colors.blue,
            margin: const EdgeInsets.all(10),
            child: Center(
            child: Text(
            answers[ansIndex],
            style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            ),
            ),
            ),
            ),
              );
            },
            ),
                        ),
                )

              ]
          ),
          const SizedBox(height: 20,),



        ],
      ),
    );
  }
}