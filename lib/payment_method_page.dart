import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'online_shopping_page.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height:100,
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
                'Choose a Payment Method',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Column(
              children: [
                Container(
                  width: 342,
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
                        width: 200,
                        height: 200,
                        child: Image.asset("assets/images/shoo1.png",
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
                          builder: (context) => const OnlineShoppingPage(),
                        ),
                      );

                    },
                    child: const Text('Credit Card', style:TextStyle(
                      color: Colors.white ,
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
                          builder: (context) => const OnlineShoppingPage(),
                        ),
                      );

                    },
                    child: const Text('Debit Card', style:TextStyle(
                      color: Colors.white ,
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
      ),
    );
  }
}
