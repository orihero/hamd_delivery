import 'dart:async';

import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/auth/widgets/pincode_textField.dart';
import 'package:HAMD_Delivery/ui/main-orders/main-orders.dart';
import 'package:HAMD_Delivery/ui/map/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

class SmsScreen extends StatefulWidget {
  @override
  _SmsScreenState createState() => _SmsScreenState();
}

class _SmsScreenState extends State<SmsScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  String currentText = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // final formKey = GlobalKey<FormState>();
  StreamController<ErrorAnimationType> errorController;
  Timer _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  _showSnackBar(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: ColorPalatte.mainPageColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              height: 320,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 0, right: 0, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Container(
                      width: 77,
                      height: 77,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: SvgPicture.asset('assets/icons/check.svg'),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Спасибо!',
                        style: FontStyles.boldStyle(
                          fontSize: 22,
                          fontFamily: 'Ubuntu',
                          color: Color(0xff232323),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Вы успешно авторизовались в системе доставки продукции лучшего фастфуда Самарканда!',
                        style: FontStyles.regularStyle(
                          fontSize: 16,
                          fontFamily: 'Ubuntu',
                          color: Color(0xff646974),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 54,
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 0,
                        color: ColorPalatte.strongRedColor,
                        onPressed: () => Get.to(MainOrders()),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'ОК',
                          style: FontStyles.boldStyle(
                              fontSize: 16,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Color(0xff9F111B),
              ),
              child: Padding(
                padding: const EdgeInsets.all(80),
                child: Image.asset(
                  'assets/images/logo-back.png',
                ),
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 4,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(61),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Вы новый пользователь?',
                          style: FontStyles.semiBoldStyle(
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                            color: Color(0xff232323),
                          ),
                        ),
                        Text(
                          'Введите код высланный вам по смс для подтвержедния',
                          style: FontStyles.boldStyle(
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                            color: Color(0xff232323),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 15),
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: TextStyle(
                          // color: Colors.green.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 4,
                        obscureText: false,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          // if (v.length < 3) {
                          //   return "I'm from validator";
                          // } else {
                          //   return null;
                          // }
                        },
                        pinTheme: PinTheme(
                          activeColor: Colors.white,
                          selectedColor: Colors.white,
                          inactiveColor: Colors.white,
                          activeFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 75,
                          // activeFillColor:
                          //     hasError ? Colors.white : Colors.white,
                        ),
                        cursorColor: Colors.black,
                        animationDuration: Duration(milliseconds: 300),
                        backgroundColor: Colors.grey.shade100,
                        enableActiveFill: true,
                        errorAnimationController: errorController,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: [
                          // BoxShadow(
                          //   offset: Offset(0, 1),
                          //   color: Colors.black12,
                          //   blurRadius: 10,
                          // )
                        ],
                        onCompleted: (v) {
                          print("Completed");
                        },
                        // onTap: () {
                        //   print("Pressed");
                        // },
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            currentText = value;
                          });
                        },
                        beforeTextPaste: (text) {
                          print("Allowing to paste $text");
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .07),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                    ),
                    child: Center(
                        child: Text('Запросить новый код через $_start сек')),
                    // child:
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .07),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      child: RaisedButton(
                        elevation: 0,
                        color: ColorPalatte.strongRedColor,
                        onPressed: () {
                          if (_start == 0) {
                            setState(() {
                              _start = 30;
                            });
                            startTimer();
                          } else {
                            _showSnackBar(context);
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          _start == 0 ? "ОТПРАВИТЬ КОД" : 'ЗАРЕГИСТРИРОВАТЬСЯ',
                          style: FontStyles.boldStyle(
                              fontSize: 16,
                              fontFamily: 'Ubuntu',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
