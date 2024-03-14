
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
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transacting'),
        ),
        body:

        // CustomScrollView(
        //   slivers: <Widget>[
        //
        //     SliverFixedExtentList(
        //       itemExtent: 1000.0,
        //       delegate: SliverChildBuilderDelegate(
        //             (BuildContext context, int index) {
        //           return Container(
        //             alignment: Alignment.center,
        //             color: Colors.lightBlue,
        //             child: Container(
        //               width:MediaQuery.of(context).size.width ,
        //               height: 1000,
        //               child: Image(
        //                 image: AssetImage("assets/images/bg_skill1.png"),
        //                 fit: BoxFit.fill,
        //               ),
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //   ],
        // )


        // add till here

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
                  Container(
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
                height: 550,
                child:
              CustomScrollView(
                slivers: <Widget>[

                  SliverList(
                  //  itemExtent: 1000.0,
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          color: Colors.lightBlue,
                          child: Container(
                            width:MediaQuery.of(context).size.width ,
                            height: 1000,
                            child: Image(
                              image: AssetImage("assets/images/bg_skill1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
    ),
              Positioned(
                bottom: 50,
                child:
                Container(
                 // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                 // margin: const EdgeInsets.symmetric(horizontal: 85,  vertical: 10),
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                  margin: EdgeInsets.all(40),
                  decoration: ShapeDecoration(
                    color:   Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
             child:
             Row(

               mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children:[

              Container(
               // width: 200,
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                 margin: EdgeInsets.all(20),
               // margin: EdgeInsets.symmetric()
               // alignment: Alignment.center,
                child:
              TextButton(

                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.black,
                ),
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
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                   height: 1,
                ),
                ),
              ),
              ),
              ]),
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