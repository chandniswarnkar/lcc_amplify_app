
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lcc_flutter_app/badge_screen.dart';
import 'package:lcc_flutter_app/expertise_page.dart';

import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/common/right_ans_component.dart';
import 'package:lcc_flutter_app/know_your_card.dart';
import 'package:lcc_flutter_app/levelcompletion_video_screen.dart';
import 'package:lcc_flutter_app/common/constants.dart';
import 'package:lcc_flutter_app/practice_page.dart';
import 'package:lcc_flutter_app/rewards_page.dart';

import 'common/wrong_ans_component.dart';
import 'enter_card_details_page.dart';
import 'image_slider_widget.dart';
import 'learning_page.dart';
import 'level3/link_bank_account_page.dart';
import 'level4/instruction_page.dart';


class StartLevelPage extends StatefulWidget {
  const StartLevelPage({ super.key });

  @override
  State<StartLevelPage> createState() => _StartLevelPageState();

}

final controller = ScrollController();
class _StartLevelPageState extends State<StartLevelPage> {

  int _selectedIndex = 0;
  bool isTabSelected = false;

  static const List<Widget> _widgetOptions = <Widget>[
    LCCLearningPage(),
    RewardsPage(),
    PracticePage()
  ];

  void initState() {
    super.initState();

  }




  scrollTo(BuildContext context, int i) => controller.animateTo(
    i == 0.0
        ? 0.0
        : i == 1
        ? MediaQuery.of(context).size.height * .18
        : MediaQuery.of(context).size.height * 1.5,
    duration: scrollAnimationDuration,
    curve: scrollAnimationCurve,
  );


  @override
  Widget build(BuildContext context) {

    Timer(Duration(milliseconds: 500), () {
      if (this.mounted) {
        scrollTo(context, 1);
      }
    });

    return Scaffold(

        body:  isTabSelected == false?
        StartLevelWidget():_widgetOptions [_selectedIndex],
        bottomNavigationBar:Row(
          children: [
            GestureDetector( onTap: () {
              setState(() {
                _selectedIndex = 0;
              });

            },
              child:
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 85,
                padding: const EdgeInsets.symmetric(horizontal: 26),
                decoration: _selectedIndex == 0 ? BoxDecoration(color: Colors.black) : BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child:  _selectedIndex == 0 ? Image.asset("assets/images/Learn_icon_White.png") : Image.asset("assets/images/Learn_icon_Black.png"),

                    ),
                    Text(
                      'Learn',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _selectedIndex == 0 ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector( onTap: () {
              setState(() {
                _selectedIndex = 1;
                isTabSelected = true;
              });
            },
              child:
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 85,
                padding: const EdgeInsets.symmetric(horizontal: 26),
                decoration: _selectedIndex == 1 ? BoxDecoration(color: Colors.black) : BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal:2, vertical: 2),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35.0,
                            height: 35.0,
                            child: _selectedIndex == 1 ? Image.asset("assets/images/Reward_Icon_white.png") : Image.asset("assets/images/Reward_Icon_black.png"
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Rewards',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _selectedIndex == 1 ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector( onTap: () {
              setState(() {
                _selectedIndex = 2;
                isTabSelected = true;
              });
            },
              child:
              Container(
                width: MediaQuery.of(context).size.width/3,
                height: 85,
                padding: const EdgeInsets.symmetric(horizontal: 26),
                decoration: _selectedIndex == 2 ? BoxDecoration(color: Colors.black) : BoxDecoration(color: Colors.white),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(2),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            child: _selectedIndex == 2 ? Image.asset("assets/images/Practice_Icon_white.png") : Image.asset("assets/images/Practice_Icon_black.png"),

                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Practice',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _selectedIndex == 2 ?Colors.white : Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}

class StartLevelWidget extends StatelessWidget {
  const StartLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      Container(
        width: double.infinity,
        height: 90,
        color: const Color(0xFF11442B),
        padding:EdgeInsets.fromLTRB(30, 25, 30, 0),
        child: Row(

          children: [
            const Text('Transacting',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontFamily: 'Inter',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,

              ),
            ),
            Spacer(),
            GestureDetector(
                child: Container(
                  width: 34.60,
                  height: 34.60,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                  child: Icon( Icons.close,
                    color: Colors.black, ),

                ),
                onTap: (){
                  Navigator.pop(context);

                }
            ),
          ],
        ),

      ),
      // Row1
      Row(children: [
        Container (
          height: 210,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF2A5C43),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30,),
                Container(
                  width: 80,
                  height: 30,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1,color:Colors.white),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Skill 01',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      // height: 0.09,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Make online payments for \ngoods/services',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      // height: 0.08,
                    ),
                  ),
                ),
               // SizedBox(height: 10,),

                Container( padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                  child: const Text(
                    'Use various payment methods like credit/debit cards, direct bank transfers, and mobile accounts for online purchases.',
                    maxLines: 4,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,

                    ),
                  ),
                ),


              ]
          ),
        ),

      ]
      ),
      Stack(
        alignment: Alignment.center,
          children:[
        Container(
          height: MediaQuery.of(context).size.height - 385,
          child:
          CustomScrollView(
            controller: controller,
            slivers: <Widget>[

              SliverList(
                delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                      color: Color(0xFF2A5C43),
                    child: Container(
                      width:MediaQuery.of(context).size.width ,
                      height: 1300,
                      // alignment: Alignment.to,
                      child:
                      Image(
                        image: AssetImage("assets/images/level1_new.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
            child:GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => KnowYourCardPage(),//KnowYourCardPage(),
                  ),
                );
              },
              child:
                Container(
                   alignment: Alignment.center,
                  height: 75,
                   width: 300,
                  decoration: ShapeDecoration(
                    color:   Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child:
                Container(


                  child: const Text('Start', style:TextStyle(
                    color: Colors.white ,
                    fontSize:28,
                    fontFamily: 'Inter',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    // height: 0.07,
                  ),
                  ),
                ),
    ),
    ),



        ),
        ///
      ]
      )
    ]
    );
  }
}


// image:  AssetImage("assets/images/bg_skill1.png"),