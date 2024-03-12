
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/common/right_ans_component.dart';
import 'package:lcc_flutter_app/know_your_card.dart';

import 'common/wrong_ans_component.dart';

class StartLevelPage extends StatefulWidget {
  const StartLevelPage({ super.key });

  @override
  State<StartLevelPage> createState() => _StartLevelPageState();
}

class _StartLevelPageState extends State<StartLevelPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          TransactingStartPage(),
        ]),
      ),
    );
  }
}

class TransactingStartPage extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        child: Text(
          'Skill 01',
          style: TextStyle(
            color: Color(0xFF111949),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            height: 0.09,
          ),
        ),
      ),
      Container(
        child: Text(
          'Setup account online',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0.08,
          ),
        ),
      ),
      Container(
        child: Text(
          'Setup an online account through suitable websites or apps that allow to make purchases of goods or services.\n',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0.07,
          ),
        ),
      ),
      SizedBox(height: 100,),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 15,  vertical: 8),
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
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.black,
              ),
              onPressed: () {


                Navigator.of(context).push(
                  CupertinoPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const KnowYourCardPage(),
                  ),
                );



              },
              child: const Text('Start', style:TextStyle(
                color: Colors.white ,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                // height: 0.07,
              ),
              ),
            ),
          ],
        ),
      ),

    ],
  );
}
}