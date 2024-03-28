import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:lcc_flutter_app/level4/transactionid_page.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  double _currentSliderValue = 80;
  String coinText = '25';
  bool isComplete = true;
  bool  isWrongCode = false;
  bool isCorrectCode = false;
  bool isVerify = false;

  List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(4, (index) => FocusNode());
    _controllers = List.generate(4, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _isAllFieldsFilled() {
    for (var controller in _controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {

      if (index < 3) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }
  }

  String getOtp() {
    String otp = '';
    for (var controller in _controllers) {
      otp += controller.text;
    }
    return otp;
  }

  void clearOtpFields() {
    for (var controller in _controllers) {
      controller.clear();
    }
  }

  Color _getBorderColor() {
    // Logic to determine border color based on conditions
    // For example, return different colors based on some condition
    if (isWrongCode) {
      return Colors.red;
    } else if (isCorrectCode) {
      return Colors.green;
    } else {
      return Colors.grey;
    }
  }

  bool isGetVerifyCode(){
    if(isVerify == true){
      if(isCorrectCode == true){
        return false;
      }
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SafeArea(
              child: Row(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 80,
                  height: 40,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 8),
                  decoration: ShapeDecoration(
                    color: Color(0xFFE9ECED),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
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
                        coinText,
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
                  child: Slider(
                    value: _currentSliderValue,
                    activeColor: Colors.green,
                    max: 100,
                    divisions: 5,
                    // label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
                Container(
                  width: 34.60,
                  height: 34.60,
                  margin: const EdgeInsets.all(10),
                  decoration: const ShapeDecoration(
                    color: Colors.grey,
                    shape: OvalBorder(),
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('X'),
                  ),
                ),
              ]),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Bank Transfer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  // height: 0.07,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible:(isVerify == true || isWrongCode == true) ? false : true,
                child: const Text(
                  'You have been sent \na verification code',
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
            ]),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Enter Verification Code',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => Container(
                    width: 70,
                    height: 80,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18),
                    clipBehavior: Clip.antiAlias,

                    decoration: BoxDecoration(
                        color: isCorrectCode == true ? const Color(0xFFD9FFDB) : Color(0xFFE9ECED),
                        border: Border.all(color: _getBorderColor()),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                   /* decoration: ShapeDecoration(
                      color: Color(0xFFE9ECED),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),*/
                    child: TextFormField(

                      cursorColor: Colors.black,
                      controller: _controllers[index],
                      focusNode: _focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      onChanged: (value) => _onChanged(value, index),
                      maxLength: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                         //border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),

                        //SoftKeyboard done click
                        onEditingComplete: (){
                          setState(() {
                            _focusNodes[index].unfocus();
                            if (_isAllFieldsFilled()) {
                              isVerify = true;
                              isComplete = false;

                            } else {
                              isVerify = false;
                            }

                          });
                        },

                      enabled: isWrongCode == true || isVerify == true? false : true,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: isWrongCode == true || isCorrectCode == true ? false : true,
                child: VerificationCodeCard(context)),

            Visibility(
              visible:  isWrongCode == true ? true : false,
              child: Text('You have enter the wrong code.\nPlease try again',
                 textAlign: TextAlign.center,
                   style: TextStyle(
                   color: Color(0xFFDF2525),
                    fontSize: 16,
                   fontFamily: 'Inter',
                   fontWeight: FontWeight.w400,
                   ),

              ),
            ),
            const SizedBox(
              height: 50,
            ),

            Visibility(
                visible:isGetVerifyCode(),
                child: VerifyCodeButton(context)),

            Visibility(
              visible: isWrongCode,
                child: ResendCodeButton(context)),
          ],
        ),
        bottomNavigationBar:   CompleteButton(context),
    );
  }


  Widget CompleteButton(BuildContext context) {
    return Visibility(
      visible: isComplete,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.fromLTRB(50, 0, 50, 30),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                setState(() {

                    if (_isAllFieldsFilled()) {
                      isVerify = true;
                      isComplete = false;

                    } else {
                      isVerify = false;
                    }

                });
              },
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  // height: 0.07,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget VerifyCodeButton(BuildContext context,) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 30),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              setState(() {

                if('3920' == getOtp()){
                  isCorrectCode = true;
                  _currentSliderValue = 90;
                  coinText = '30';

                  Timer(const Duration(seconds: 1), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  TransactionIdPage(),
                      ),
                    );
                  });
                }else{
                  isVerify = false;
                  isWrongCode = true;
                }

              });
            },
            child: Text(
              'Verify Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                // height: 0.07,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ResendCodeButton(BuildContext context,) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 30),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              backgroundColor: Colors.black,
            ),
            onPressed: () {
              setState(() {
                clearOtpFields();
                isWrongCode = false;
                isVerify = false;
                isComplete = true;

              });
            },
            child: Text(
              'Resend Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                // height: 0.07,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget VerificationCodeCard(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFD2EAFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              children: [
                Text(
                  'Verification Code ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '3920 ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 46,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: isVerify == true ? false : true,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Verification code is to verify your \nidentity and to provide secure \naccess to your accounts or \nservices ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
