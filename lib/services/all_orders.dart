import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD_Delivery/models/all_orders_model.dart';
import 'dart:convert';
import 'dart:io';

class AllOrders {
  static var client = http.Client();
  static Future allOrders() async {
    final token = MyPref.secondToken ?? '';

    var response = await client.get(
      'http://hamd.loko.uz/api/order/courier-list',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    print('all order list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in all orders');
      print('*********');
      print(response.body);
      var jsonString = AllOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all orders services');
      print(response.reasonPhrase);
    }
  }
}
