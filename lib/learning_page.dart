import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/category_page.dart';

//
// class YellowBird extends StatefulWidget {
//   const YellowBird({ super.key });
//
//   @override
//   State<YellowBird> createState() => _YellowBirdState();
// }
//
// class _YellowBirdState extends State<YellowBird> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: const Color(0xFFFFE306));
//   }
// }

class LCCLearningPage extends StatefulWidget {
  const LCCLearningPage({super.key});

  // This widget is the root of your application.
  @override
  State<LCCLearningPage> createState() => LCCLearningPageState();

}

class LCCLearningPageState extends State<LCCLearningPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
      children: [ Expanded(child:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xFFD6C4E4)),
            child:ListView(
            padding: const EdgeInsets.all(20),

            children: [
              const SizedBox(height: 80),
                Row(
                 children: [
                   const Text(
                      'Essential Digital Skills',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                   const Spacer(),
                   Container(
                     width: 40,
                     height: 40,
                     decoration: ShapeDecoration(
                       image: const DecorationImage(
                         image: AssetImage("assets/images/user_profile.png"),
                         fit: BoxFit.fill,
                       ),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(140),
                       ),
                     ),
                   ),


                 ],
               ),
              const SizedBox(height: 20),
              Container(
                  height: 100,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: GestureDetector(
                    onTap:(){
                      //to add
                    //  Navigator.pushNamed(context, 'categoryPage');

                      // Navigator.of(context).push(
                      //   CupertinoPageRoute(
                      //     fullscreenDialog: true,
                      //     builder: (context) => const CategoryPage(),
                      //   ),
                      // );
                    //  Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryPage()), );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryPage(), fullscreenDialog: true),
                      );

                    },
                    child:Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Transacting',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    '4 Skills',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Container(
                                  width: 65,
                                  height: 70,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:AssetImage("assets/images/transacting_ellipse.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(140),
                                    ),
                                  ),
                                ),

                            ],
                          ),

                        ),
                      ),
                    ],
                  ),
                      ),
                ),
              const SizedBox(height: 10),
              Container(
                  height: 100,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Communicating',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    '7 Skills',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                            //  const SizedBox(width: 80),

                                  Stack(children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: ShapeDecoration(
                                        image: const DecorationImage(
                                          image:AssetImage("assets/images/communicating_ellipse.png"),
                                          fit: BoxFit.fill,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(140),
                                        ),
                                      ),
                                    ),


                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                        child: Image.asset("assets/images/Lock.png",  fit: BoxFit.fill,

                                        )
                                      ),
                                    ),





                                  ],),


                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                  height: 100,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Handling Content',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    '8 Skills',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                             // const SizedBox(width: 50),
                              Stack(children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:AssetImage("assets/images/handling_ellipse.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(140),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                      child: Image.asset("assets/images/Lock.png",  fit: BoxFit.fill,

                                      )
                                  ),
                                ),





                              ],),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                  height: 100,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Problem Solving',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    '4 Skills',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                             // const SizedBox(width: 50),
                              Stack(children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:AssetImage("assets/images/problem_solving_ellipse.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(140),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                      child: Image.asset("assets/images/Lock.png",  fit: BoxFit.fill,

                                      )
                                  ),
                                ),





                              ],),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 10),
              Container(
                  height: 100,
                  decoration: ShapeDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Online Safety',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    '4 Skills',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      height: 0.09,
                                    ),
                                  ),
                                ],
                              ),
                            //  const SizedBox(width: 80),
                              Stack(children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: ShapeDecoration(
                                    image: const DecorationImage(
                                      image:AssetImage("assets/images/online_safety_ellipse.png"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(140),
                                    ),
                                  ),
                                ),


                                Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                      child: Image.asset("assets/images/Lock.png",  fit: BoxFit.fill,

                                      )
                                  ),
                                ),





                              ],),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
    ),
      ],
      // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
