
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lcc_flutter_app/badge_screen.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/common/right_ans_component.dart';
import 'package:lcc_flutter_app/know_your_card.dart';
import 'package:lcc_flutter_app/levelcompletion_video_screen.dart';

import 'common/wrong_ans_component.dart';

class StartLevelPage extends StatefulWidget {
  const StartLevelPage({ super.key });

  @override
  State<StartLevelPage> createState() => _StartLevelPageState();

}

class _StartLevelPageState extends State<StartLevelPage> {

  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => () {
     print("view loaded");
      controller.animateTo(
        20.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );

    });
  }

  final controller = ScrollController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Transacting',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,

            ),
          ),
          backgroundColor: Color(0xFF11442B),
        ),
        body:

        Column( children: [
      // Row1
      Row(children: [
       Container (
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF2A5C43),
                child:
                Column(
                    children: [
                      SizedBox(height: 40,),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 10),
                    height: 20,
                    child: Text(
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
                    height: 25,
                    padding: EdgeInsets.only(left: 10),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Make online payments for goods/services',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                       // height: 0.08,
                      ),
                    ),
                  ),
                      SizedBox(height: 10,),
                  Container( padding: EdgeInsets.only(left: 10),
                    child: const Text(
                      'Use various payment methods like credit/debit cards, direct bank transfers, and mobile accounts for online purchases.',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
            Stack( children:[
              Container(
                height: 540,
                child:
              CustomScrollView(
                slivers: <Widget>[

                  SliverList(
                    delegate: SliverChildBuilderDelegate( (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.green,
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
                bottom: 50,
                child:
                Container(
                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  // margin: const EdgeInsets.symmetric(horizontal: 100,  vertical: 10),
                  margin: EdgeInsets.only(left: 120),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color:   Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(

                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(

                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>  KnowYourCardPage(),
                            ),
                          );

                        },
                        child: const Text('Start', style:TextStyle(
                          color: Colors.white ,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          // height: 0.07,
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ///
            ]
    )
        ]
        )
    );
  }
}

// image:  AssetImage("assets/images/bg_skill1.png"),