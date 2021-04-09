import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:HAMD_Delivery/models/my_income_model.dart';
import 'dart:convert';
import 'dart:io';

class MyIcome {
  static var client = http.Client();

  ///this is for a day
  static Future fetchMyIncomeDay() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/earn?sort=day',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' my income for day');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in my income for day');
      print('*********');
      print(response.body);
      var jsonString = MyIncomeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in my income for day services');
      print(response.reasonPhrase);
    }
  }

  //this for week
  static Future fetchMyIncomeWeek() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/earn?sort=week',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' my income for week');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in my income for week');
      print('*********');
      print(response.body);
      var jsonString = MyIncomeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in my income for week services');
      print(response.reasonPhrase);
    }
  }

  //this for month
  static Future fetchMyIncomeMonth() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      'http://hamd.loko.uz/api/earn?sort=month',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(' my income for month');
    print(response.request);
    if (response.statusCode == 200) {
      print('*********');
      print('success in my income for month');
      print('*********');
      print(response.body);
      var jsonString = MyIncomeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in my income for month services');
      print(response.reasonPhrase);
    }
  }
}
