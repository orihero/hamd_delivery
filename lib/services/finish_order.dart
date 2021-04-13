import 'package:http/http.dart' as http;
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'dart:io';

class FinishOrder {
  static var client = http.Client();
  static Future finishOrder(int productId) async {
    final token = MyPref.secondToken ?? '';
    var response = await client.post(
      'http://hamd.loko.uz/api/order/courier-finish',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        'order_id': productId.toString(),
      },
    );
    print('here i am checking');
    print(response.body);

    if (response.statusCode == 200) {
      print('*********');
      print('success in finishing order');

      print(response.body);
    } else {
      print('error in finishing order');
      print(response.reasonPhrase);
    }
  }
}
