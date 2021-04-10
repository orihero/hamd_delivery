import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_day_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_month_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_orders_unversal_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_week_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderListCardUniversal extends StatefulWidget {
  final int selected;

  const OrderListCardUniversal({Key key, @required this.selected})
      : super(key: key);

  @override
  _OrderListCardUniversalState createState() => _OrderListCardUniversalState();
}

class _OrderListCardUniversalState extends State<OrderListCardUniversal> {
  final MyAcceptedOrdersUniversalController
      myAccpetedOrdersUniversalController =
      Get.find<MyAcceptedOrdersUniversalController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var day = myAccpetedOrdersUniversalController.allAcceptedOrdersDayList;
      var week = myAccpetedOrdersUniversalController.allAcceptedOrdersWeekList;
      var month =
          myAccpetedOrdersUniversalController.allAcceptedOrdersMonthList;
      if (myAccpetedOrdersUniversalController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorPalatte.strongRedColor,
            ),
          ),
        );
      }
      if (widget.selected == 0) {
        if (day == null &&
            !myAccpetedOrdersUniversalController.isLoading.value) {
          return Center(
            child: Text('you have not accepted order for day'),
          );
        }
      } else if (widget.selected == 1) {
        if (week == null &&
            !myAccpetedOrdersUniversalController.isLoading.value) {
          return Center(
            child: Text('you have not accepted order for week'),
          );
        }
      } else if (widget.selected == 2) {
        if (month == null &&
            !myAccpetedOrdersUniversalController.isLoading.value) {
          return Center(
            child: Text('you have not accepted order for month'),
          );
        }
      }
      // if (accWeekCon.isLoading.value) {
      //   return Center(
      //     child: CircularProgressIndicator(
      //       valueColor: AlwaysStoppedAnimation<Color>(
      //         ColorPalatte.strongRedColor,
      //       ),
      //     ),
      //   );
      // } else {
      return RefreshIndicator(
        color: ColorPalatte.strongRedColor,
        onRefresh: () {
          if (widget.selected == 0)
            return myAccpetedOrdersUniversalController
                .fetchAllAcceptedOrdersDay();
          else if (widget.selected == 1)
            return myAccpetedOrdersUniversalController
                .fetchAllAcceptedOrdersWeek();
          return myAccpetedOrdersUniversalController
              .fetchAllAcceptedOrdersMonth();
        },
        child: ListView.builder(
          itemCount: widget.selected == 0
              ? myAccpetedOrdersUniversalController
                  .allAcceptedOrdersDayList.length
              : widget.selected == 1
                  ? myAccpetedOrdersUniversalController
                      .allAcceptedOrdersWeekList.length
                  : myAccpetedOrdersUniversalController
                      .allAcceptedOrdersMonthList.length,
          itemBuilder: (context, index) => Container(
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
                        'Id: ${widget.selected == 0 ? myAccpetedOrdersUniversalController.allAcceptedOrdersDayList[index].id : widget.selected == 1 ? myAccpetedOrdersUniversalController.allAcceptedOrdersWeekList[index].id : myAccpetedOrdersUniversalController.allAcceptedOrdersMonthList[index].id}',
                        style: FontStyles.regularStyle(
                          fontSize: 14,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      Text(
                        '${widget.selected == 0 ? myAccpetedOrdersUniversalController.allAcceptedOrdersDayList[index].date : widget.selected == 1 ? myAccpetedOrdersUniversalController.allAcceptedOrdersWeekList[index].date : myAccpetedOrdersUniversalController.allAcceptedOrdersMonthList[index].date}',
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
          ),
        ),
      );
    });
  }
}
