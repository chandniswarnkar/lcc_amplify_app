import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/common/hint_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component.dart';
import 'dart:math' as math;
import 'common/card_flip_component.dart';
import 'common/right_ans_component.dart';

class KnowYourCardPage extends StatefulWidget {
  const KnowYourCardPage({ super.key });

  @override
  State<KnowYourCardPage> createState() => _KnowYourCardPageState();
}

class _KnowYourCardPageState extends State<KnowYourCardPage> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
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
            height: 280,
            width: 300,
            child: FlipCardComponent(isTappingRequired: false,),)
     ]
     ),

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
    SizedBox(height: 30,),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 50,
        // margin: EdgeInsets.all(l),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                 // height: 0,
                ),
              ),
            ],
          ),
        ),
      ],

    ),
    ],
    ),
    );
  }
}