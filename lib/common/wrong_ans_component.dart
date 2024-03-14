import 'package:flutter/material.dart';


class WrongAnswerComponent extends StatelessWidget {

  final String errorText;
  final VoidCallback onHintPressed;
  final VoidCallback onRetryPressed;
  WrongAnswerComponent({super.key, required this.errorText,required this.onHintPressed, required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Column(
            children: [
              Container(
                width: 300,
                height: 320,
                child: Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 320,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFBD4CF),
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
                                      image: AssetImage("assets/images/OWL_Oops.gif",),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(

                                  child: Text(
                                    errorText,
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      // height: 0.07,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container( decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                  child :
                                TextButton(

                                  child: Text(
                                    "Give me a Hint",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,


                                    ),
                                  ),
                                  onPressed: onHintPressed,

                                ),
    ),   //SizedBox(width: 30,),
                                Container( decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1),
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                                  child :
                                TextButton(

                                  child: Text(
                                    "Retry",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,

                                    ),
                                  ),
                                  onPressed: onRetryPressed,

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
        ],
        ),
      ),
    );
  }
}

