import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/common/card_flip_component.dart';
import 'package:lcc_flutter_app/productlist_page.dart';
import 'package:lcc_flutter_app/start_level_page.dart';

import 'badge_screen.dart';
import 'common/hint_component.dart';
import 'common/wrong_ans_component.dart';
import 'common/wrong_ans_component_retry_btn.dart';

class EnterCardDetailsPage extends StatefulWidget {
  const EnterCardDetailsPage({Key? key}) : super(key: key);

  @override
  State<EnterCardDetailsPage> createState() => _EnterCardDetailsPageState();
}

class _EnterCardDetailsPageState extends State<EnterCardDetailsPage> {
  double _currentSliderValue = 20;
  List<Widget> cardPageList = [];
  bool isNextButtonPressed = false;
  String cardHolderName = '';
  String cardNumber = '';
  String cardExpiry = '';
  String cardCVV = '';

  String coinText = "0";
  bool showWrongAnswerView = false;
  bool _fieldsContainer = true;
  bool showHintView = false;
  String hintText = '';
  bool hintBtnClickd = false;

  //Click of Name
  void _updateCardHolderName(String newText) {
    if(cardHolderName!=''){

        _fieldsContainer = false;
        showWrongAnswerView = true;

    }

    setState(() {
      cardHolderName = newText; // Set the new value for labelText
    });
  }

  //Click of Number
  void _updateCardNumber(String newText) {
    setState(() {
      if(cardHolderName == ''){
        _fieldsContainer = false;
        showWrongAnswerView = true;
      } else if(cardNumber !=''){
        _fieldsContainer = false;
        showWrongAnswerView = true;
      }
      else{
        setState(() {
          cardNumber = newText; // Set the new value for labelText
        });
      }
    });

  }
//Click of date
  void _updateCardExpiry(String newText) {
    if(cardHolderName == ''){
      _fieldsContainer = false;
      showWrongAnswerView = true;
    }else if(cardNumber == ''){
      _fieldsContainer = false;
      showWrongAnswerView = true;
    }else if(cardExpiry != ''){
      _fieldsContainer = false;
      showWrongAnswerView = true;
    }

    else{
      setState(() {
        cardExpiry = newText;
       // Set the new value for labelText
      });
    }

  }

  //Click of CVV
  void _updateCardCVV(String newText) {
    if(cardHolderName == ''){
      _fieldsContainer = false;
      showWrongAnswerView = true;
    }else if(cardExpiry == ''){
      _fieldsContainer = false;
      showWrongAnswerView = true;
    }
    else{
      setState(() {
        cardCVV = newText; // Set the new value for labelText
      });
    }

  }

  bool _isCardHolderNameVisible = false;
  bool _isCardNumberVisible = false;
  bool _isCardExpiryVisible = false;
  bool _isCardCVVVisible = false;
  Color colour = Colors.white;


