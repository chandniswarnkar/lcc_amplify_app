import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/category_page.dart';
import 'package:lcc_flutter_app/learning_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lcc_flutter_app/level3/start_level3_page.dart';
import 'package:lcc_flutter_app/level4/start_level4_page.dart';
import 'package:lcc_flutter_app/practice_page.dart';
import 'package:lcc_flutter_app/rewards_page.dart';
import 'package:lcc_flutter_app/start_level2_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const LCCHomePage());

}


class LCCHomePage extends StatelessWidget {
  const LCCHomePage({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
        debugShowCheckedModeBanner:false,
      home: AnimatedSplashScreen(
       // splash: Image.asset('assets/images/Splash_screen_Image_2x.gif'),
        splash:Container(
          width: MediaQuery.of(context).size.width,
        //  height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/Splash_screen_Image_2x.gif',
            fit: BoxFit.cover,
          ),
        ),
        splashIconSize: MediaQuery.of(context).size.height,
        nextScreen: MyHomePage(title: 'LCC'),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );


  }




}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 String currentLevelValue = "Level_0";
  @override
  void initState() {
    super.initState();
    hideScreen();
    WidgetsFlutterBinding.ensureInitialized();
    getCurrentLevel();

  }


  getCurrentLevel() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    currentLevelValue = prefs.getString('currentLevel') ?? "Level_0";

    print("currentLevelValue: $currentLevelValue");

  }


  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 1800), () {
    //  FlutterSplashScreen.hide();
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LCCLearningPage(),
    RewardsPage(),
    PracticePage()
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOptions[_selectedIndex],

      bottomNavigationBar:Row(
        children: [
          GestureDetector( onTap: () {
            setState(() {
              _selectedIndex = 0;
            });

          },
            child:
          Container(
            width: MediaQuery.of(context).size.width/3,
            height: 85,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            decoration: _selectedIndex == 0 ? BoxDecoration(color: Colors.black) : BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child:  _selectedIndex == 0 ? Image.asset("assets/images/Learn_icon_White.png") : Image.asset("assets/images/Learn_icon_Black.png"),

                ),
                Text(
                  'Learn',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _selectedIndex == 0 ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
    ),
          GestureDetector( onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
            child:
          Container(
            width: MediaQuery.of(context).size.width/3,
            height: 85,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            decoration: _selectedIndex == 1 ? BoxDecoration(color: Colors.black) : BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal:2, vertical: 2),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 35.0,
                        height: 35.0,
                        child: _selectedIndex == 1 ? Image.asset("assets/images/Reward_Icon_white.png") : Image.asset("assets/images/Reward_Icon_black.png"
                      ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Rewards',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _selectedIndex == 1 ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          ),
          GestureDetector( onTap: () {
            setState(() {
              _selectedIndex = 2;
            });
        },
            child:
          Container(
            width: MediaQuery.of(context).size.width/3,
            height: 85,
            padding: const EdgeInsets.symmetric(horizontal: 26),
            decoration: _selectedIndex == 2 ? BoxDecoration(color: Colors.black) : BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(2),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        child: _selectedIndex == 2 ? Image.asset("assets/images/Practice_Icon_white.png") : Image.asset("assets/images/Practice_Icon_black.png"),

                      ),
                    ],
                  ),
                ),
                Text(
                  'Practice',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _selectedIndex == 2 ?Colors.white : Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
    ),
        ],
      )
    );
  }
}
