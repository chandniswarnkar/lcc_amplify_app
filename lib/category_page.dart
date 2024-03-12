
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

            Container(
              height:MediaQuery.of(context).size.height,
              child: ImageSliderPage(),),
          ],
        ),

   // ),
    );
  }
}

