import 'package:flutter/material.dart';

class KYCBottomPage extends StatefulWidget {
  const KYCBottomPage({super.key});

  @override
  State<KYCBottomPage> createState() => _KYCBottomPageState();
}

class _KYCBottomPageState extends State<KYCBottomPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: 300,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [

                Expanded(child:
                Container(
                  width: 200,
                  height: 270,
                  color: Colors.cyan,

                ),
    ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child:
                      Image(image: AssetImage('assets/images/OWL_Default.gif')),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: Row(
                  //  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text(
                          "Give me a Hint",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onPressed: () {
                          print('hint Pressed');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
