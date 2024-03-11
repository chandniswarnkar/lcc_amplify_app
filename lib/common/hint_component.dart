import 'package:flutter/material.dart';


class HintComponent extends StatelessWidget {

  final String hintText;
  final VoidCallback onPressed;

  HintComponent({super.key,  required this.hintText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
        Column(
        children: [
        Container(
        width: 300,
          height: 350,
          child: Stack(
            children: [
               Container(
                  width: 300,
                  height: 350,
                  decoration: ShapeDecoration(
                    color: Color(0xFF8FDDEE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

              Container(
                //  width: 300,
                 // height: 350,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                         // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                   image: AssetImage("assets/images/OWL_Rotation_hint.gif",),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(

                              child: Text(
                                hintText,
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                 // height: 0.07,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: ShapeDecoration(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(

                              child: Text(
                                "OK",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,

                                ),
                              ),
                              onPressed: onPressed,

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
      ),
        ],
    ),
      ),
    );
  }
}


