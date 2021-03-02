import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/my-order/widgets/order_list_card.dart';
import 'package:HAMD_Delivery/ui/my-order/widgets/order_list_card2.dart';
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
        return OrderListCard();
        break;
      case 1:
        return OrderListCard();

        break;
      default:
        return OrderListCard();
    }
  }

  _callContent2() {
    switch (selectedIndex) {
      case 0:
        return OrderListCard2();
        break;
      case 1:
        return OrderListCard2();
        break;
      default:
        return OrderListCard2();
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
