import 'dart:convert';
import 'dart:io';

import 'package:HAMD_Delivery/constants/api.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/models/auth/code_confirm_model.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConfirmCode {
  static UserProfileController pController = Get.find<UserProfileController>();

  static var client = http.Client();
  static Future codeConfirmFunction({String code}) async {
    final token = MyPref.token ?? '';
    var response = await client.post(
      ApiUrl.sendSmsCode,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        'code': code,
      },
    );
    print('condirm code part');
    print(response.request);
    if (response.statusCode == 200) {
      var body = CodeConfirmModel.fromJson(json.decode(response.body));
      print('confrim token');
      print(response.body);
      MyPref.secondToken = body.data.token;
      print('token after confirm');
      print(MyPref.secondToken);
      print('my fcmToken is ');
      print(body.data.deviceToken);
      print(body.data.phone);
      pController.fetchProfileData();
      return body;
    } else {
      print(response.reasonPhrase);
    }
  }
}
