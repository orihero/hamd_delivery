import 'package:HAMD_Delivery/services/my_accepted_order_month.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/my_accepted_orders_model.dart';

class AcceptedOrdersMonthController extends GetxController {
  var allAcceptedOrdersMonthList = List<Data>().obs;
  var isLoading = true.obs;
  var secondToken = MyPref.secondToken ?? '';
  @override
  void onInit() {
    if (secondToken != null && secondToken != '') {
      fetchAllAcceptedOrdersMonth();
    }
    super.onInit();
  }

  Future fetchAllAcceptedOrdersMonth() async {
    try {
      isLoading(true);
      var allAcceptedOrdersMonth =
          await MyAcceptedMonthOrders.myAcceptedMonthOrders();
      if (allAcceptedOrdersMonth != null) {
        // print('data $allCart');
        allAcceptedOrdersMonthList.assignAll(allAcceptedOrdersMonth.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
