import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class MyIcons extends StatelessWidget {
  final IconButton icon;
  Function onpress;
  MyIcons({this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.0,
      height: 56.0,
      decoration: BoxDecoration(
        color: ColorPalatte.callButtonBackground,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
