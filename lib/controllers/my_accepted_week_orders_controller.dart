import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/my_accepted_orders_model.dart';
import 'package:HAMD_Delivery/services/my_accepted_orders_week.dart';

class AcceptedOrdersWeekController extends GetxController {
  var allAcceptedOrdersWeekList = List<Data>().obs;
  var isLoading = true.obs;
  var secondToken = MyPref.secondToken ?? '';

  @override
  void onInit() {
    if (secondToken != null && secondToken != '') {
      fetchAllAcceptedOrdersWeek();
    }
    super.onInit();
  }

  Future fetchAllAcceptedOrdersWeek() async {
    try {
      isLoading(true);
      var allAcceptedOrdersWeek =
          await MyAcceptedWeekOrders.myAcceptedWeekOrders();
      if (allAcceptedOrdersWeek != null) {
        // print('data $allCart');
        allAcceptedOrdersWeekList.assignAll(allAcceptedOrdersWeek.data);
      }
    } finally {
      isLoading(false);
    }
  }
}
