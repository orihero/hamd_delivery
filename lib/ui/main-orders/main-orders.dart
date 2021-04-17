import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/accepted_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/screen_controller.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/accpted_order.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/all_order_card.dart';
import 'package:HAMD_Delivery/ui/my-drewer/my_drewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainOrders extends StatefulWidget {
  @override
  _MainOrdersState createState() => _MainOrdersState();
}

class _MainOrdersState extends State<MainOrders> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  // int selectedIndex = 0;
  final AllOrdersController allOrdersController =
      Get.find<AllOrdersController>();
  final AcceptedOrdersController acceptedOrdersController =
      Get.find<AcceptedOrdersController>();
  final ScreenController screenController = Get.find<ScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .85,
        child: Drawer(
          child: MyDrewer(),
        ),
      ),
      appBar: PreferredSize(
        child: customAppBar(context,
            title: 'Главная',
            onpress1: () => _openDrawer(),
            icon: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 26,
                ),
                onPressed: _openDrawer)),
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top),
      ),
      body: Obx(() {
        return Column(
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
                            color: screenController.screenIndex.value == 0
                                ? Colors.white
                                : Colors.transparent,
                            onPressed: () {
                              if (screenController.screenIndex.value == 1) {
                                screenController.selectOne();
                                allOrdersController.fetchAllOrders();
                                // print(selectedIndex.toString());
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'Все заказы',
                              style: FontStyles.boldStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                color: screenController.screenIndex.value == 0
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
                            color: screenController.screenIndex.value == 1
                                ? Colors.white
                                : Colors.transparent,
                            onPressed: () {
                              if (screenController.screenIndex.value == 0) {
                                screenController.selectTwo();
                                acceptedOrdersController
                                    .fetchAllAcceptedOrders();
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              'Принятые заказы',
                              style: FontStyles.boldStyle(
                                fontSize: 13,
                                fontFamily: 'Montserrat',
                                color: screenController.screenIndex.value == 1
                                    ? Colors.black
                                    : Color(
                                        0xffCDE8F4,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: screenController.screenIndex.value == 0
                  ? AllOrderCard()
                  : AccptedOrders(),
            ),

            //  selectedIndex == 0 ? AllOrderCard() : AccptedOrders()),
          ],
        );
      }),
    );
  }
}
