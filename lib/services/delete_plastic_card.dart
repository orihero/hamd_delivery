import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:HAMD_Delivery/controllers/platic_card_humo_controller.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:HAMD_Delivery/models/plastic_card_model.dart';

class DeletePlasticCard {
  static var client = http.Client();
  static Future deletePlasticCard({int cardId, bool isUzCard}) async {
    final PlasticCardHumoController plasticCardHumoController =
        Get.find<PlasticCardHumoController>();
    final PlasticCardTypeController plasticCardUzcardController =
        Get.find<PlasticCardTypeController>();
    final token = MyPref.secondToken ?? '';
    var response =
        await client.post('http://hamd.loko.uz/api/card/remove', headers: {
      HttpHeaders.authorizationHeader: 'Bearer $token'
    }, body: {
      'id': cardId.toString(),
    });
    print('remove card  service');
    print(response.request);
    print(response.body);
    if (response.statusCode == 200) {
      print('*********');
      print('success in  removing plastic card  service ');
      print('*********');
      print(response.body);

      isUzCard
          ? await plasticCardUzcardController.fetchPlasticCardType(14)
          : await plasticCardHumoController.fetchPlasticCardHumo(15);

      var jsonString = PlaticCardTypeModel.fromJson(json.decode(response.body));
      return jsonString;
    } else {
      print('error in remove plastic card');
      print(response.reasonPhrase);
    }
  }
}
