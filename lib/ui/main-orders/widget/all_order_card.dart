import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/screen_controller.dart';
import 'package:HAMD_Delivery/services/accept_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AllOrderCard extends StatefulWidget {
  @override
  _AllOrderCardState createState() => _AllOrderCardState();
}

class _AllOrderCardState extends State<AllOrderCard> {
  final AllOrdersController allOrdersController =
      Get.find<AllOrdersController>();
  final ScreenController screenController = Get.find<ScreenController>();

  @override
  void initState() {
    allOrdersController.fetchAllOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(allOrdersController.allOrdersList.length);
    return Obx(() {
      if (allOrdersController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorPalatte.strongRedColor,
            ),
          ),
        );
      }
      return RefreshIndicator(
        color: ColorPalatte.strongRedColor,
        onRefresh: () => allOrdersController.fetchAllOrders(),
        child: allOrdersController.allOrdersList.isEmpty
            ? ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text('Заказов пока нет'),
                      ),
                    ],
                  )
                ],
              )
            : ListView.separated(
                itemCount: allOrdersController.allOrdersList.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) => Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 19),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID: ' +
                                  allOrdersController.allOrdersList[index].id
                                      .toString(),
                              style: FontStyles.regularStyle(
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                color: Color(0xff646974),
                              ),
                            ),
                            Text(
                              allOrdersController.allOrdersList[index].date
                                  .toString(),
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
                              'Цена:  ' +
                                  allOrdersController
                                      .allOrdersList[index].productTotalSum
                                      .toString() +
                                  'сум' +
                                  ' (2500 сум)',
                              style: FontStyles.regularStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                color: Color(0xff646974),
                              ),
                            ),
                            SizedBox(
                              width: 5,
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
                        index == 0
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width * 0.86,
                                height: 50,
                                child: RaisedButton(
                                  elevation: 0,
                                  color: Color(0xff9F111B),
                                  onPressed: () async {
                                    await AcceptOrder.acceptOrder(
                                        allOrdersController
                                            .allOrdersList[index].id);
                                    screenController.selectTwo();
                                    allOrdersController.fetchAllOrders();
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Text(
                                    'Принять заказ',
                                    style: FontStyles.mediumStyle(
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
