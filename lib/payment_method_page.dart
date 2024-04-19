import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/enter_card_details_page.dart';
import 'package:lcc_flutter_app/start_level_page.dart';

import 'models/product_item_model.dart';
import 'online_shopping_page.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage(  {super.key,required this.productItemsModel});

  final ProductItemModel productItemsModel;

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {

  double _currentSliderValue = 5;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [

            SafeArea(
              child: Container(
                margin: EdgeInsets.fromLTRB(25, 10,25, 20),
                child: Row(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 70,
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
                    child: Container(
                      margin: EdgeInsets.only(left: 15, right: 15),

                      child:
                      LinearProgressIndicator(
                        backgroundColor: Color(0xFFE9ECED),
                        value: _currentSliderValue * 0.01,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),


                      ),

                    ),
                  ),
                  GestureDetector(
                      child: Container(
                        width: 34.60,
                        height: 34.60,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFE9ECED),
                          shape: OvalBorder(),
                        ),
                        child: Icon( Icons.close,
                          color: Colors.grey, ),

                      ),
                      onTap: (){
                        setState(() {
                          Navigator.pop(context);
                        });
                      }
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height:18,
            ),
            const Text(
              'Payment Method',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 5,10, 5),
              child: Text(
                'Choose a \n Payment Method',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  height: 300,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE9ECED),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 180,
                        child: Image.asset(widget.productItemsModel.itemImage,
                            fit: BoxFit.fill, width: double.infinity),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0,30, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Shoe 1',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/coin 2.png",
                                  fit: BoxFit.fill,
                                ),
                                const Text(
                                  '100',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.symmetric( vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30,  vertical: 8),
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
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const EnterCardDetailsPage(),
                        ),
                      );

                    },
                    child: const Text('Credit Card', style:TextStyle(
                      color: Colors.white ,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      // height: 0.07,
                    ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              padding: const EdgeInsets.symmetric( vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 30,  vertical: 8),
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
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const EnterCardDetailsPage(),
                        ),
                      );

                    },
                    child: const Text('Debit Card', style:TextStyle(
                      color: Colors.white ,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      // height: 0.07,
                    ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
