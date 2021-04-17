import 'package:HAMD_Delivery/models/plastic_card_model.dart';
import 'package:HAMD_Delivery/services/plastic_card.dart';
import 'package:get/get.dart';

class PlaticCardController extends GetxController {
  var plasticCardList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPlasticCard();
    super.onInit();
  }

  void fetchPlasticCard() async {
    print('fetching plastic card');
    try {
      isLoading(true);
      var plasticCard = await PlasticCard.fetchPlasticCard();

      if (plasticCard != null) {
        plasticCardList.assignAll(plasticCard.data);
        // productByCategoryList.clear();
        // productByCategoryList.add(productByCategory.data);
        // print(productByCategory);
      }
    } finally {
      isLoading(false);
    }
  }
}