  _isCardNumberFieldVisible() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (cardHolderName == 'JOHN SENIOR') {
          _isCardHolderNameVisible = true;
          coinText ='5';
        }
      });
    });
    return _isCardHolderNameVisible;
  }

  _isCardExpiryFieldVisible() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (cardNumber == '1234 5678 1234 5678') {
          _isCardNumberVisible = true;
          coinText ='10';
        }
      });
    });
    return _isCardNumberVisible;
  }

  _isCardCVVFieldVisible() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (cardExpiry == '08/30') {
          _isCardExpiryVisible = true;
          coinText ='15';
        }
        if(cardCVV == '123'){
          coinText ='20';
        }
      });
    });
    return _isCardExpiryVisible;
  }

  _isCardCVVValueVisible() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        if (cardCVV == '123') {
          _isCardCVVVisible = true;
        }
      });
    });
    return _isCardCVVVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Row(children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 70,
                height: 40,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
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
                      style: const TextStyle(
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
              Container(
                width: 34.60,
                height: 34.60,
                margin: const EdgeInsets.all(20),
                decoration: const ShapeDecoration(
                  color: Colors.grey,
                  shape: OvalBorder(),
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    backgroundColor: const Color(0xFFE9ECED),
                    foregroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>  const StartLevelPage(),
                        ),
                      );
                    });

                  },
                  child: const Text('X',style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]),
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Enter Card Details',
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
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 342, //MediaQuery.of(context).size.width,//Tochange
              child: FlipCardComponent(
                isTappingRequired: true,
                frontWidget: FrontTappableWidget(
                  updateCardHolderName: _updateCardHolderName,
                  updateCardNumber: _updateCardNumber,
                  updateCardExpiry: _updateCardExpiry,
                ),
                backWidget: BackTappableWidget(
                  updateCardCVV: _updateCardCVV,
                ),
              ),
            )
          ]),

          Visibility(
            visible: _fieldsContainer,
            child: Column(
                children: [

                  Visibility(
                      visible: !_isCardNumberFieldVisible(),
                      child: const HintGuideCard()),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name on Card',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          decoration: ShapeDecoration(
                            /*color: cardHolderName != ''
                          ? const Color(0xFFD9FFDB)
                          : Colors.white,*/
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,

                            ),
                            controller: TextEditingController(text: cardHolderName),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 3),
                              //labelText: cardHolderName
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Visibility(
                      visible: _isCardNumberFieldVisible(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Card Number',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                            decoration: ShapeDecoration(
                              /*color: cardHolderName != ''
                            ? const Color(0xFFD9FFDB)
                            : Colors.white,*/
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                              controller: TextEditingController(text: cardNumber),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 3),
                                //labelText: cardNumber
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Visibility(
                      visible: _isCardExpiryFieldVisible(),
                      child: Column(
                        children: [
                          const Text(
                            'Card Expiry',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                            decoration: ShapeDecoration(
                              /* color: cardHolderName != ''
                            ? const Color(0xFFD9FFDB)
                            : Colors.white,*/
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              cardExpiry,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _isCardCVVFieldVisible(),
                      child: Column(
                        children: [
                          const Text(
                            'CVV',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                            padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                            decoration: ShapeDecoration(
                              //color: cardHolderName !=''? const Color(0xFFD9FFDB):Colors.white,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(width: 1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              cardCVV,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Visibility(
                    visible: !_isCardCVVValueVisible(),
                    child:  Row(
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
                          height: 50,
                          width: 130,
                          margin: const EdgeInsets.only(right: 20),
                          // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: hintBtnClickd == true ? Colors.black : Colors.white,
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
                                child:  Text(
                                  "Give me a Hint",
                                  textAlign: TextAlign.center,
                                  style: hintBtnClickd == true ? const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ):const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onPressed: () {

                                  setState(() {

                                    if(cardHolderName == ''){

                                    }
                                    else if(cardNumber == ''){
                                      hintBtnClickd = true;
                                      hintText = 'The card number is a\n 16-digit number.';
                                      showHintView = true;
                                      _fieldsContainer = false;
                                    }
                                    else if(cardExpiry == ''){
                                      hintText = 'The Expiry date is a four \n-digit number printed on the \nfront of the card.';
                                      showHintView = true;
                                      _fieldsContainer = false;
                                    }
                                    else if(cardCVV == ''){
                                      hintText = 'The CVV is a three digit\nnumber printed on the back \nof the card';
                                      showHintView = true;
                                      _fieldsContainer = false;
                                    }else{
                                      showHintView = false;
                                      _fieldsContainer = true;
                                    }

                                  });

                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Visibility(
                    visible: _isCardCVVValueVisible(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
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
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) =>  const BadgeScreen(msgTextTop: 'You are a \nCurious Explorer',msgTextBottom: 'Badge:\nCurious Explorer',image: "assets/images/curious_explorer_badge.gif",flag: 'Level_2',),
                                ),
                              );
                            },
                            child: const Text(
                              'Proceed Payment',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                // height: 0.07,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                ],
              ),
          ),

          Visibility( visible: showWrongAnswerView,
            child: Row(children:[
              Expanded( child :
              SizedBox(
                height: 320,
                child: (cardHolderName == '')? WrongAnswerComponentRetryBtn(errorText: 'Oops\n Wrong Answer', onRetryPressed: () {
                  setState(() {
                    showWrongAnswerView = false;
                    _fieldsContainer = true;

                  });
                },


                ):WrongAnswerComponent(errorText: 'Oops\n Wrong Answer', onHintPressed: () {
                  setState(() {

                    if(cardNumber == ''){
                      hintBtnClickd = true;
                      hintText = 'The card number is a\n 16-digit number.';
                      showHintView = true;
                      showWrongAnswerView = false;
                    }
                    else if(cardExpiry == ''){
                      hintText = 'The Expiry date is a four \n-digit number printed on the \nfront of the card.';
                      showHintView = true;
                      showWrongAnswerView = false;
                    }
                    else if(cardCVV == ''){
                      hintText = 'The CVV is a three digit\nnumber printed on the back \nof the card';
                      showHintView = true;
                      showWrongAnswerView = false;
                    }else{
                      showHintView = false;
                      showWrongAnswerView = false;

                    }

                  });
                }, onRetryPressed: () {
                  setState(() {
                    showWrongAnswerView = false;
                    _fieldsContainer = true;

                  });
                },


                ),
              )
              )
            ]
            ),
          ),

          Visibility( visible: showHintView ,
            child: Row(children:[
              Expanded( child :
              Container(
                height: 320,
                child: HintComponent(hintText: hintText, onPressed: () {
                  setState(() {
                    showHintView = false;
                    _fieldsContainer = true;

                  });


                }, ),
              )
              )
            ]
            ),
          ),

        ],
      ),
    );
  }
}

class FrontTappableWidget extends StatelessWidget {
  const FrontTappableWidget({
    Key? key,
    required this.updateCardHolderName,
    required this.updateCardNumber,
    required this.updateCardExpiry,
  }) : super(key: key);

  final void Function(String) updateCardHolderName,
      updateCardNumber,
      updateCardExpiry;

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // color: Colors.deepOrange,
                  margin: const EdgeInsets.all(20.0),
                  height: 20,
                  //  alignment: Alignment.topRight,
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
            const SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                child: Container(
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
                onTap: () {
                  updateCardNumber('1234 5678 1234 5678');
                  },
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.all(10),
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
                onTap: () {
                  updateCardHolderName('JOHN SENIOR');

                  print(" I am name");
                },
              ),
              GestureDetector(
                child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
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
                      ],
                    )),
                onTap: () {
                  updateCardExpiry('08/30');
                  print(" I am expiry number");
                },
              )
            ]),
          ],
        ));
  }
}

class BackTappableWidget extends StatelessWidget {
  const BackTappableWidget({Key? key, required this.updateCardCVV})
      : super(key: key);

  final void Function(String) updateCardCVV;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 30),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/card_back_blank.png"),
        // fit: BoxFit.cover,
      )),
      child: GestureDetector(
        child: Container(
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
        onTap: () {
          updateCardCVV('123');
          print(" I am CVV");
        },
      ),
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
          width: 350,
          height: 176,
          decoration: ShapeDecoration(
            color: const Color(0xFFD2EAFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(left: 20),
                child:
                const Image(image: AssetImage('assets/images/OWL_Default.gif')),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Column(
                  children: [
                    Text(
                      'Find and tap the\ncorrect details on the \nvirtual card to enter \nthe data. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
