
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lcc_flutter_app/practice_page.dart';
import 'package:lcc_flutter_app/rewards_page.dart';
import 'image_slider_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({ super.key });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      backgroundColor: Color(0xFF11442B),
      body: _selectedIndex == 1 ? RewardsPage() : _selectedIndex == 2 ? PracticePage() :

      ListView(
        //scrollDirection: Axis.vertical,
        children:

        <Widget>[

          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child: ImageSliderPage(),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 30),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.book),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: 'Rewards',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_outlined),
            label: 'Practice',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Colors.blue,
        showSelectedLabels: true,

        onTap: _onItemTapped,
      ),

      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}