import 'package:HAMD_Delivery/models/plastic_card_model.dart';
import 'package:HAMD_Delivery/services/plastic_card_universal.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';

class PlasticCardUniversalController extends GetxController {
  var secondToken = MyPref.secondToken ?? '';
  var plasticUzCardList = List<Data>().obs;
  var plasticHumoCardList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    if (secondToken != null && secondToken != '') {
      fetchPlasticUzCard();
      fetchPlasticHumoCard();
    }
    super.onInit();
  }

  Future fetchPlasticUzCard() async {
    print('fetching plastic card');
    try {
      isLoading(true);
      var plasticCardUz = await PlasticCardUniversal.fetchPlasticUzCard();

      if (plasticCardUz != null) {
        plasticUzCardList.assignAll(plasticCardUz.data);
        // plasticCardTypeList.clear();
        // plasticCardTypeList.add(plasticCardType.data);
        // print(productByCategory);
      }
    } finally {
      isLoading(false);
    }
  }

  Future fetchPlasticHumoCard() async {
    print('fetching plastic card');
    try {
      isLoading(true);
      var plasticCardHumo = await PlasticCardUniversal.fetchPlasticHumoCard();

      if (plasticCardHumo != null) {
        plasticHumoCardList.assignAll(plasticCardHumo.data);
        // plasticCardTypeList.clear();
        // plasticCardTypeList.add(plasticCardType.data);
        // print(productByCategory);
      }
    } finally {
      isLoading(false);
    }
  }
}
