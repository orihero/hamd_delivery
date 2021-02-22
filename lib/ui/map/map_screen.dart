import 'package:HAMD_Delivery/ui/map/my_drewer/my_drewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: MyDrewer(),
      ),
      body: Center(
        child: Text('Map Screen'),
      ),
    );
  }
}
