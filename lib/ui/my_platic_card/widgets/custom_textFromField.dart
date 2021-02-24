import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CustomTextFromFiled extends StatelessWidget {
  final String hintText;
  String value;
  TextInputType textInputType;
  MaskedTextController myController;
  CustomTextFromFiled({this.hintText, this.myController, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Color(0xff646974),
          )),
      child: TextFormField(
        controller: myController,
        keyboardType: textInputType,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
          hintText: hintText,
          hintStyle: FontStyles.regularStyle(
              fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
        onSaved: (input) => value = input,
      ),
    );
  }
}
