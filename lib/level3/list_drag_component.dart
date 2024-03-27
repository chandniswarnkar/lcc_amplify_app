import 'dart:ui';

import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import '../common/items/item_title.dart';


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
  const ReorderableListComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       // appBar: AppBar(title: const Text('ReorderableListView Sample')),
        body: const ReorderableListView()
      ),
    );
  }
}

class ReorderableListView extends StatefulWidget {
  const ReorderableListView({super.key});
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
             // switch (index) {
             //   case 0:
             //     _cardColor = cardStatusMap[index] == true ? CardColor.RIGHT_ANSWER_COLOR : CardColor.DEFAULT_COLOR;
             //     break;
             //   case 1:
             //     _cardColor = CardColor.DEFAULT_COLOR;
             //     break;
             //   case 2:
             //     _cardColor = CardColor.DEFAULT_COLOR;
             //     break;
             //   case 3:
             //     _cardColor = CardColor.DEFAULT_COLOR;
             //     break;
             // }
             return ItemTile(
                 key: Key(list[index].name),
                 index: list[index].index,
                 cardTitle: list[index].name,
                 cardColor: _cardColor == CardColor.RIGHT_ANSWER_COLOR ? rightAnswerColor : _cardColor == CardColor.WRONG_ANSWER_COLOR ? wrongAnswerColor : Colors.grey

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
               print("****** new index ***** ");
               print(newIndex);

              isCorrect = list[newIndex].name == cardMapData[newIndex] ? true : false;
              print("****** display card list ***** ");
               print(list[newIndex].name);
              print("**** actual  card list ********");
              print(cardMapData[newIndex]);
             _cardColor = isCorrect ? CardColor.RIGHT_ANSWER_COLOR : CardColor.WRONG_ANSWER_COLOR;

               cardStatusMap[newIndex] = isCorrect;
                 if (  cardStatusMap[0] == true && cardStatusMap[1] == true && cardStatusMap[2] == true )  {
                   cardStatusMap[3] = true;
                 }

               print(cardStatusMap);
             });
           },


       ),
     );

  }
}
