import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/common/card_flip_component.dart';
import 'package:lcc_flutter_app/productlist_page.dart';
import 'package:lcc_flutter_app/start_level_page.dart';

class OnlineShoppingPage extends StatefulWidget {
  const OnlineShoppingPage({Key? key}) : super(key: key);

  @override
  State<OnlineShoppingPage> createState() => _OnlineShoppingPageState();
}

class _OnlineShoppingPageState extends State<OnlineShoppingPage> {
  double _currentSliderValue = 0;
  List<Widget> cardPageList = [];
  bool isNextButtonPressed = false;
  String coinText = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Row(children: [

              Container(
                width: 60,
                height: 40,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 8),
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

                      Navigator.pop(context);
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
              'Online Shopping',
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
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'You are buying a new pair of shoes\nfor your granddaughter who is \n about to participate in a tennis \nmatch at school.',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                // height: 0.07,
              ),
            ),
          ]),
          const SizedBox(
            height: 30,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              width: 342, //MediaQuery.of(context).size.width,//Tochange
              child: FlipCardComponent(
                isTappingRequired: true,
                frontWidget: const FrontTappableWidget(),
                backWidget: const BackTappableWidget(),
              ),
            )
          ]),

          const HintGuideCard(),
          const SizedBox(
            height: 20,
          ),
          Container(
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
                        builder: (context) => const ProductListPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Start Shopping',
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
                  print(" I am card number");
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
                  print(" I am expiry number");
                },
              )
            ]),
          ],
        ));
  }
}

class BackTappableWidget extends StatelessWidget {
  const BackTappableWidget({Key? key}) : super(key: key);

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
                width: 100,
                height: 100,
                margin: const EdgeInsets.only(left: 20),
                child:
                const Image(image: AssetImage('assets/images/OWL_Default.gif')),
              ),
      const Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Column(
          children: [

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Use this virtual card to\nmake the purchase.\n\nBalance ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,

                      ),
                    ),
                    TextSpan(
                      text: '110 coins',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                  ],
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
