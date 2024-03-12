
import 'package:flutter/material.dart';


class CardHomePage extends StatefulWidget {
  const CardHomePage({ super.key });

  @override
  State<CardHomePage> createState() => _CardHomePageState();
}

class _CardHomePageState extends State<CardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306)
                      // child: Column(children: [
                      // Row(children: [Text('Know your\n Credit/Debit Card')]),
                      //  Row(children:[FlipCardComponent(isTappingRequired: true)]),
                      //  Row(children: [Text('Know your\n Credit/Debit Card'])),
                      //  Row(Row children: [Button()],)
    //  ],
    );
  }
}