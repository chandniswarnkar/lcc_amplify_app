import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/level4/instruction_page.dart';




class SelectPayeePage extends StatefulWidget {
  const SelectPayeePage({Key? key}) : super(key: key);

  @override
  State<SelectPayeePage> createState() => _SelectPayeePageState();
}

class _SelectPayeePageState extends State<SelectPayeePage> {
  double _currentSliderValue = 0;
  String coinText = "0";
  bool isStartButtonVisible = false;
  bool isSelected = false;


Color backgroundColor = Color(0xFFE9EDF8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SafeArea(
            child: Container(
              margin: EdgeInsets.fromLTRB(25, 10, 25, 20),
              child: Row(children: [

                Container(
                  width: 70,
                  padding: const EdgeInsets.all(8),
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
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),

                    child:
                    LinearProgressIndicator(
                      backgroundColor: Color(0xFFE9ECED),
                      value: _currentSliderValue * 0.01,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),


                    ),

                  ),
                ),

                GestureDetector(
                    child: Container(
                      width: 34.60,
                      height: 34.60,
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
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Bank Transfer',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                // height: 0.07,
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Select a payee to who you \nwant to transfer coins',
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                // height: 0.07,
              ),
            ),
          ]),
          const SizedBox(
            height: 30,
          ),


    Column(

      children: [
        InkWell(
          child: Container(
           margin: EdgeInsets.symmetric(horizontal: 25),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 80,

            decoration: BoxDecoration(
              color: isSelected == true?const Color(0xFFD9FFDB):Color(0xFFE9EDF8),
              border:  isSelected == true?Border.all(color: Colors.black):Border.all(color: Color(0xFFE9EDF8)),
              borderRadius: BorderRadius.all(Radius.circular(7)),
            ),

            child: Row(

              children: [
                Container(

                  width: 50,
                  height: 50,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/alex.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                const SizedBox(width: 9),
                Text(
                  'Alex Wood',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Spacer(),
                Visibility(
                  visible: isSelected,
                    child: Image.asset('assets/images/tic.png')),

              ],
            ),),
          onTap: (){
            setState(() {
              _currentSliderValue = 10;
              isStartButtonVisible = true;
              isSelected = !isSelected;
            });

          },
        ),
        SizedBox(height: 15),
      /*  Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.symmetric(horizontal: 25),
          height: 80,
          decoration: ShapeDecoration(
            color: Color(0xFFE9EDF8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Row(

            children: [
              Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/sarah.png"),
                    fit: BoxFit.fill,
                  ),
                  shape: OvalBorder(),
                ),
              ),
              const SizedBox(width: 9),
              Text(
                'Sarah Williams',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ],
          ),),*/

      ],
    ),

          const SizedBox(
            height: 100,
          ),

          const HintGuideCard(),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: isStartButtonVisible,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
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
                          builder: (context) => const InstructionPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Start',
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
          ),
        ],
      ),
    );
  }
}



class HintGuideCard extends StatelessWidget {
  const HintGuideCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          height: 176,
          decoration: ShapeDecoration(
            color: Color(0xFFF1D4FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(left: 20),
                child:
                const Image(image: AssetImage('assets/images/OWL_Default.gif')),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  children: [

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Use your coins for the \ntransfer.\n\nBalance ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                          TextSpan(
                            text: '220 coins',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,

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
    );
  }
}
