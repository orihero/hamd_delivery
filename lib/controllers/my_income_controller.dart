import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/models/my_income_model.dart';
import 'package:HAMD_Delivery/services/my_income.dart';

class MyIncomeController extends GetxController {
  var secondToken = MyPref.secondToken ?? '';
  var myIncomeDayList = List<Data>().obs;
  var myIncomeWeekList = List<Data>().obs;
  var myIncomeMonthList = List<Data>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    if (secondToken != null && secondToken != '') {
      fetchMyIncomeDay();
      fetchMyIncomeWeek();
      fetchMyIncomeMonth();
    }
    super.onInit();
  }

  Future fetchMyIncomeDay() async {
    try {
      isLoading(true);
      var incomeDay = await MyIcome.fetchMyIncomeDay();
      if (incomeDay != null) {
        myIncomeDayList.clear();
        myIncomeDayList.add(incomeDay.data);
        print('data $incomeDay');
      }
    } finally {
      isLoading(false);
    }
  }

  Future fetchMyIncomeWeek() async {
    try {
      isLoading(true);
      var incomeWeek = await MyIcome.fetchMyIncomeDay();
      if (incomeWeek != null) {
        myIncomeWeekList.clear();
        myIncomeWeekList.add(incomeWeek.data);
        print('data $incomeWeek');
      }
    } finally {
      isLoading(false);
    }
  }

  Future fetchMyIncomeMonth() async {
    try {
      isLoading(true);
      var incomeMonth = await MyIcome.fetchMyIncomeDay();
      if (incomeMonth != null) {
        myIncomeMonthList.clear();
        myIncomeMonthList.add(incomeMonth.data);
        print('data $incomeMonth');
      }
    } finally {
      isLoading(false);
    }
  }
}
