import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar customAppBar(
  BuildContext context, {
  String title,
  Function onpress1,
  double width1,
  double height1,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorPalatte.strongRedColor,
    elevation: 0,
    flexibleSpace: Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 26, bottom: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 26,
                  ),
                  onPressed: onpress1),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 250,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: FontStyles.boldStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
