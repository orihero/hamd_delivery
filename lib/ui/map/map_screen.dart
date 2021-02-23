import 'package:HAMD_Delivery/ui/map/my_drewer/my_drewer.dart';
import 'package:HAMD_Delivery/ui/map/widgets/map_screen_content.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(),
      drawer: Drawer(
        child: MyDrewer(),
      ),
      body: MapScreenContent(),
    );
  }
}
