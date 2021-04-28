import 'package:HAMD_Delivery/services/repository.dart';
import 'package:HAMD_Delivery/ui/main-orders/main-orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Repository repository = Repository();
  @override
  void initState() {
    print('this is initsate in splash screen');
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_callApi);
  }

  _gotToNextPage() {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(
        builder: (_) => MainOrders(),
      ),
    );
  }

  _callApi(_) {
    repository.fetchOrders(context);
    _gotToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Material();
  }
}
