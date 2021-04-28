import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/all_orders_model.dart';
import 'package:HAMD_Delivery/services/all_orders.dart';

class AllOrdersController extends GetxController {
  var allOrdersList = List<Datam>().obs;
  var isLoading = true.obs;
  var secondToken = MyPref.secondToken ?? '';

  @override
  void onInit() {
    // if (secondToken != null && secondToken != '') {}
    fetchAllOrders();
    super.onInit();
  }

  Future fetchAllOrders() async {
    try {
      isLoading(true);
      var allOrders = await AllOrders.allOrders();
      if (allOrders != null) {
        allOrdersList.assignAll(allOrders.data);
        print('data $allOrders');
      }
    } finally {
      isLoading(false);
    }
  }
}
