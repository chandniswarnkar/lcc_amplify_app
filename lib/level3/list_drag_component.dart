import 'dart:ui';

import 'package:animated_reorderable_list/animated_reorderable_list.dart';
import 'package:flutter/material.dart';
import '../common/items/item_title.dart';

/// Flutter code sample for [ReorderableListView].

void main() => runApp(const ReorderableApp());


class CardItem {
  final String cardTitle;
  final int index;

  CardItem({required this.cardTitle, required this.index});
}

class User {
  final String name;
  final int index;

  User({required this.name, required this.index});
}


class ReorderableApp extends StatelessWidget {
  const ReorderableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(title: const Text('ReorderableListView Sample')),
        body: const ReorderableExample(),
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({super.key});
  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {

   Map<int,String> cardMapData = {0: 'Get account details of Alex', 1: 'Open your banking app', 2: 'Add account details of Alex', 3: "Tap on 'Link Bank account'"};
   List<String> cardTextList = [ 'Add account details of Alex',
                                 'Get account details of Alex',
                                   'Tap on Link Bank account',
                                    'Open your banking app'];

  late List<User> list =
   List.generate(4, (index) => User( index: index, name: cardTextList[index]));
  bool isCorrect = false;
   List<AnimationEffect> animations = [];
   @override
  Widget build(BuildContext context) {

    // Color defaultColor = Colors.grey.shade200;
     Color wrongAnswerColor = Colors.red;
     Color rightAnswerColor = Colors.green;

     return  Container(height: 320,
       padding: const EdgeInsets.all(8),
       child: AnimatedReorderableListView(
           items: list,
           itemBuilder: (BuildContext context, int index) {
             return ItemTile(
                 key: Key(list[index].name),
                 index: list[index].index,
                 cardTitle: list[index].name,
                 cardColor: isCorrect ? rightAnswerColor : wrongAnswerColor)

             ;
           },
           enterTransition: [FadeIn(), ScaleIn()],
         //  exitTransition: [SlideIn()],
           insertDuration: const Duration(milliseconds: 300),
           removeDuration: const Duration(milliseconds: 300),
           onReorder: (int oldIndex, int newIndex) {
             setState(() {
               final User user = list.removeAt(oldIndex);
               list.insert(newIndex, user);
               isCorrect = newIndex == cardMapData.keys.toList()[newIndex];
               print(list[newIndex].name);
             });
           },
        //   proxyDecorator: proxyDecorator

         /*  A custom builder that is for inserting items with animations.

                              insertItemBuilder: (Widget child, Animation<double> animation){
                                 return ScaleTransition(
                                       scale: animation,
                                       child: child,
                                     );
                                    },


                      */
         /*  A custom builder that is for removing items with animations.

                                  removeItemBuilder: (Widget child, Animation<double> animation){
                                     return ScaleTransition(
                                       scale: animation,
                                       child: child,
                                     );
                                    },
                      */
       ),
     );

  }
}

