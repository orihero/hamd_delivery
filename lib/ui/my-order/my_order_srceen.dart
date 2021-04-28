import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_day_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_month_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_orders_unversal_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_week_orders_controller.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/my-order/widgets/order_list_card_day.dart';
import 'package:HAMD_Delivery/ui/my-order/widgets/order_list_card_month.dart';
import 'package:HAMD_Delivery/ui/my-order/widgets/order_list_card_univeral.dart';
import 'package:HAMD_Delivery/ui/my-order/widgets/order_list_card_week.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  int selectedIndex = 0;
  final MyAcceptedOrdersUniversalController
      myAccpetedOrdersUniversalController =
      Get.find<MyAcceptedOrdersUniversalController>();
  @override
  void initState() {
    myAccpetedOrdersUniversalController.fetchAllAcceptedOrdersDay();
    myAccpetedOrdersUniversalController.fetchAllAcceptedOrdersWeek();
    myAccpetedOrdersUniversalController.fetchAllAcceptedOrdersMonth();
    super.initState();
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
                              myAccpetedOrdersUniversalController
                                  .fetchAllAcceptedOrdersDay();
                              print(selectedIndex.toString());
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'За день',
                            style: FontStyles.boldStyle(
                              fontSize: 13,
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
                              myAccpetedOrdersUniversalController
                                  .allAcceptedOrdersWeekList();
                            }
                            print(selectedIndex.toString());
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            'За неделю',
                            style: FontStyles.boldStyle(
                              fontSize: 13,
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
                            myAccpetedOrdersUniversalController
                                .allAcceptedOrdersMonthList();
                          }
                          print(selectedIndex.toString());
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          'За месяц',
                          style: FontStyles.boldStyle(
                            fontSize: 13,
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
            child: OrderListCardUniversal(
              selected: selectedIndex,
            ),
          ),
        ],
      ),
    );
  }
}
