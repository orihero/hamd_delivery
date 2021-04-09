import 'dart:convert';
import 'dart:io';

import 'package:HAMD_Delivery/constants/api.dart';
import 'package:HAMD_Delivery/models/auth/code_confirm_model.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:http/http.dart' as http;

class ProfileFetch {
  static var client = http.Client();
  static Future profileFetch() async {
    final token = MyPref.secondToken ?? '';
    var response = await client.get(
      ApiUrl.profile,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    print(response.request);
    if (response.statusCode == 200) {
      var body = CodeConfirmModel.fromJson(json.decode(response.body));
      print('User Data: ${response.body}');
      return body;
    } else {
      print(response.reasonPhrase);
    }
  }
}
