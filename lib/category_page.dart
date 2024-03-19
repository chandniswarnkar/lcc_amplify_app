
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
      //appBar: AppBar(title: Text(''),),
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
      bottomNavigationBar: Row(
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
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )

      // ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

}