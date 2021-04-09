import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/all_orders_model.dart';
import 'package:HAMD_Delivery/services/all_orders.dart';

class AllOrdersController extends GetxController {
  var allOrdersList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAllOrders();
    super.onInit();
  }

  Future fetchAllOrders() async {
    try {
      isLoading(true);
      var allOrders = await AllOrders.allOrders();
      if (allOrders != null) {
        // print('data $allCart');
        allOrdersList.assignAll(allOrders.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
