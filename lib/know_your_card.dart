import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/common/hint_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component.dart';
import 'dart:math' as math;
import 'common/card_flip_component.dart';
import 'common/right_ans_component.dart';
import 'expertise_page.dart';
import 'kyc_bottom_card.dart';

class KnowYourCardPage extends StatefulWidget {
  const KnowYourCardPage({ super.key });

  @override
  State<KnowYourCardPage> createState() => _KnowYourCardPageState();
}

class _KnowYourCardPageState extends State<KnowYourCardPage> {
  double _currentSliderValue = 20;
  List<Widget> cardPageList = [];
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
              image: DecorationImage(
                image: NetworkImage("https://via.placeholder.com/24x24"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Text(
            '0',
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
            child: FlipCardComponent(isTappingRequired: true,frontWidget: FrontTappableWidget(),backWidget: BackTappableWidget(),),)
     ]
     ),
          Visibility(visible: !isNextButtonPressed,
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
          Visibility(visible: isNextButtonPressed,
            child:
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ Expanded(
                  child: KYCBottomPage(),
                ),
                ]
            ),
          ),
          /////
    SizedBox(height: 30,),
          Visibility(visible: !isNextButtonPressed,
            child:
          Row(

            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ Container(
              width: 250,
              child:
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    isNextButtonPressed = true;


                  });

                },
                child: const Text('Next', style:TextStyle(
                  color: Colors.white ,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
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
  const FrontTappableWidget({Key? key}) : super(key: key);

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
                    onTap: () {
                      print(" I am card number");
                    },
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
                    onTap: () {
                      print(" I am name");
                    },
                  ),

                  GestureDetector(
                    child:
                    Container( margin: EdgeInsets.all(10),

                        child: Row(children: [
                          const Text(
                            'VALID\n THRU',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const Text(
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
                    onTap: () {
                      print(" I am expiry number");
                    },
                  )

                ]

            ),


          ] ,
        )
    );
  }
}

class BackTappableWidget extends StatelessWidget {
  const BackTappableWidget({Key? key}) : super(key: key);

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
        onTap: () {
          print(" I am CVV");
        },
      ) ,
    );

  }
}