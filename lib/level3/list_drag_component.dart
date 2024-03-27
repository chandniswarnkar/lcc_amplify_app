import 'dart:ui';

import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import '../common/items/item_title.dart';
import 'link_bank_account_page.dart';


enum CardColor {
   RIGHT_ANSWER_COLOR,
  DEFAULT_COLOR,
  WRONG_ANSWER_COLOR,

}

class CardItem {
  final String name;
  final int index;

  CardItem({required this.name, required this.index});
}



class ReorderableListComponent extends StatelessWidget {
  //const ReorderableListComponent({super.key});
  const ReorderableListComponent({super.key, this.methodFromParent});
  final Function(String val)? methodFromParent;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       // appBar: AppBar(title: const Text('ReorderableListView Sample')),
        body:  ReorderableListView(methodFromParent: methodFromParent)
      ),
    );
  }
}

class ReorderableListView extends StatefulWidget {
  const ReorderableListView({super.key, this.methodFromParent});
  final Function(String val)? methodFromParent;
  @override
  State<ReorderableListView> createState() => _ReorderableListViewState();



}

class _ReorderableListViewState extends State<ReorderableListView> {

   Map<int,String> cardMapData = {0: "Get account details of Alex", 1: "Open your banking app", 2: "Add account details of Alex", 3: "Tap on 'Link Bank account'"};
   List<String> cardTextList = [ "Add account details of Alex",
                                 "Get account details of Alex",
                                 "Tap on 'Link Bank account'",
                                  "Open your banking app"];
   Map<int,bool> cardStatusMap = {0: false, 1: false, 2: false, 3: false};
  late List<CardItem> list =
   List.generate(4, (index) => CardItem( index: index, name: cardTextList[index]));
  bool isCorrect = false;
   CardColor _cardColor = CardColor.DEFAULT_COLOR;

   List<AnimationEffect> animations = [];
   @override
  Widget build(BuildContext context) {

     Color wrongAnswerColor = Colors.red;
     Color rightAnswerColor = Colors.green;

     return  Container(height: 320,
       padding: const EdgeInsets.all(8),
       child: AnimatedReorderableListView(
           items: list,
           itemBuilder: (BuildContext context, int index) {

             _cardColor = cardStatusMap[index] == true ? CardColor.RIGHT_ANSWER_COLOR : CardColor.DEFAULT_COLOR;

             return ItemTile(
                 key: Key(list[index].name),
                 index: list[index].index,
                 cardTitle: list[index].name,
                 cardColor: _cardColor == CardColor.RIGHT_ANSWER_COLOR ? rightAnswerColor : _cardColor == CardColor.WRONG_ANSWER_COLOR ? wrongAnswerColor : Color(0xFFE9ECED),

              );
           },
           enterTransition: [FadeIn(), ScaleIn()],
         //  exitTransition: [SlideIn()],
           insertDuration: const Duration(milliseconds: 300),
           removeDuration: const Duration(milliseconds: 300),
           onReorder: (int oldIndex, int newIndex) {
             setState(() {
               final CardItem cardItem = list.removeAt(oldIndex);
               list.insert(newIndex, cardItem);

               print(newIndex);

              isCorrect = list[newIndex].name == cardMapData[newIndex] ? true : false;

             _cardColor = isCorrect ? CardColor.RIGHT_ANSWER_COLOR : CardColor.WRONG_ANSWER_COLOR;

               cardStatusMap[newIndex] = isCorrect;
                 if (  cardStatusMap[0] == true && cardStatusMap[1] == true && cardStatusMap[2] == true )  {
                   cardStatusMap[3] = true;
                   widget.methodFromParent?.call("Reorder Done");
                 }

               print(cardStatusMap);
             });
           },


       ),
     );

  }
}

