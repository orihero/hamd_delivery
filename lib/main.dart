import 'package:HAMD_Delivery/controllers/accepted_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_month_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/my_accepted_orders_unversal_controller.dart';
import 'package:HAMD_Delivery/controllers/my_income_controller.dart';
import 'package:HAMD_Delivery/controllers/my_profile_controller.dart';
import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:HAMD_Delivery/controllers/platic_card_humo_controller.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/controllers/screen_controller.dart';
import 'package:HAMD_Delivery/provider/all_order_provider.dart';
import 'package:HAMD_Delivery/ui/landing/landing_screen.dart';

import 'package:HAMD_Delivery/ui/main-orders/widget/splash_screen.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/my_accepted_day_orders_controller.dart';
import 'controllers/my_accepted_week_orders_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
  final MyAcceptedOrdersUniversalController
      myAcceptedOrdersUniversalController =
      Get.put(MyAcceptedOrdersUniversalController());
  final ScreenController screenController = Get.put(ScreenController());
  final MyProfileController myProfileController =
      Get.put(MyProfileController());

  final PlasticCardHumoController plasticCardHumoController =
      Get.put(PlasticCardHumoController());
  final PlasticCardTypeController plasticCardTypeController =
      Get.put(PlasticCardTypeController());

  var secondToken = MyPref.secondToken ?? '';

  @override
  void initState() {
    print('Second token: $secondToken');
    if (secondToken != null && secondToken != '') {
      myProfileController.fetchMyProfileData();
      profileController.fetchProfileData();
      // allOrdersController.fetchAllOrders();
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
    return ChangeNotifierProvider(
      create: (_) => AllOrderPrivder(),
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MyPref.secondToken == null ? LandingScreen() : FirstTab(),
        // home: MyPref.secondToken == null ? LandingScreen() : MainOrderTab(),
        home: MyPref.secondToken == null ? LandingScreen() : SplashScreen(),
        // home: MyPref.secondToken == null ? LandingScreen() : MainOrders(),
      ),
    );
  }
}

// LayoutBuilder(builder: (context, constraints) {
//       return OrientationBuilder(builder: (context, orientation) {
//         SizerUtil().init(constraints, orientation);}}

//vscode://vscode.github-authentication/did-authenticate?windowid=4&code=ad99bbbea9b4e93753dc&state=9e00441d-6439-40b1-a322-06388b51745e
