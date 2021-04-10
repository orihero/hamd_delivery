import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/my_accepted_orders_model.dart';
import 'package:HAMD_Delivery/services/my_accepted_orders_universal.dart';

class MyAcceptedOrdersUniversalController extends GetxController {
  var isLoading = true.obs;
  var secondToken = MyPref.secondToken ?? '';
  var allAcceptedOrdersDayList = List<Data>().obs;
  var allAcceptedOrdersWeekList = List<Data>().obs;
  var allAcceptedOrdersMonthList = List<Data>().obs;

  @override
  void onInit() {
    if (secondToken != null && secondToken != '') {}
    super.onInit();
  }

  Future fetchAllAcceptedOrdersDay() async {
    try {
      isLoading(true);
      var allAcceptedOrdersDay =
          await MyAcceptedOrdersUniversal.myAcceptedDayOrders();
      if (allAcceptedOrdersDay != null) {
        allAcceptedOrdersDayList.clear();
        allAcceptedOrdersDayList.assignAll(allAcceptedOrdersDay.data);
        print('data $allAcceptedOrdersDay');
      }
    } finally {
      isLoading(false);
    }
  }

  Future fetchAllAcceptedOrdersWeek() async {
    try {
      isLoading(true);
      var allAcceptedOrdersWeek =
          await MyAcceptedOrdersUniversal.myAcceptedWeekOrders();
      if (allAcceptedOrdersWeek != null) {
        allAcceptedOrdersWeekList.clear();
        allAcceptedOrdersWeekList.assignAll(allAcceptedOrdersWeek.data);
        print('data $allAcceptedOrdersWeek');
      }
    } finally {
      isLoading(false);
    }
  }

  Future fetchAllAcceptedOrdersMonth() async {
    try {
      isLoading(true);
      var allAcceptedOrdersMonth =
          await MyAcceptedOrdersUniversal.myAcceptedMonthOrders();
      if (allAcceptedOrdersMonth != null) {
        allAcceptedOrdersMonthList.clear();
        allAcceptedOrdersMonthList.assignAll(allAcceptedOrdersMonth.data);
        print('data $allAcceptedOrdersMonth');
      }
    } finally {
      isLoading(false);
    }
  }
}
