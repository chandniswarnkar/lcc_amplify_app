import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lcc_flutter_app/level3/link_bank_account_page.dart';


class StartLevel3Page extends StatefulWidget {
  const StartLevel3Page({ super.key });

  @override
  State<StartLevel3Page> createState() => StartLevel3PageState();
}

class StartLevel3PageState extends State<StartLevel3Page> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306),
    child: Row(

      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(

          onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) => LinkBankAccountPage(),
              ),
            );

          },
          child: const Text('Start', style:TextStyle(
            color: Colors.white ,
            fontSize:28,
            fontFamily: 'Inter',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            // height: 0.07,
          ),
          ),
        ),
      ],
    ),);
  }
}