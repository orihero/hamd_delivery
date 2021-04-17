import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/services/sign_in.dart';
import 'package:HAMD_Delivery/ui/auth/sms_screen.dart';
import 'package:HAMD_Delivery/ui/masks/masks.dart';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController smsController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void validateAndSave() async {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      Get.to(SmsScreen());
      print('Form is valid');
      Get.dialog(
        Scaffold(
          backgroundColor: Colors.black.withOpacity(.1),
          body: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              color: Colors.white,
              width: double.infinity,
              height: 100.0,
              child: Row(
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        ColorPalatte.strongRedColor),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'пожалуйста, подождите',
                    style: FontStyles.lightStyle(
                      fontSize: 19,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      SignIn.signInUser(userNumber: smsController.text);
    } else {
      print('Form is invalid');
    }
  }

  _showSnackBar(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              height: 200,
              width: MediaQuery.of(context).size.width * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 8, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Подтверждение!',
                      style: FontStyles.boldStyle(
                        fontSize: 22,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff232323),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'Мы отправим вам проверочный код на номер ',
                          style: FontStyles.regularStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            color: Color(0xff646974),
                          ),
                          children: [
                            TextSpan(
                              text: '+998 90 585 85 65',
                              style: FontStyles.boldStyle(
                                  fontSize: 20,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff232323)),
                            )
                          ]),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .33,
                          height: 50,
                          child: RaisedButton(
                            elevation: 0,
                            color: Colors.white,
                            onPressed: () => Get.back(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Отмена',
                              style: FontStyles.semiBoldStyle(
                                  fontSize: 14,
                                  fontFamily: 'Ubuntu',
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .33,
                          height: 50,
                          child: RaisedButton(
                            elevation: 0,
                            color: ColorPalatte.strongRedColor,
                            onPressed: () => Get.to(SmsScreen()),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              'Отправить',
                              style: FontStyles.semiBoldStyle(
                                  fontSize: 14,
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    String _phoneNumber;
    var controllerNumber =
        MaskedTextController(mask: '000 00 000 00 00', text: '+998 ');
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorPalatte.mainPageColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                // height: 330,
                height: MediaQuery.of(context).size.height * .35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: ColorPalatte.strongRedColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .12,
                    vertical: MediaQuery.of(context).size.height * .12,
                  ),
                  child: Image.asset(
                    'assets/images/logo-back.png',
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(61),
                    child: Text(
                        'Для начала работы, Вам необходимо авторизоваться в нашей системе',
                        style: FontStyles.boldStyle(
                          fontSize: 14,
                          fontFamily: 'Ubuntu',
                          color: Color(0xff232323),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(15)),
                      height: 55.0,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.phone_android,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                                inputFormatters: [InputMask.maskPhoneNumber],
                                controller: smsController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15.0),
                                  hintText: 'Введите свой номер телефона',
                                  hintStyle: FontStyles.regularStyle(
                                      fontSize: 12,
                                      fontFamily: 'Ubuntu',
                                      color: Color(0xff9E9E9E)),
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "поле не может быть пустым";
                                  } else if (value.length < 17) {
                                    return 'поле не может быть меньше 12 цифр';
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .07),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: RichText(
                      text: TextSpan(
                          text: 'Авторизовываясь, вы соглашаетесь с нашими ',
                          style: FontStyles.regularStyle(
                              fontSize: 13,
                              fontFamily: 'Ubuntu',
                              color: Color(0xff858585)),
                          children: [
                            TextSpan(
                              text: 'правилами сервиса и Публичной афертой',
                              style: FontStyles.boldStyle(
                                  fontSize: 12,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff858585)),
                            )
                          ]),
                    ),
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
                        onPressed: validateAndSave,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          'ЗАРЕГИСТРИРОВАТЬСЯ',
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
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
