import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/models/product_item_model.dart';
import 'package:lcc_flutter_app/online_shopping_page.dart';
import 'package:lcc_flutter_app/payment_method_page.dart';
import 'package:lcc_flutter_app/start_level_page.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage(  {super.key,required this.productItemsModel});

  final ProductItemModel productItemsModel;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _currentSliderValue = 5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [

            SafeArea(
              child: Row(children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
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
                GestureDetector(
                    child: Container(
                      width: 34.60,
                      height: 34.60,
                      margin: const EdgeInsets.all(10),
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
            const SizedBox(
              height: 20,
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
                'This product is now in your cart. Click \non Buy Now to proceed to payment',
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
                    mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     //mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                        width: 300,
                        height: 180,
                        child: Image.asset(widget.productItemsModel.itemImage,
                            fit: BoxFit.fill, width: double.infinity),
                      ),
                      const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0,30, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              widget.productItemsModel.itemNumber,
                              style: const TextStyle(
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
                                 Text(
                                  widget.productItemsModel.coins,
                                  style: const TextStyle(
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
            const SizedBox(
              height: 60,
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
                          builder: (context) =>  PaymentMethodPage(productItemsModel:widget.productItemsModel),
                        ),
                      );
                    },
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.white,
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
