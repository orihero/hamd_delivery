import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';

class MenuOptions extends StatelessWidget {
  final String title;
  final Function onpress;
  MenuOptions({this.title, this.onpress});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Text(
          title,
          style: FontStyles.regularStyle(
            fontSize: 15,
            fontFamily: 'Ubuntu',
            color: Color(0xff232323),
          ),
        ),
      ),
    );
  }
}
