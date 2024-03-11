import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/common/hint_component.dart';
import 'package:lcc_flutter_app/common/wrong_ans_component.dart';

import 'common/right_ans_component.dart';

class KnowYourCardPage extends StatefulWidget {
  const KnowYourCardPage({ super.key });

  @override
  State<KnowYourCardPage> createState() => _KnowYourCardPageState();
}

class _KnowYourCardPageState extends State<KnowYourCardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306),
                    //  child: RightAnswerComponent ( successText: ' You have earned 5 coins', onPressed: () {  print('ok');},),);
    child: WrongAnswerComponent( errorText: 'OOps! \n Wrong Answer',
                             onHintPressed:() {  print('ok');} ,
                             onRetryPressed:() {  print('ok');}
    )
    );
  }
}