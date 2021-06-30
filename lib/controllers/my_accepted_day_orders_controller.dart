import 'package:HAMD_Delivery/services/my_accepted_orders_day.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/my_accepted_orders_model.dart';

class AcceptedOrdersDayController extends GetxController {
  var allAcceptedOrdersDayList = List<Data>().obs;
  var isLoading = true.obs;
  var secondToken = MyPref.secondToken ?? '';
  @override
  void onInit() {
    if (secondToken != null && secondToken != '') {
      fetchAllAcceptedOrdersDay();
    }
    super.onInit();
  }

  Future fetchAllAcceptedOrdersDay() async {
    try {
      isLoading(true);
      var allAcceptedOrdersDay =
          await MyAcceptedDayOrders.myAcceptedDayOrders();
      if (allAcceptedOrdersDay != null) {
        // print('data $allCart');
        allAcceptedOrdersDayList.assignAll(allAcceptedOrdersDay.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
