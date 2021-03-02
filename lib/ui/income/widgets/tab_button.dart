import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String title;
  final String income;

  TabButton({this.title, this.income});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Text(
              title,
              style: FontStyles.boldStyle(
                fontSize: 14,
                fontFamily: 'Montserrat',
                color: Color(0xff232323),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              income,
              style: FontStyles.boldStyle(
                fontSize: 25,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
