import 'package:flutter/material.dart';


class PracticePage extends StatefulWidget {
  const PracticePage({ super.key });

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PracticeView(),
    );
  }
}

class PracticeView extends StatelessWidget {
  const PracticeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       SizedBox(height: 10),
        Expanded(child:
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFD6C4E4)), //#D6C4E4
          child: ListView(
            children: [
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/OWL_Practice.gif"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
               SizedBox(height: 15),
               Text(
                  'Practice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    height: 0,
                  ),
                ),
              SizedBox(height: 20),
              Text(
                  'Empower Your Performance',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    height: 0.09,
                  ),
                ),
              SizedBox(height: 40),
               Container(
                 height: 109,
                  width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.symmetric(horizontal: 40),
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 0,
                    right: 0,
                    bottom: 40,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Mistakes',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          height: 0,
                        ),
                      ),
                      const SizedBox(width: 120),
                      Text(
                        '00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(height: 10),
              Container(
                height: 109,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 40),
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 0,
                  right: 0,
                  bottom: 40,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Review',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        height: 0,
                      ),
                    ),
                    const SizedBox(width: 120),
                    Text(
                      '00',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        height: 0,
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
    );
  }
}