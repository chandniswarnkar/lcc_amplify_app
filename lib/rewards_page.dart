import 'package:flutter/material.dart';
import 'dart:async';
class RewardsPage extends StatefulWidget {
  const RewardsPage({ super.key });

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      Navigator.push(
          context,
          MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return RewardsIcons();
            },
            fullscreenDialog: true,
          ));
    });

    return Scaffold(

      body: Container(
          color: const Color(0xFF530C17)
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
            color: const Color(0xFF9F4A4A),
            child: ListView(
              padding:EdgeInsets.all(40),
              children: [
                SizedBox(height: 80,),
                Text(
                  'Rewards',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 0.09,
                  ),
                ),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Container(child:Column(children: [Container(
                  width: 90,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/quick_learner.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                    Image.asset("assets/images/shadow.png"),
                    Text("Quick Learner"),
                  Text("09.09.23")
                ],
                ),
                ),
        SizedBox(width: 10),
       Container(child:Column(children: [Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/curious_explorer.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
         Image.asset("assets/images/shadow.png"),
         const Text("Curious Explorer"),
        const Text("09.09.23")
      ],
      ),
      ),
                ]
                  ,),
                SizedBox(height:50 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ Container(child:Column(children: [Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/sharp_scholar.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                    Image.asset("assets/images/shadow.png"),
                    Text("Sharp Scholar"),
                Text("09.09.23")
              ],
            ),
        ),
                    SizedBox(width: 10),
                    Container(child:Column(children: [Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/eager_student.png"),
          fit: BoxFit.fill,
        ),
      ),
    ), Image.asset("assets/images/shadow.png"),
                      Text("Eager Student"),
      Text("09.09.23")
    ],
    ),
    ),
                ],
                ),
                SizedBox(height:50 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [ Container(child:Column(children: [Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/good_player_lock.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                    Image.asset("assets/images/shadow.png"),
                //     Text("Curious Explorer"),
                // Text("09.09.23")
              ],
            ),
        ),
                    SizedBox(width: 10),
                    Container(child:Column(children: [Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/king_player_lock.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                      Image.asset("assets/images/shadow.png"),
                  //     Text("Curious Explorer"),
                  // Text("09.09.23")
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