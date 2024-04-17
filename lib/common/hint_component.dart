import 'package:flutter/material.dart';


class HintComponent extends StatelessWidget {

  final String hintText;
  final VoidCallback onPressed;

  const HintComponent({super.key,  required this.hintText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      // ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: [
        Column(
        children: [
        SizedBox(
        width: MediaQuery.of(context).size.width,
          height: 400,
          child: Stack(
            children: [
               Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: ShapeDecoration(
                    color: Color(0xFF8FDDEE),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ), //BorderRadius.circular(16),
                    ),
                  ),
                ),

              Container(

                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        //   padding
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                         // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                   image: AssetImage("assets/images/OWL_Rotation_hint.gif",),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Text(
                              hintText,
                              maxLines: 3,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                               // height: 0.07,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: 100,

                      // margin: const EdgeInsets.symmetric(horizontal: 20),
                      //   padding: const EdgeInsets.symmetric(vertical: 5),
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

                              onPressed: onPressed,

                              child:
                                Text(
                                "Ok",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,

                                ),
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


