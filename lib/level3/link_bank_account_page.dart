
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/Level3/link_bank_quiz_page.dart';

class LinkBankAccountPage extends StatefulWidget {
  const LinkBankAccountPage({ super.key });

  @override
  State<LinkBankAccountPage> createState() => LinkBankAccountState();
}

class LinkBankAccountState extends State<LinkBankAccountPage> {
  String coinText = '0';
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(child:
          Row( children:[
            SizedBox(height: 100,),
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
          const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
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
                Text(
                  'You need to repay the 100 coins to your friend Alex.',
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
              ]
          ),
          const SizedBox(height: 20,),
          Container(
            width: 34.60,
            height: 34.60,
            margin: const EdgeInsets.all(10),
            decoration: const ShapeDecoration(
              color: Colors.grey,
              shape: OvalBorder(),
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>  LinkBankQuizPage()));

              },
              child: const Text('X'
              ),
            ),
          ),


        ],
      ),
    );
  }
}