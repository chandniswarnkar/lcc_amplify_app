import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/productlist_page.dart';

class OnlineShoppingPage extends StatefulWidget {
  const OnlineShoppingPage({Key? key}) : super(key: key);

  @override
  State<OnlineShoppingPage> createState() => _OnlineShoppingPageState();
}

class _OnlineShoppingPageState extends State<OnlineShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Text(
                'Online Shopping',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),

            SizedBox(height: 100,),
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
                          builder: (context) => const ProductListPage(),
                        ),
                      );

                    },
                    child: const Text('Start Shopping', style:TextStyle(
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

  _OnlineShoppingPageState();
}
