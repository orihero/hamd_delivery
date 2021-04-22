import 'package:HAMD_Delivery/provider/all_order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Repository {
  Future<void> fetchOrders(BuildContext context) async {
    AllOrderPrivder allOrderPrivder = Provider.of(context, listen: false);
    await allOrderPrivder.fetchAllOrders();
  }
}
