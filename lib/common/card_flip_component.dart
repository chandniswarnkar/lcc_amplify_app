import 'dart:async';

import 'package:flippy/flippy.dart';
import 'package:flutter/material.dart';

class FlipCardComponent extends StatelessWidget//State<FlipCardComponent>
{
 late Widget? frontWidget;
 late Widget? backWidget;
  bool isTappingRequired = false;

  FlipCardComponent({super.key,required this.isTappingRequired, this.frontWidget,  this.backWidget});

  late FlipperController controller  = FlipperController(
  dragAxis: DragAxis.horizontal,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body:
        DragFlipper(
              front: isTappingRequired ? frontWidget! :  const FrontWidget(),
              back: isTappingRequired ? backWidget! : const BackWidget(),
              controller: controller,
             borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              backgroundColor: Colors.white,
            ),
    );
  }
}



class FrontWidget extends StatelessWidget {
  const FrontWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blue_card_front.png"),
           // fit: BoxFit.cover,
          )

      ),
    );
  }
}

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blue_card_back.png"),
           // fit: BoxFit.cover,
          )
      ),
    );

  }
}

