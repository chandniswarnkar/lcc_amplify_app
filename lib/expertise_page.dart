import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/start_level_page.dart';

class ExpertisePage extends StatefulWidget {
  const ExpertisePage({ super.key });

  @override
  State<ExpertisePage> createState() => _ExpertisePageState();
}

class _ExpertisePageState extends State<ExpertisePage> {
  bool isRowOneTapped = false;
  bool isRowTwoTapped = false;
  bool isRowThreeTapped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
   //   color:Color(0xFFCAE1D6) ,

    child:

   // QuestionsPage(),
    ListView(

      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0xFFCAE1D6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
              //  height: 10,//margin:const EdgeInsets.symmetric(horizontal: 20),
                child:
                const Text('How much \ndo you know about \nTransacting?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    // height: 0,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                // height: 356,
                child: Column(
                  children: [  //Row 1
                    //Row 2
                    GestureDetector(
                      onTap: () {


                        setState(() {
                          isRowOneTapped = true;
                          isRowTwoTapped = false;
                          isRowThreeTapped = false;
                        });
                      },
                      child:
                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 30,  vertical: 8),
                        height: 90,
                        padding: const EdgeInsets.all(15),
                        decoration: ShapeDecoration(
                          color: isRowOneTapped ? Colors.black : Color(0xFFCAE1D6) ,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(4),

                          ),
                        ),

                        child: Row(
                          children: [
                            Container(

                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 33,
                                    height: 33,
                                    //
                                    decoration: ShapeDecoration(
                                      color: isRowOneTapped ? Colors.white : Color(0xFFCAE1D6) ,
                                      shape: OvalBorder(side: BorderSide(width: 1)),
                                    ),

                                  ),
                                  
                                  Visibility(
                                    visible: isRowOneTapped,
                                    child: Icon( Icons.check,
                                      color: Colors.black, ),
                                  ),
                                ],
                              ),

                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'I have never done any  online transactions',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: isRowOneTapped ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  //  height: 0.07,
                                ),
                              ),

                            ),
                            //  ),
                          ],
                        ),
                      ),
                    ),
                    //Row 2
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isRowOneTapped = false;
                      isRowTwoTapped = true;
                      isRowThreeTapped = false;
                    });
                  },
                   child:
                    Container(
                      margin:const EdgeInsets.symmetric(horizontal: 30,  vertical: 8),
                      height: 90,
                      padding: const EdgeInsets.all(15),
                      decoration: ShapeDecoration(
                      color: isRowTwoTapped ? Colors.black : Color(0xFFCAE1D6) ,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(4),

                        ),
                      ),

                      child: Row(
                        children: [
                          Container(

                            child: Stack(
                              alignment: Alignment.center,

                              children: [
                                Container(
                                  width: 33,
                                  height: 33,
                                 //
                                  decoration: ShapeDecoration(
                                      color: isRowTwoTapped ? Colors.white : Color(0xFFCAE1D6) ,
                                    shape: OvalBorder(side: BorderSide(width: 1)),
                                  ),

                                ),
                                Visibility(
                                  visible: isRowTwoTapped,
                                  child: Icon( Icons.check,
                                    color: Colors.black, ),
                                ),

                              ],
                            ),

                          ),
                          const SizedBox(width: 10),
                           Expanded(
                              child: Text(
                                'I know little about online transaction',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: isRowTwoTapped ? Colors.white : Colors.black,
                                  fontSize: 20,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  //  height: 0.07,
                                ),
                              ),

                            ),
                        //  ),
                        ],
                      ),
                    ),
    ),
                    //Row 3
                  GestureDetector(
                    onTap: () {

                      setState(() {
                        isRowOneTapped = false;
                        isRowTwoTapped = false;
                        isRowThreeTapped = true;
                      });
                    },
                    child:
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30,  vertical: 8),
                      height: 117,
                      padding: const EdgeInsets.all(15),
                      decoration: ShapeDecoration(
                        color: isRowThreeTapped ? Colors.black : Color(0xFFCAE1D6) ,

                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(

                        children: [
                          Container(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 33,
                                  height: 33,
                                  decoration: ShapeDecoration(
                                    color: isRowThreeTapped ? Colors.white : Color(0xFFCAE1D6) ,
                                    shape: OvalBorder(side: BorderSide(width: 1)),
                                  ),
                                ),
                                Visibility(
                                  visible: isRowThreeTapped,
                                  child: Icon( Icons.check,
                                    color: Colors.black, ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'I have done some online transactions but wish to \nlearn more',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: isRowThreeTapped ? Colors.white : Colors.black,
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                // height: 0.07,
                              ),
                            ),

                          ),
                        ],
                      ),
                    ),
    ),

                  ],
                ),
              ),
              SizedBox(
                height: 30,),
              Visibility(visible: isRowOneTapped || isRowTwoTapped || isRowThreeTapped,
                child:
              Container(

                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                margin: const EdgeInsets.symmetric(horizontal: 85,  vertical: 10),
                decoration: ShapeDecoration(
                  color:   Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),

                child: Row(

                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [ Center(child:
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => const StartLevelPage(),
                          ),
                        );

                      },
                      child: const Text('Continue', style:TextStyle(
                        color: Colors.white ,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        // height: 0.07,
                      ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
                    ),
            ],
          ),
        ),
      ],
    ),

    );

  }
}

