import 'package:get/get.dart';
import 'package:HAMD_Delivery/services/accepted_orders_services.dart';
import 'package:HAMD_Delivery/models/accepted_orders_model.dart';

class AcceptedOrdersController extends GetxController {
  var allAcceptedOrdersList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchAllAcceptedOrders();
    super.onInit();
  }

  Future fetchAllAcceptedOrders() async {
    try {
      isLoading(true);
      var allAcceptedOrders = await AcceptedOrdersServices.allAcceptedOrders();
      if (allAcceptedOrders != null) {
        // print('data $allCart');
        allAcceptedOrdersList.assignAll(allAcceptedOrders.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
