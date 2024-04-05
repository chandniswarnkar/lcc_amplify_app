import 'package:flutter/material.dart';
import 'dart:async';
class RewardsPage extends StatefulWidget {
  const RewardsPage({ super.key });

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  bool isIconsPresented = false;
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      if (this.mounted) {
        setState(() {
          isIconsPresented = true;
        });
      }
    });

    return Scaffold(

      body: isIconsPresented ? RewardsIcons()
            : Container(
          color: const Color(0xFF656F62)
          // child: Text('Reward'),
        ),
    );
  }
}

class RewardsIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text("Rewards")),
        body: Container(
            color: const Color(0xFF656F62),
            child: ListView(
              padding:EdgeInsets.all(40),
              children: [
                SizedBox(height: 80,),
                const Text(
                  'Rewards',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    height: 0,
                  ),
                ),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Container(child:Column(children: [Container(
                  width: 90,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/quick_learner_2.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                    Image.asset("assets/images/shadow.png"),
                    Text("Quick Learner", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.21,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      height: 0.09,
                    ),),

                ],
                ),
                ),
        SizedBox(width: 10),
       Container(child:Column(children: [Container(
        width: 80,
        height: 90,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/curious_explorer.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
         Image.asset("assets/images/shadow.png"),
         const Text("Curious Explorer", style: TextStyle(
           color: Colors.white,
           fontSize: 16.21,
           fontFamily: 'Inter',
           fontWeight: FontWeight.w500,
           fontStyle: FontStyle.normal,
           height: 0.09,
         ),),

      ],
      ),
      ),
                ]
                  ,),
                SizedBox(height:50 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ Container(child:Column(children: [Container(
                  width: 90,
                  height: 70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/sharp_scholar.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                    Image.asset("assets/images/shadow.png"),
                    Text("Sharp Scholar", style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.21,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      height: 0.09,
                    ),),

              ],
            ),
        ),
                    SizedBox(width: 10),
                    Container(child:Column(children: [Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/eager_student_2.png"),
          fit: BoxFit.fill,
        ),
      ),
    ), Image.asset("assets/images/shadow.png"),
                      Text("Eager Student", style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.21,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        height: 0.09,
                      ),),

    ],
    ),
    ),
                ],
                ),
                SizedBox(height:50 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ Container(child:Column(children: [Container(
                  width: 90,
                  height: 70,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/good_player_lock_green.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                    Image.asset("assets/images/shadow.png"),

              ],
            ),
        ),
                    SizedBox(width: 10),
                    Container(child:Column(children: [Container(
                  width: 90,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/king_player_lock_green.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                      Image.asset("assets/images/shadow.png"),

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