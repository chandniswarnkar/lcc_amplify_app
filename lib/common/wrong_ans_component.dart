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
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 420,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 420,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFBD4CF),
                        shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16),
                            ),
                        ),
                      ),
                    ),

                    Container(

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                      //  mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(

                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 160,
                                  height: 180,

                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/OWL_Oops.gif",),

                                     //fit: BoxFit.fill,
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
                          const SizedBox(height: 30),
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
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,


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
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,

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

