import 'package:HAMD_Delivery/models/all_orders_model.dart';
import 'package:HAMD_Delivery/services/all_order_provider.dart';
import 'package:flutter/cupertino.dart';

class AllOrderPrivder with ChangeNotifier {
  AllOrdersModel _allOrdersModel = AllOrdersModel(data: []);
  AllOrdersApi _allOrdersApi = AllOrdersApi();

  AllOrdersModel get allOrderModel => _allOrdersModel;

  set allOrderModel(AllOrdersModel allOrdersModel) {
    _allOrdersModel = allOrdersModel;
    notifyListeners();
  }

  Future<void> fetchAllOrders() async {
    allOrderModel = await _allOrdersApi.fetchAllOrdersProvider();
  }
}
