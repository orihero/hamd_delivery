import 'dart:convert';
import 'dart:io';

import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD_Delivery/models/all_orders_model.dart';

class AllOrdersApi {
  static var client = http.Client();

  Future<AllOrdersModel> fetchAllOrdersProvider() async {
    final token = MyPref.secondToken ?? '';

    var response = await client.get(
      'http://hamd.loko.uz/api/order/courier-list',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      print('fetching all orders success with provide');
      var jsonString = AllOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('failure fetching all orders success with provide');
      print(response.reasonPhrase);

      return AllOrdersModel(data: []);
    }
  }
}
