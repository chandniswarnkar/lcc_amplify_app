import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/models/product_item_model.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/payment_method_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.productItemModel}) : super(key: key);

  final ProductItemModel productItemModel;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Shopping Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 0,30, 10),
              child: Text(
                'This product is now in your cart. Click on Buy Now to proceed to payment',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  width: 342,
                  height: 410,
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
                      const SizedBox(height: 140),
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
            SizedBox(
              height: 120,
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
                          builder: (context) => const PaymentMethodPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Buy Now',
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
      ),
    );
  }
}
