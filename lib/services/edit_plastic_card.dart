import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:HAMD_Delivery/controllers/platic_card_humo_controller.dart';

class EditPlasticCard {
  static var client = http.Client();
  static Future editPlasticCard({
    int id,
    String cardNumber,
    String cardPhoneNumber,
    String cardExpire,
    bool isUzCard,
  }) async {
    final PlasticCardHumoController plasticCardHumoController =
        Get.find<PlasticCardHumoController>();
    final PlasticCardTypeController plasticCardUzcardController =
        Get.find<PlasticCardTypeController>();
    final token = MyPref.secondToken ?? '';
    var response = await client.post(
      'http://hamd.loko.uz/api/card/update',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      body: {
        'id': id.toString(),
        'type_id': isUzCard ? '14' : '15',
        'card_number': cardNumber,
        'card_phone_number': cardPhoneNumber,
        'card_expire': cardExpire,
      },
    );
    print('edit card  service');
    print(response.request);
    print(response.body);

    if (response.statusCode == 200) {
      print('*********');
      print('success in  edit plastic card  service ');
      print('*********');
      print(response.body);
      Get.back();
      isUzCard
          ? await plasticCardUzcardController.fetchPlasticCardType(14)
          : await plasticCardHumoController.fetchPlasticCardHumo(15);
    } else {
      print('error in edit plastic card');
      print(response.reasonPhrase);
    }
  }
}
