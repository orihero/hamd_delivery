import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/screen_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'dart:io';

class AcceptOrder {
  static var client = http.Client();
  static Future acceptOrder(int orderId) async {
    final AllOrdersController allOrdersController =
        Get.find<AllOrdersController>();
    final ScreenController screenController = Get.find<ScreenController>();
    final token = MyPref.secondToken ?? '';
    var response = await client.post(
      'http://hamd.loko.uz/api/order/courier-accept',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        'order_id': orderId.toString(),
      },
    );

    if (response.statusCode == 200) {
      print('*********');
      print('success in accepting products');
      print('********* accepted order id is:');
      print(response.body);
    } else {
      print('error in accepting products');
      print(response.reasonPhrase);
    }
  }
}
