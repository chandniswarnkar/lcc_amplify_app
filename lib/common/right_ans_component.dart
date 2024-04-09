import 'package:flutter/material.dart';


class RightAnswerComponent extends StatelessWidget {

  final String successText;
  final VoidCallback onPressed;
  RightAnswerComponent({super.key,  required this.successText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 350,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 350,
                      decoration: ShapeDecoration(
                        color: Color(0xFF70E7A7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),

                    Container(
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
                                      image: AssetImage("assets/images/OWL_Correct_answer.gif",),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(

                                  child: Text(
                                    successText,
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
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child:
                                TextButton(
                                  child: Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,

                                    ),
                                  ),
                                  onPressed: onPressed,

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
          ),
        ],
        ),
      ),
    );
  }
}

