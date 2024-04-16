import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/badge_screen.dart';
import '../common/right_ans_component.dart';


class TransactionIdPage extends StatefulWidget {
  const TransactionIdPage({Key? key}) : super(key: key);

  @override
  State<TransactionIdPage> createState() => _TransactionIdPageState();
}

class _TransactionIdPageState extends State<TransactionIdPage> {
  double _currentSliderValue = 90;
  String coinText = "30";
  bool isStartButtonVisible = false;
  bool isSelected = false;
  bool isEarnCoin = false;



  Color backgroundColor = Color(0xFFE9EDF8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 20),
              child: Row(children: [

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE9ECED),
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
              ]),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/Animation_badge_completion.gif'),
          ]),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'You have successfully \ntransferred coins to Alex.',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                // height: 0.07,
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 100,
            decoration: ShapeDecoration(
              color: Color(0xFFF1D4FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Transaction ID is',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  'UK123ABC4567',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ],
            ),


          ),


          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const HintGuideCard(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 8),
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
                            // setState(() {
                            //   isEarnCoin = true;
                            // });
                            _showModalBottomSheet(context);

                          },
                          child: const Text(
                            'Done',
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
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),

              Visibility(visible: isEarnCoin,
                child: Row(children: [
                  Expanded(child:
                  Container(
                    height: 420,
                    child: RightAnswerComponent(
                      successText: 'You earned \n5 Coins', onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BadgeScreen(
                                    msgTextTop: 'You are an \nEager Student',
                                    image: 'assets/images/eager_student_badge.gif',
                                    flag: 'Level_4',
                                    msgTextBottom: 'Badge:\nEager Student',))
                      );
                    },

                    ),
                  )
                  )
                ]
                ),
              ),

            ],
          )


        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return Container(
          height: 420,
          child: RightAnswerComponent(successText: 'You earned \n5 Coins',onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>  BadgeScreen(msgTextTop: 'You are an \nEager Student',
                      image: 'assets/images/eager_student_badge.gif', flag: 'Level_4', msgTextBottom: 'Badge:\nEager Student',))
            );

          },

          ),
        );
      },
    );
  }


}



class HintGuideCard extends StatelessWidget {
  const HintGuideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          width: 450,
          height: 200,
          decoration: ShapeDecoration(
            color: const Color(0xFFD9FFDB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Center(
            child: Text('A Transaction ID is a unique identifier \ncode assigned to each sale that \ntakes place between a customer and \na merchant. This identification \nnumber is vital for tracking each \ntransaction, preventing fraud, and \nsimplifying accounting processes.',
              textAlign: TextAlign.center,
                style: TextStyle(

                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,

                ),

              ),
          ),

        ),
      ],
    );
  }
}
