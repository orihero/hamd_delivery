import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:HAMD_Delivery/models/my_accepted_orders_model.dart';

class MyAcceptedAllOrders {
  static var client = http.Client();

  static Future myAcceptedAllOrders() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/order/courier-list-mine?status=1',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print('all my accepted order list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in all accepted orders');
      print('*********');
      print(response.body);
      var jsonString =
          MyAcceptedOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in all my accepted orders services');
      print(response.reasonPhrase);
    }
  }
}
