import 'package:HAMD_Delivery/controllers/accepted_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/ui/landing/landing_screen.dart';
import 'package:HAMD_Delivery/ui/main-orders/main-orders.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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

  var secondToken = MyPref.secondToken ?? '';

  @override
  void initState() {
    print('Second token: $secondToken');
    if (secondToken != null && secondToken != '') {
      profileController.fetchProfileData();
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
