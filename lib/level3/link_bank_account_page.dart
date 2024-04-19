
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/Level3/link_bank_quiz_page.dart';
import 'package:lcc_flutter_app/common/right_ans_component.dart';
import 'package:lcc_flutter_app/level3/list_drag_component.dart';


class LinkBankAccountPage extends StatefulWidget {
  const LinkBankAccountPage({ super.key });

  @override
  State<LinkBankAccountPage> createState() => LinkBankAccountState();

}

class LinkBankAccountState extends State<LinkBankAccountPage> {
  int coinText = 0;
  double _currentSliderValue = 0;
  bool reorderSuccess = false;

  void updateParentView(String param) {
    if (param == "Reorder_Done") {
    setState(() {

      _currentSliderValue = _currentSliderValue + 5;
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (BuildContext context) {
        return  Container(
            width: double.infinity,
            height:420,
            color: Colors.transparent,
            child: RightAnswerComponent(successText: "You earned \n 20 coins", onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LinkBankQuizPage()));
            })

        );


      },
    );
    });
    }
    else {
      if (coinText < 20) {
      setState(() {
      coinText = coinText + 5;
      _currentSliderValue = _currentSliderValue + 5;
      });
      }

    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(child:
          Container(
            margin: EdgeInsets.fromLTRB(25, 10, 25, 20),
            child: Row( children:[
              Container(
                width: 70,
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
                decoration: ShapeDecoration(
                  color: Color(0xFFE9ECED),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        // color: Colors.deepOrange,
                        image: DecorationImage(
                          image: AssetImage('assets/images/coin 2.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      coinText.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 15, right: 15),

                  child:
                  LinearProgressIndicator(
                    backgroundColor: Color(0xFFE9ECED),
                    value: _currentSliderValue * 0.01,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),


                  ),

                ),
              ),

              GestureDetector(
                  child: Container(
                    width: 34.60,
                    height: 34.60,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFE9ECED),
                      shape: OvalBorder(),
                    ),
                    child: Icon( Icons.close,
                      color: Colors.grey, ),

                  ),
                  onTap: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  }
              ),
            ]
            ),
          ),
          ),
           Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Container(child: Text(
                  'Link a Bank Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    // height: 0.07,
                  ),
                ),
    ),
                SizedBox(height: 20,),
                Container(child:
                Text(
                  'You need to repay the 100 coins \n to your friend Alex.',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    // height: 0.07,
                  ),
                ),
    ),
                SizedBox(height: 60,),
                Container(child:
                Text(
                  'Drag and re-order the \n sequence',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    // height: 0.07,
                  ),
                ),
    )
              ]
          ),
          const SizedBox(height: 20,),
          Stack(
            alignment: Alignment.center,
            children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10 ),
            color: Colors.white,
            height: 350,
            child: ReorderableListComponent(methodFromParent: updateParentView),
          ),
   ] ),
        ],
      ),
    );
  }
}
//Drag and re-order the sequence