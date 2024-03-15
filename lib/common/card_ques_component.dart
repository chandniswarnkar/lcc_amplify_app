

import 'package:flutter/material.dart';
class CardQuestionComponent extends StatelessWidget {

  final String questionNumber;
  final String questionDescription;
  final Color bgColor;
  final bool showCompletedStatus;


  const CardQuestionComponent({super.key,  required this.questionNumber, required this.questionDescription, required this.bgColor, required this.showCompletedStatus});

  @override
  Widget build(BuildContext context) {
    bool  isCorrectOptionSelected = false;
    return Column(
      children: [
        Container(
          height: 230,

          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          decoration: ShapeDecoration(
            color: bgColor, //bgColor
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Challenge',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),

                    SizedBox(
                      width: 60,
                      height: 20,
                      child: Text(
                        questionNumber,
                        textAlign: TextAlign.left,
                        style:  const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      // width: 267,
                      child: Text(
                        questionDescription,
                        textAlign: TextAlign.left,
                        style:  const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      //  width: 279,
                      height: 50,
                      child: showCompletedStatus == false ? const Text(
                        'Use your finger to drag and explore your card around.',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      )  : const Text(
                        'Completed',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}