
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'image_slider_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({ super.key });

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(''),),
        backgroundColor: Color(0xFF11442B),
        body: ListView(
          //scrollDirection: Axis.vertical,
          children: <Widget>[
           //  Row(
           //    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
           //    children:<Widget> [Text(
           //    'Essential Digital Skills',
           //    style: TextStyle(
           //      color: Colors.white,
           //      fontSize: 20,
           //      fontFamily: 'Inter',
           //      fontWeight: FontWeight.w700,
           //      height: 0,
           //    ),
           //  ),
           //      Container(
           //        height: 25,
           //        width: 25,
           //        child:Image.asset("assets/images/user_profile_white.png") ,
           //      )
           //      ],
           // ),
            Container(
              height:MediaQuery.of(context).size.height,
              child: ImageSliderPage(),),
          ],
        ),

   // ),
    );
  }
}

