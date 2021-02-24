import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int selectedIndex = 0;
  _callContent() {
    switch (selectedIndex) {
      case 0:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Id 4562455865',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    Text(
                      '12.03.2020',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
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
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Цена:',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 500 сум (2500 сум):',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/cards.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Оплата: Наличными',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.86,
                  height: 50,
                  child: RaisedButton(
                    elevation: 0,
                    color: Color(0xff9F111B),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Пожаловаться на клиента',
                      style: FontStyles.mediumStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        break;
      case 1:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Id 4562455865',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    Text(
                      '12.03.2020',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
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
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Цена:',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 500 сум (2500 сум):',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/cards.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Оплата: Наличными',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.86,
                  height: 50,
                  child: RaisedButton(
                    elevation: 0,
                    color: Color(0xff9F111B),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Пожаловаться на клиента',
                      style: FontStyles.mediumStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        break;
      default:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Id 4562455865',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    Text(
                      '12.03.2020',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
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
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Цена:',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 500 сум (2500 сум):',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/cards.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Оплата: Наличными',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.86,
                  height: 50,
                  child: RaisedButton(
                    elevation: 0,
                    color: Color(0xff9F111B),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Пожаловаться на клиента',
                      style: FontStyles.mediumStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  _callContent2() {
    switch (selectedIndex) {
      case 0:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Id 4562455865',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    Text(
                      '12.03.2020',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
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
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Цена:',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 500 сум (2500 сум):',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/cards.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Оплата: Наличными',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        );

        break;
      case 1:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Id 4562455865',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    Text(
                      '12.03.2020',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
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
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Цена:',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 500 сум (2500 сум):',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/cards.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Оплата: была произведена онлайн',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        );

        break;
      default:
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Id 4562455865',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    Text(
                      '12.03.2020',
                      style: FontStyles.regularStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: MediaQuery.of(context).size.width * .1,
                        color: Colors.white,
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
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      'Цена:',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Color(0xff646974),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '12 500 сум (2500 сум):',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset('assets/images/cards.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Оплата: Наличными',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: 1,
                ),
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
        child: customAppBar(
          context,
          title: 'Мои заказы',
          onpress1: () => Get.back(),
        ),
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: ColorPalatte.strongRedColor,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 14),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffC3696F),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: ColorPalatte.strongRedColor,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: RaisedButton(
                          elevation: 0,
                          color: selectedIndex == 0
                              ? Colors.white
                              : Colors.transparent,
                          onPressed: () {
                            if (selectedIndex == 1 || selectedIndex == 2) {
                              setState(() {
                                selectedIndex = 0;
                              });
                              print(selectedIndex.toString());
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'За день',
                            style: FontStyles.boldStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: selectedIndex == 0
                                  ? Colors.black
                                  : Color(
                                      0xffCDE8F4,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: RaisedButton(
                          elevation: 0,
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.transparent,
                          onPressed: () {
                            if (selectedIndex == 0 || selectedIndex == 2) {
                              setState(() {
                                selectedIndex = 1;
                              });
                            }
                            print(selectedIndex.toString());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'За неделю',
                            style: FontStyles.boldStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: selectedIndex == 1
                                  ? Colors.black
                                  : Color(
                                      0xffCDE8F4,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      height: 44,
                      child: RaisedButton(
                        elevation: 0,
                        color: selectedIndex == 2
                            ? Colors.white
                            : Colors.transparent,
                        onPressed: () {
                          if (selectedIndex == 0 || selectedIndex == 1) {
                            setState(() {
                              selectedIndex = 2;
                            });
                          }
                          print(selectedIndex.toString());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'За месяц',
                          style: FontStyles.boldStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: selectedIndex == 2
                                ? Colors.black
                                : Color(
                                    0xffCDE8F4,
                                  ),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          _callContent(),
                          SizedBox(
                            height: 15,
                          ),
                          _callContent2(),
                          SizedBox(
                            height: 15,
                          ),
                          _callContent(),
                          SizedBox(
                            height: 15,
                          ),
                          _callContent2(),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
