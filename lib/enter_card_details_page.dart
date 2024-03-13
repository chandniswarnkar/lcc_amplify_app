import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/common/card_flip_component.dart';
import 'package:lcc_flutter_app/productlist_page.dart';

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

  void _updateCardHolderName(String newText) {
    setState(() {
      cardHolderName = newText; // Set the new value for labelText
    });
  }
  void _updateCardNumber(String newText) {
    setState(() {
      cardNumber = newText; // Set the new value for labelText
    });
  }
  void _updateCardExpiry(String newText) {
    setState(() {
      cardExpiry = newText; // Set the new value for labelText
    });
  }
  void _updateCardCVV(String newText) {
    setState(() {
      cardCVV = newText; // Set the new value for labelText
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Row(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: 60,
                height: 40,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                decoration: ShapeDecoration(
                  color: Color(0xFFE9ECED),
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
                          image:
                              NetworkImage("https://via.placeholder.com/24x24"),
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
                frontWidget: FrontTappableWidget(updateCardHolderName: _updateCardHolderName,updateCardNumber: _updateCardNumber,updateCardExpiry: _updateCardExpiry,),
                backWidget: BackTappableWidget(updateCardCVV: _updateCardCVV,),
              ),
            )
          ]),

           const HintGuideCard(),
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
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: TextFormField(
                    decoration:  InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 3),
                        hintText: "Enter Name",
                    labelText: cardHolderName),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: TextFormField(
                    decoration:  InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 3),
                        hintText: "Enter password",
                    labelText: cardNumber),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
             Container(
                margin: EdgeInsets.all(10),
                child:Column(
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

                    Text(
                      cardExpiry,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),




                  ],
                ),
              ),


              Container(
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    'CVV',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),),

          ]),

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
        ],
      ),
    );
  }
}

class FrontTappableWidget extends StatelessWidget {
  const FrontTappableWidget({Key? key,
  required this.updateCardHolderName,
  required this.updateCardNumber,
    required this.updateCardExpiry,

  }) : super(key: key);

  final void Function(String) updateCardHolderName,updateCardNumber,updateCardExpiry;


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
            SizedBox(
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
                  print(" I am card number");
                },
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              GestureDetector(
                child: Container(
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
                  updateCardHolderName('JOHN SENIOR');
                  print(" I am name");
                },
              ),
              GestureDetector(
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
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
                      ],
                    )),
                onTap: () {
                  updateCardExpiry( '08/30');
                  print(" I am expiry number");
                },
              )
            ]),
          ],
        ));
  }
}

class BackTappableWidget extends StatelessWidget {
  const BackTappableWidget({Key? key, required this.updateCardCVV}) : super(key: key);

  final void Function(String) updateCardCVV;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 30),
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
              Image.asset(
                "assets/images/OWL_Oops.gif",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
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
