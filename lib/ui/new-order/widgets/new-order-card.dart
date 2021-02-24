import 'dart:async';

import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/current-order/current-order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NewOrderCard extends StatefulWidget {
  NewOrderCard({Key key}) : super(key: key);

  @override
  _NewOrderCardState createState() => _NewOrderCardState();
}

class _NewOrderCardState extends State<NewOrderCard> {
  Timer timer;
  int countDown = 10;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (countDown < 0) {
        t.cancel();
      }
      setState(() {
        countDown--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    String count =
        "0${(countDown / 60).round()}:${countDown % 60 < 10 ? "0${countDown % 60}" : countDown % 60}";
    return Container(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            InkWell(
              child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: CircularPercentIndicator(
                  radius: 180.0,
                  lineWidth: 6.0,
                  animation: true,
                  animationDuration: 1000 * 10,
                  percent: 1.0,
                  animateFromLastPercent: true,
                  center: Column(
                    children: [
                      Text(
                        "Заказ",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 20.0),
                      ),
                      Text(
                        count,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32.0,
                            color: Colors.red),
                      ),
                      Text(
                        "ПРИНЯТЬ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: ColorPalatte.green,
                ),
              ),
              onTap: () {
                Get.to(CurrentOrder());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Наличка: 57 000 сум',
                      style: FontStyles.boldStyle(
                        fontSize: 23,
                        fontFamily: 'Montserrat',
                        color: Color(0xff232323),
                      ),
                    ),
                    Text(
                      'Стоимость доставки: 8 550 сум',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xffAAAEB7),
                      ),
                    ),
                  ],
                ),
                Text(
                  "3 км",
                  style: TextStyle(color: Color(0xffAAAEB7), fontSize: 18),
                )
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .1,
                    color: ColorPalatte.mainPageColor,
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          height: 35,
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffB6C5EE),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffB6C5EE),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffB6C5EE),
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff9F111B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  flex: 9,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Заказ из',
                          style: FontStyles.regularStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Color(0xffAAAEB7),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'HAMD центральный филиал',
                          style: FontStyles.boldStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Color(0xff232323),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Едем в',
                          style: FontStyles.regularStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Color(0xffAAAEB7),
                          ),
                        ),
                        Text(
                          'Ул. Нукусская, 92, кв.21',
                          style: FontStyles.boldStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Color(0xff232323),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(15), right: Radius.circular(15)),
        color: ColorPalatte.mainPageColor,
      ),
    );
  }
}
