import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:flutter/material.dart';

class NewOrderCard extends StatefulWidget {
  NewOrderCard({Key key}) : super(key: key);

  @override
  _NewOrderCardState createState() => _NewOrderCardState();
}

class _NewOrderCardState extends State<NewOrderCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Text("LOL"),
      ),
      color: ColorPalatte.mainPageColor,
    );
  }
}
