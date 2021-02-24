import 'package:HAMD_Delivery/ui/map/widgets/map_screen_content.dart';
import 'package:HAMD_Delivery/ui/my-drewer/my_drewer.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   appBar: AppBar(),
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .95,
        child: Drawer(
          child: MyDrewer(),
        ),
      ),
      body: MapScreenContent(),
      key: _scaffoldKey,
    );
  }
}
