import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:HAMD_Delivery/models/my_accepted_orders_model.dart';

class MyAcceptedOrdersUniversal {
  static var client = http.Client();
  //this is for day
  static Future myAcceptedDayOrders() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/order/courier-list-mine?sort=day',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' my day accepted order list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in day accepted orders');
      print('*********');
      print(response.body);
      var jsonString =
          MyAcceptedOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in my day accepted orders services');
      print(response.reasonPhrase);
    }
  }

  //this is for week
  static Future myAcceptedWeekOrders() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/order/courier-list-mine?sort=week',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' my week accepted order list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in week accepted orders');
      print('*********');
      print(response.body);
      var jsonString =
          MyAcceptedOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in my week accepted orders services');
      print(response.reasonPhrase);
    }
  }

  //this is for month
  static Future myAcceptedMonthOrders() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/order/courier-list-mine?sort=month',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' my month accepted order list');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in month accepted orders');
      print('*********');
      print(response.body);
      var jsonString =
          MyAcceptedOrdersModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in my month accepted orders services');
      print(response.reasonPhrase);
    }
  }
}
