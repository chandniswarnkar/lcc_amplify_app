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

  bool _isCardHolderNameVisible = false;
  bool _isCardNumberVisible = false;
  bool _isCardExpiryVisible = false;
  bool _isCardCVVVisible = false;
  Color colour = Colors.white;

  _changeBackground() {
    setState(() {
      if (cardHolderName != "") {
        Color colour = Color(0xFFD9FFDB);
      }
    });
  }

  _isCardNumberFieldVisible() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (cardHolderName == 'JOHN SENIOR') {
          _isCardHolderNameVisible = true;
        }
      });
    });
    return _isCardHolderNameVisible;
  }

  _isCardExpiryFieldVisible() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (cardNumber == '1234 5678 1234 5678') {
          _isCardNumberVisible = true;
        }
      });
    });
    return _isCardNumberVisible;
  }

  _isCardCVVFieldVisible() {
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        if (cardExpiry == '08/30') {
          _isCardExpiryVisible = true;
        }
      });
    });
    return _isCardExpiryVisible;
  }

  _isCardCVVValueVisible() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        if (cardCVV == '123') {
          _isCardCVVVisible = true;
        }
      });
    });
    return _isCardCVVVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Row(children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 60,
                height: 40,
                margin: const EdgeInsets.all(20),
                padding:
                    const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
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
                frontWidget: FrontTappableWidget(
                  updateCardHolderName: _updateCardHolderName,
                  updateCardNumber: _updateCardNumber,
                  updateCardExpiry: _updateCardExpiry,
                ),
                backWidget: BackTappableWidget(
                  updateCardCVV: _updateCardCVV,
                ),
              ),
            )
          ]),
          Visibility(
              visible: !_isCardNumberFieldVisible(),
              child: const HintGuideCard()),
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
                    color: cardHolderName != ''
                        ? const Color(0xFFD9FFDB)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,

                    ),
                    controller: TextEditingController(text: cardHolderName),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 3),
                      //labelText: cardHolderName
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Visibility(
              visible: _isCardNumberFieldVisible(),
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
                      color: cardHolderName != ''
                          ? const Color(0xFFD9FFDB)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      controller: TextEditingController(text: cardNumber),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 0, 3),
                        //labelText: cardNumber
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Visibility(
              visible: _isCardExpiryFieldVisible(),
              child: Column(
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 0, 5, 0),
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    decoration: ShapeDecoration(
                      color: cardHolderName != ''
                          ? const Color(0xFFD9FFDB)
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      cardExpiry,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: _isCardCVVFieldVisible(),
              child: Column(
                children: [
                  const Text(
                    'CVV',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                    decoration: ShapeDecoration(
                      //color: cardHolderName !=''? const Color(0xFFD9FFDB):Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      cardCVV,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: !_isCardCVVValueVisible(),
            child: Container(
              width: 350,
              height: 100,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/OWL_Oops.gif",
                    fit: BoxFit.fill,
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Column(
                      children: [
                        Text(
                          'Give me a Hint',
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
          ),
          Visibility(
            visible: _isCardCVVValueVisible(),
            child: Container(
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
          ),
        ],
      ),
    );
  }
}

class FrontTappableWidget extends StatelessWidget {
  const FrontTappableWidget({
    Key? key,
    required this.updateCardHolderName,
    required this.updateCardNumber,
    required this.updateCardExpiry,
  }) : super(key: key);

  final void Function(String) updateCardHolderName,
      updateCardNumber,
      updateCardExpiry;

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
                  updateCardNumber('1234 5678 1234 5678');
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
                  updateCardExpiry('08/30');
                  print(" I am expiry number");
                },
              )
            ]),
          ],
        ));
  }
}

class BackTappableWidget extends StatelessWidget {
  const BackTappableWidget({Key? key, required this.updateCardCVV})
      : super(key: key);

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
