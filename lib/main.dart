import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/category_page.dart';
import 'package:lcc_flutter_app/learning_page.dart';
import 'package:flutter_splash_screen/flutter_splash_screen.dart';
import 'package:lcc_flutter_app/practice_page.dart';
import 'package:lcc_flutter_app/rewards_page.dart';


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
      home: const MyHomePage(title: 'LCC',)
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

  @override
  void initState() {
    super.initState();
    hideScreen();
  }

  ///hide your splash screen
  Future<void> hideScreen() async {
    Future.delayed(Duration(milliseconds: 1800), () {
      FlutterSplashScreen.hide();
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   // TRY THIS: Try changing the color here to a specific color (to
      //   // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
      //   // change color while the other colors stay the same.
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body://_widgetOptions [_selectedIndex],
      Navigator(
        onGenerateRoute: (settings) {
          Widget page = LCCLearningPage();
          if (settings.name == 'categoryPage') page = CategoryPage();
          return MaterialPageRoute(builder: (_) => page);
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(Icons.book),
    label: 'Learn',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.circle),
    label: 'Rewards',
    ),
    BottomNavigationBarItem(
    icon: Icon(Icons.book),
    label: 'Practice',
    ),
    ],
    currentIndex: _selectedIndex,
    selectedItemColor: Colors.amber[800],
    onTap: _onItemTapped,
    ),
    );
  }
}
