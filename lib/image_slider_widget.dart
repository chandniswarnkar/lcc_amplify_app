
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/expertise_page.dart';


const images = <String>[
  'assets/images/category1.png',
  'assets/images/category2.png',
  'assets/images/category3.png',
];

final List<Widget> imageSliders = images
    .map((item) => Container(
  child: Container(
    margin: EdgeInsets.all(3.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.asset(item, fit: BoxFit.cover, width: 1000.0),

            Visibility(visible: item != "assets/images/category1.png",

              child:
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                    child: Image.asset("assets/images/Lock_new.png",  fit: BoxFit.fill,
                      height: 95,
                      width: 95,

                    )
                ),
              ),
            ),
          ],
        )),
  ),
))
    .toList();

class ImageSliderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageSliderPageState();
  }
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  int _current = 0;
  String textLabel = 'Transacting';
  String descriptionLabel = 'Register, transact, and manage \nonline transactions effortlessly';
  String  skillsLabel = '04';
  String coinsLabel = '1000';
  String badgesLabel = '10';
  Color viewBGColor = Color(0xFF11442B);
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      backgroundColor: viewBGColor,//const Color.fromARGB(255, 18, 32, 47),
      body: Column(
          children: [
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children:<Widget> [Text(
                'Essential Digital Skills',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  height: 0,
                ),
              ),
                SizedBox(height: 10,),
                Container(
                  height: 30,
                  width: 30,
                  child:Image.asset("assets/images/user_profile_white.png") ,
                )
              ],
            ),
            SizedBox(height: 30,),
        Container(
            width: MediaQuery.of(context).size.width ,
            height: 320,
            child:CarouselSlider(
            items: imageSliders,
           // carouselController: _controller,
            options: CarouselOptions(

                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                    textLabel = _current == 0 ? "Transacting" : (_current == 1 ? "Communicating" : "Handling Content") ;
                    descriptionLabel = _current == 0 ? "Register, transact, and manage \nonline transactions effortlessly" : (_current == 1 ? "Communication, Collaborate & Share" : "Secure find, manage & store digital content") ;
                    skillsLabel = _current == 0 ? "06" : (_current == 1 ? "08" : "09") ;
                    coinsLabel = _current == 0 ? "1000" : (_current == 1 ? "500" : "800") ;
                    badgesLabel = _current == 0 ? "10" : (_current == 1 ? "12" : "17") ;
                    viewBGColor  = _current == 0 ? const Color(0xFF11442B) : (_current == 1 ? const Color(0xFF1C2D45) : const Color(0xFF542920)) ;
                   print(_current);
                  });
                }),
          ),
    ),
            SizedBox(height: 30,),
             Text(
              textLabel,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(height: 10,),
             Container(height: 60,
               child:
             Text(
               descriptionLabel,
              textAlign: TextAlign.center,
              //overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,


              ),
            ),
    ),

                SizedBox(height: 25,),
                Row( mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: <Widget>[Column(
                 // scrollDirection: Axis.vertical,
                  children:  [
                  Opacity(
                    opacity: 0.60,
                    child: const Text(
                    'Skills',
                    style: TextStyle(color: Colors.white, fontSize: 16.0,fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,fontStyle: FontStyle.normal),
                                    ),
                  ),
                  Text(
                  skillsLabel,
                  style: TextStyle(color: Colors.white, fontSize: 24.0,fontFamily: 'Inter',
                    fontWeight: FontWeight.w600, fontStyle: FontStyle.normal,),
               ),
               ],
                ),
                    Container(height: 50, child: VerticalDivider(color: Colors.white,thickness: 0.5,)),
                  Column(
                  //  scrollDirection: Axis.vertical,
                    children: [
                    Opacity(
                      opacity: 0.60,
                      child: const Text(
                        'Coins',
                        style: TextStyle(color: Colors.white, fontSize: 16.0,fontFamily: 'Inter',
                            fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    ),
                    Text(
                      coinsLabel,
                      style: TextStyle(color: Colors.white,fontSize: 24.0,fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,fontStyle: FontStyle.normal),
                    ),
                  ],
                  ),
                    Container(height: 50, child: VerticalDivider(color: Colors.white,thickness: 0.5,)),
                  Column(
                  //  scrollDirection: Axis.vertical,
                    children: [
                    Opacity(
                      opacity: 0.60,
                      child: const Text(
                        'Badges',
                        style: TextStyle(color: Colors.white, fontSize: 16.0,fontFamily: 'Inter',
                            fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    ),
                    Text(
                     badgesLabel,
                      style: TextStyle(color: Colors.white, fontSize: 24.0,fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,fontStyle: FontStyle.normal),
                    ),
                  ],
                  ),
                  ],
                ),
                SizedBox(height: 40,),
             Container(
              width: 220,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: ShapeDecoration(
                color:  _current ==0 ? Colors.white : Color.fromRGBO(255, 255, 255, 0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    child: _current ==0 ?   Text(
                      "Start Playing",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal

                      ),
                    ) : Text(
                      "Coming Soon",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal

                      ),
                    ),
                    onPressed: _current ==0 ? () {
                      showModalBottomSheet(

                      context: context,
                      backgroundColor: Colors.transparent,
                          barrierColor: Colors.white.withOpacity(0),

                       isScrollControlled: true,

                         builder: (context)
                      {
                        return Container( height: MediaQuery.of(context).size.height * 0.75,
                          decoration: new BoxDecoration(
                            color:Color(0xFFCAE1D6) ,
                            borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(25.0),
                              topRight: const Radius.circular(25.0),
                            ),
                          ),

                          child: ExpertisePage(),); //ExpertisePage();
                      }
                      );

                    } : null,

                  ),
                ],
              ),
            ),

      ]),
    );
  }
}