import 'package:HAMD_Delivery/controllers/accepted_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_month_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_income_controller.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/services/my_accepted_orders_day.dart';
import 'package:HAMD_Delivery/ui/landing/landing_screen.dart';
import 'package:HAMD_Delivery/ui/main-orders/main-orders.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/my_accepted_day_orders_controller.dart';
import 'controllers/my_accepted_week_orders_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserProfileController profileController =
      Get.put(UserProfileController());

  final AllOrdersController allOrdersController =
      Get.put(AllOrdersController());
  final AcceptedOrdersController acceptedOrdersController =
      Get.put(AcceptedOrdersController());
  final AcceptedOrdersMonthController accMonth =
      Get.put(AcceptedOrdersMonthController());
  final AcceptedOrdersWeekController accWeek =
      Get.put(AcceptedOrdersWeekController());
  final AcceptedOrdersDayController accDay =
      Get.put(AcceptedOrdersDayController());
  final MyIncomeController myIncomeController = Get.put(MyIncomeController());
  var secondToken = MyPref.secondToken ?? '';

  @override
  void initState() {
    print('Second token: $secondToken');
    if (secondToken != null && secondToken != '') {
      profileController.fetchProfileData();
      allOrdersController.fetchAllOrders();
      accMonth.allAcceptedOrdersMonthList();
      accWeek.allAcceptedOrdersWeekList();
      accDay.fetchAllAcceptedOrdersDay();
      myIncomeController.myIncomeDayList();
      myIncomeController.myIncomeWeekList();
      myIncomeController.myIncomeMonthList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyPref.secondToken == null ? LandingScreen() : MainOrders(),
    );
  }
}

// LayoutBuilder(builder: (context, constraints) {
//       return OrientationBuilder(builder: (context, orientation) {
//         SizerUtil().init(constraints, orientation);}}
