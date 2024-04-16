
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/expertise_page.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/practice_page.dart';
import 'package:lcc_flutter_app/rewards_page.dart';

import 'common/constants.dart';
import 'image_slider_widget.dart';
import 'learning_page.dart';

class StartLevel2Page extends StatefulWidget {
  const StartLevel2Page({ super.key });

  @override
  State<StartLevel2Page> createState() => _StartLevel2PageState();

}
final controller = ScrollController();
class _StartLevel2PageState extends State<StartLevel2Page> {
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
        ? 0.0 :
         i == 2
        ? MediaQuery.of(context).size.height * .35
        : MediaQuery.of(context).size.height * 1.5,
    duration: scrollAnimationDuration,
    curve: scrollAnimationCurve,
  );

  @override
  Widget build(BuildContext context) {


    Timer(Duration(seconds: 1), () {
      if (this.mounted) {
        scrollTo(context, 2);
      }
    });

    return Scaffold(

        body: isTabSelected == false?
       StartLevel2Widget() : _widgetOptions [_selectedIndex],

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

class StartLevel2Widget extends StatelessWidget {
  const StartLevel2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Column( children: [
          Container(
            width: double.infinity,
            height: 90,
            color: const Color(0xFF11442B),
            padding:EdgeInsets.fromLTRB(30, 10, 0, 0),
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
                      margin: const EdgeInsets.all(10),
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: OvalBorder(),
                      ),
                      child: Icon( Icons.close,
                        color: Colors.black, ),

                    ),
                    onTap: (){
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) =>   ImageSliderPage(),
                        ),
                      );

                    }
                ),

              ],
            ),

          ),
          // Row1
          Row(children: [
            Container (
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFF2A5C43),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child:
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30,),
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
                    const SizedBox(height: 10,),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.only(left: 10),
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
                    const SizedBox(height: 10,),


                  ]
              ),
            ),

          ]
          ),
          Stack( children:[
            Container(
              height: MediaQuery.of(context).size.height - 325,
              child:
              CustomScrollView(
                controller: controller,
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
                          const Image(
                            image: AssetImage("assets/images/level_02.png"),
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
              child:
              Container(
                // padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                 margin: const EdgeInsets.symmetric(horizontal: 35),
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color:   Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: Row(

                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 75,
                      width: 300,
                      child:
                    TextButton(

                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) =>  const OnlineShoppingPage(),
                          ),
                        );

                      },
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
                  ],
                ),
              ),
            ),


            ///
          ]
          )
        ]);

  }
}



// image:  AssetImage("assets/images/bg_skill1.png"),